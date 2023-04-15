`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:41:18 12/01/2022 
// Design Name: 
// Module Name:    top_level 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module ALU(FS, A, B, out);

	parameter nBit = 16;
	
	input [2:0] FS;
	input [nBit-1:0] A, B;
	
	output reg [nBit-1:0] out;
	
	wire [nBit-1:0] arith_out;
	
	add_sub #(nBit) CE1(.A(A),
							  .B(B),
							  .cond(FS[0]),
							  .out(arith_out));
	
	always@(*)
	begin
		if(FS[2:1] == 2'b00)
			out <= arith_out;
		else if(FS[2] || FS[1])
		begin
			case(FS[1:0])
				2'b10: out <= A & B;
				2'b11: out <= A | B;
				2'b00: out <= A ^ B;
				2'b01: out <= ~A;
			endcase
		end
	end
		
endmodule

module CPU(data_from_rom, reset, clk, address_to_rom, enable_to_rom, data_from_ram, data_to_ram, write_enable_to_ram, address_to_ram, read_enable_to_ram, enable_ram_read);

	parameter nBit = 16;
	
	input [nBit-1:0] data_from_rom, data_from_ram;
	input clk, reset;
	
	output [nBit-1:0] data_to_ram;
	output [5:0] address_to_rom, address_to_ram;
	output enable_to_rom, write_enable_to_ram, read_enable_to_ram, enable_ram_read;
	
	wire [nBit-1:0] A;
	wire [5:0] PC, PC_prev;
	wire [3:0] DA, AA, BA;
	wire [2:0] FS;
	wire zero_flag, IL, RW, MB, MD, MJ, MM, MW, MK, A_thru, B_thru, done;
	
	controller #(nBit) T1(.A(A),
								 .data_from_rom(data_from_rom),
								 .zero_flag(zero_flag),
								 .clk(clk), .reset(reset),
								 .DA(DA),
								 .AA(AA),
								 .BA(BA),
								 .FS(FS),
								 .IL(IL),
								 .RW(RW),
								 .MB(MB),
								 .MD(MD),
								 .MJ(MJ),
								 .MM(MM),
								 .MW(MW),
								 .MK(MK),
								 .A_thru(A_thru),
								 .B_thru(B_thru),
								 .PC(PC),
								 .PC_prev(PC_prev),
								 .done(done));
	
	datapath #(nBit) T2(.mem(data_from_ram),
							  .PC(PC),
							  .PC_prev(PC_prev),
							  .DA(DA),
							  .AA(AA),
							  .BA(BA),
							  .FS(FS),
							  .RW(RW),
							  .MB(MB),
							  .MD(MD),
							  .MJ(MJ),
							  .MM(MM),
							  .MK(MK),
							  .A_thru(A_thru),
							  .B_thru(B_thru),
							  .reset(reset),
							  .clk(clk),
							  .zero_flag(zero_flag),
							  .MUX_B(data_to_ram),
							  .MUX_M(address_to_rom),
							  .A(A));
	
	assign enable_to_rom = ~IL;
	
	assign write_enable_to_ram = MW;
	assign read_enable_to_ram = 1'b1;
	
	assign address_to_ram = A[5:0];
	
	assign enable_ram_read = done;
	
endmodule


module FunctionalUnit(FS, A, B, A_thru, B_thru, zero_flag, out);

	parameter nBit = 16;
	
	input [2:0] FS;
	input [nBit-1:0] A, B;
	input A_thru, B_thru;
	
	output reg zero_flag;
	output reg [nBit-1:0] out;
	
	wire [nBit-1:0] ALU_out;
	wire [nBit-1:0] shift_out;
	
	ALU #(nBit) CE2(.FS(FS), .A(A), .B(B), .out(ALU_out));
	
	ShiftArray #(nBit) CE3(.In(A), .sh_cond(FS[0]), .out(shift_out));
	
	always@(*)
	begin
		if(B_thru)
			out <= B;
		else if(A_thru)
			out <= A;
		else
		begin
			if(FS[2] && FS[1])
				out <= shift_out;
			else
				out <= ALU_out;
		end
	end
	
	always@(*)
	begin
		if(out == 0)
			zero_flag <= 1;
		else
			zero_flag <= 0;
	end
	
endmodule

module ShiftArray(In, sh_cond, out);

	parameter nBit = 16;
	
	input [nBit-1:0] In;
	input sh_cond;
	
	output reg [nBit-1:0] out;
	
	always@(*)
	begin
		if(sh_cond == 0)
			out <= {In[nBit-2:0], 1'b0};
		else if(sh_cond == 1)
			out <= {In[nBit-1], In[nBit-1:1]};
	end
	
endmodule

module add_sub(A, B, cond, out);

	parameter nBit = 16;
	
	input [nBit-1:0] A, B;
	input cond;
	
	output [nBit-1:0] out;
	
	reg [nBit-1:0] B_actual;
	wire [nBit-1:0] c;
	
	always@(*)
	begin
		if(cond)
			B_actual <= ~B + cond;
		else
			B_actual <= B;
	end
	
	genvar i;
	generate
		for(i=0; i <= nBit-1; i=i+1)
		begin: generate_add_sub
			if(i==0)
				half_adder HA(A[0], B_actual[0], c[0], out[0]);
			else
				full_adder FA(A[i], B_actual[i], c[i-1], c[i], out[i]);
		end
	endgenerate
	
endmodule

module control_logic(opcode, DA, zero_flag, clk, reset, FS, PS, IL, MB, MD, MJ, RW, MM, MW, MK, A_thru, B_thru, done);

	parameter nBit = 16;
	parameter s0 = 3'b000,
				 s1 = 3'b001,
				 s2 = 3'b010,
				 s3 = 3'b011,
				 s4 = 3'b100,
				 s5 = 3'b101;
				 
	input [3:0] opcode, DA;
	input zero_flag, clk, reset;
	
	output [2:0] FS;
	output reg [1:0] PS;
	output reg IL, MM, RW, done;
	output MB, MD, MJ, MW, MK, A_thru, B_thru;
	
	reg [2:0] state;
	wire MM_decode;
	wire RW_decode;
			
	instruction_decoder SE1(.opcode(opcode),
									.DA(DA),
									.FS(FS),
									.RW(RW_decode),
									.MB(MB),
									.MD(MD),
									.MJ(MJ),
									.MM(MM_decode),
									.MW(MW),
									.MK(MK),
									.B_thru(B_thru),
									.A_thru(A_thru));
	
	always@(posedge clk)
	begin
		if(reset)
		begin
			state <= s0;
		end
		else
		begin
			case(state)
				s0: state <= s1;
				s1:
				begin
					if(opcode[3] == 0 || opcode == 4'b1000 || opcode == 4'b1001 || opcode == 4'b1010 || (opcode == 4'b1011 && zero_flag == 0) || (opcode == 4'b1100 && zero_flag == 1))
						state <= s2;
					else if((opcode == 4'b1011 && zero_flag == 1) || (opcode == 4'b1100 && zero_flag == 0) || (opcode == 4'b1101) || (opcode == 4'b1110))
						state <= s3;
					else if(opcode == 4'b1111 && DA == 4'b0000)
						state <= s4;
					else if(opcode == 4'b1111 && DA == 4'b1111)
						state <= s5;
				end
				s2: state <= s1;
				s3: state <= s1;
				s4: state <= s1;
				s5: state <= s5;
			endcase
		end
	end
			
	always@(state)
	begin
		case(state)
			s0:
			begin
				done <= 0;
				PS <= 2'b00;
				IL <= 0;
				MM <= 1;
				RW <= 0;
			end
			s1: // execution step
			begin
				PS <= 2'b00;
				IL <= 1;
				MM <= 0;
				RW <= RW_decode;
			end
			s2:
			begin
				PS <= 2'b01;
				IL <= 0;
				MM <= 1;
				RW <= 0;
			end
			s3:
			begin
				PS <= 2'b10;
				IL <= 0;
				MM <= 1;
				RW <= 0;
			end
			s4:
			begin
				PS <= 2'b11;
				IL <= 0;
				MM <= 1;
				RW <= 0;
			end
			s5:
			begin
				done <= 1;
				IL <= 0;
				MM <= 1;
				RW <= 0;
			end
			
		endcase
	end

endmodule

module controller(A, data_from_rom, zero_flag, clk, reset, DA, AA, BA, FS, IL, RW, MB, MD, MJ, MM, MW, MK, A_thru, B_thru, PC, PC_prev, done);

	parameter nBit = 16;
	
	input [nBit-1:0] A, data_from_rom; 
	input clk, reset, zero_flag;
	
	output [5:0] PC, PC_prev;
	output [3:0] DA, AA, BA;
	output [2:0] FS;
	output IL, RW, MB, MD, MJ, MM, MW, MK, A_thru, B_thru, done;
	
	wire [3:0] opcode;
	wire [1:0] PS;

	program_counter SE2(.A(A[5:0]),
							  .AA(AA),
							  .BA(BA),
							  .PS(PS),
							  .clk(clk),
							  .reset(reset),
							  .PC(PC),
							  .PC_prev(PC_prev));

	instruction_reg #(nBit) SE3(.control_word(data_from_rom),
										 .instruct_load(IL),
										 .reset(reset),
										 .clk(clk),
										 .opcode(opcode),
										 .DA(DA),
										 .AA(AA),
										 .BA(BA));

	control_logic #(nBit) SE4(.opcode(opcode),
									  .DA(DA),
									  .zero_flag(zero_flag),
									  .clk(clk),
									  .reset(reset),
									  .FS(FS),
									  .PS(PS),
									  .IL(IL),
									  .MB(MB),
									  .MD(MD),
									  .MJ(MJ),
									  .RW(RW),
									  .MM(MM),
									  .MW(MW),
									  .MK(MK),
									  .A_thru(A_thru),
									  .B_thru(B_thru),
									  .done(done));

endmodule

module datapath(mem, PC, PC_prev, DA, AA, BA, FS, RW, MB, MD, MJ, MM, MK, A_thru, B_thru, reset, clk, zero_flag, MUX_B, MUX_M, A);

	parameter nBit = 16;
	
	input [nBit-1:0] mem;
	input [5:0] PC, PC_prev;
	input [3:0] DA, AA, BA;
	input [2:0] FS;
	input RW, MB, MD, MJ, MM, MK, A_thru, B_thru, reset, clk;
	
	output zero_flag;
	output [nBit-1:0] A;
	output reg [nBit-1:0] MUX_B;
	output reg [5:0] MUX_M;
	
	wire [nBit-1:0] D, B;
	wire [3:0] MUX_K;
	reg [nBit-1:0] MUX_D;
	reg [nBit-1:0] MUX_J;
	
	assign MUX_K = MK ? DA:AA;
	
	register_file #(nBit) CE4(.D(MUX_J), .DA(DA), .AA(MUX_K), .BA(BA), .RW(RW), .reset(reset), .clk(clk), .A(A), .B(B));
	
	always@(*)
	begin
		if(MB == 1)
			MUX_B <= {8'b00000000,{AA, BA}};
		else if(MB == 0)
			MUX_B <= B;
	end
	
	always@(*)
	begin
		if(MM == 1)
			MUX_M <= PC;
		else if(MM == 0)
			MUX_M <= A[5:0];
	end
	
	FunctionalUnit #(nBit) CE5(.FS(FS), .A(A), .B(MUX_B), .A_thru(A_thru), .B_thru(B_thru), .zero_flag(zero_flag), .out(D));
	
	always@(*)
	begin
		if(MD == 1)
			MUX_D <= mem;
		else if(MD == 0)
			MUX_D <= D;
	end
	
	always@(*)
	begin
		if(MJ == 1)
			MUX_J <= PC_prev;
		else if(MJ == 0)
			MUX_J <= MUX_D;
	end

endmodule


module full_adder(A, B, Cin, Cout, Sum);

	input A, B, Cin;
	output Cout, Sum;
	
	wire S;
	wire [1:0] C;

	half_adder HA_1(.A(A), .B(B), .Cout(C[0]), .Sum(S));
	half_adder HA_2(.A(S), .B(Cin), .Cout(C[1]), .Sum(Sum));
	
	assign Cout = C[0] | C[1];
	
endmodule
module half_adder(A, B, Cout, Sum);

	input A, B;
	output Cout, Sum;
	
	assign Sum = A^B;
	assign Cout = A&B;

endmodule

module instruction_decoder(opcode, DA, FS, RW, MB, MD, MJ, MM, MW, MK, B_thru, A_thru);

	input [3:0] opcode, DA;
	
	output reg [2:0] FS;
	output reg RW, MB, MD, MJ, MM, MW, MK, A_thru, B_thru;
	
	always@(opcode)
	begin
		if(opcode[3] == 0)
		begin
			RW <= 1;
			MB <= 0;
			MD <= 0;
			MJ <= 0;
			MW <= 0;
			MK <= 0;
			A_thru <= 0;
			B_thru <= 0;
			case(opcode)
				4'b0000: FS <= 3'b000;
				4'b0001: FS <= 3'b001;
				4'b0010: FS <= 3'b010;
				4'b0011: FS <= 3'b011;
				4'b0100: FS <= 3'b100;
				4'b0101: FS <= 3'b101;
				4'b0110: FS <= 3'b110;
				4'b0111: FS <= 3'b111;
			endcase
		end
		
		else if(opcode == 4'b1000)
		begin
			RW <= 1;
			MB <= 1;
			MD <= 0;
			MJ <= 0;
			MW <= 0;
			MK <= 0;
			A_thru <= 0;
			B_thru <= 1;
		end
		
		else if(opcode == 4'b1001 || opcode == 4'b1010)
		begin
			MM <= 0;
			A_thru <= 0;
			B_thru <= 0;
			MJ <= 0;
			MB <= 0;
			MK <= 0;
			if(opcode[1:0] == 2'b01)
			begin
				RW <= 1;
				MD <= 1;
				MW <= 0;
			end
			else if(opcode[1:0] == 2'b10)
			begin
				RW <= 0;
				MD <= 0;
				MW <= 1;
			end
		end
		
		else if(opcode == 4'b1011 || opcode == 4'b1100)
		begin
			RW <= 0;
			MB <= 0;
			MD <= 0;
			MJ <= 0;
			MW <= 0;
			MK <= 1;
			A_thru <= 1;
			B_thru <= 0;
		end
		
		else if(opcode == 4'b1101)
		begin
			RW <= 1;
			MB <= 0;
			MD <= 0;
			MJ <= 1;
			MW <= 0;
			MK <= 0;
			A_thru <= 0;
			B_thru <= 0;
		end
		
		else if(opcode == 4'b1110)
		begin
			RW <= 0;
			MB <= 0;
			MD <= 0;
			MJ <= 0;
			MW <= 0;
			MK <= 0;
			A_thru <= 0;
			B_thru <= 0;
		end
		
		else if(opcode == 4'b1111 && DA == 4'b0000)
		begin
			RW <= 0;
			MB <= 0;
			MD <= 0;
			MJ <= 0;
			MW <= 0;
			MK <= 0;
			A_thru <= 0;
			B_thru <= 0;
		end
		
		else if(opcode == 4'b1111 && DA == 4'b1111)
		begin
			RW <= 0;
			MB <= 0;
			MD <= 0;
			MJ <= 0;
			MW <= 0;
			MK <= 0;
			A_thru <= 0;
			B_thru <= 0;
		end
	end
	
endmodule

module instruction_reg(control_word, instruct_load, reset, clk, opcode, DA, AA, BA);

	parameter nBit = 16;
	
	input [nBit-1:0] control_word;
	input instruct_load;
	input reset, clk;
	
	output reg [3:0] opcode, DA, AA, BA;

	always@(negedge clk)
	begin
		if(reset)
		begin
			opcode <= 0;
			DA <= 0;
			AA <= 0;
			BA <= 0;
		end
		else
		begin
			if(instruct_load)
			begin
				opcode <= control_word[nBit-1:nBit-4];
				DA <= control_word[nBit-5:nBit-8];
				AA <= control_word[nBit-9:nBit-12];
				BA <= control_word[nBit-13:nBit-16];
			end
			else if(instruct_load == 0)
			begin
				opcode <= opcode;
				DA <= DA;
				AA <= AA;
				BA <= BA;
			end
		end
	end

endmodule


module program_counter(A, AA, BA, PS, clk, reset, PC, PC_prev);

	input [5:0] A;
	input [3:0] AA, BA;
	input [1:0] PS;
	input clk, reset;
	
	output reg [5:0] PC;
	output reg [5:0] PC_prev;
	
	always@(negedge clk)
	begin
		if(reset)
		begin
			PC <= 0;
			PC_prev <= 0;
		end
		else
		begin
			case(PS)
				2'b00: 
				begin
					PC <= PC;
					PC_prev <= PC_prev;
				end
				
				2'b01:
				begin
					PC <= PC + 1'b1;
					PC_prev <= PC_prev + 1'b1;
				end
				
				2'b10:
				begin
					PC <= PC + 1'b1 + ({AA[1:0], BA});
					PC_prev <= PC_prev + 1'b1;
				end
				
				2'b11:
				begin
					PC <= A;
					PC_prev <= A;
				end
			endcase
		end
	end

endmodule

module read_from_ram(
    input clk,
	 input reset,
    input [15:0] data_from_ram,
    input uart_ready,
    output reg [5:0] address_to_ram,
    output reg read_enable_to_ram,
    output reg uart_send,
    output reg [7:0] uart_data
    );

	//reg[3:0] mem_counter ;
	reg[2:0] byte_counter ;			// 2+2=4 bytes including new line code
	reg stop ;							//stop reading the ram 
	reg uart_sec_free ; 				// sending 32bit word to uart finished
	reg read_input_from_ram ;
	//reg [7:0] byte1 ;              //byte3, byte2 ;
	reg [3:0] hex1, hex2, hex3 ;    // store [11:0] of the 16 bit ram line
	
	
	always @ (posedge clk)			//address_to_ram
	begin
		if ( reset )
			address_to_ram <= 0 ;
		else if ( read_enable_to_ram )
			address_to_ram <= address_to_ram + 4'b0001 ;
		else
			address_to_ram <= address_to_ram ;
	end

	
	always @ (posedge clk)				//stop reading ram (end reached.)
	begin
		if (reset)
			stop <= 0 ;
		else if ( ( &address_to_ram ) && ( read_enable_to_ram )	)
			stop <= 1 ;
		else
			stop <= stop ;
	end
	
	
	always @ (posedge clk)				//read_enable_to_ram  ---should be single cycle
	begin
		if (reset)
			read_enable_to_ram <= 0 ;
		else if ( ( ~stop ) && uart_sec_free && (~ read_enable_to_ram) )
			read_enable_to_ram <= 1 ;
		else 
			read_enable_to_ram <= 0 ;
	end
	
	
		
	always @ (posedge clk)				//byte_counter [ 4 data bytes and 2 new line bytes ]
	begin
		if (reset)	
			byte_counter <= 0 ;
		else if ( read_enable_to_ram )
			byte_counter <= 3'd6 ;
		else if (uart_send)
			byte_counter <= byte_counter - 3'b001 ;
		else
			byte_counter <= byte_counter ;
	end


	
	always @ (posedge clk)				//read_input_from_ram
	begin
		if (reset)
			read_input_from_ram <= 0 ;
		else
			read_input_from_ram <= read_enable_to_ram ;
	end
	
	
//	always @ ( posedge clk ) 			//store data  (second byte)
//	begin
//		if ( reset )
//		begin
//	//		byte3 <= 0 ;
//	//		byte2 <= 0 ;
//			byte1 <= 0 ;
//		end
//		else if ( read_input_from_ram )		//(read_enable_to_ram)
//		begin
//	//		byte3 <= data_from_ram[23:16] ;
//	//		byte2 <= data_from_ram[15:8] ;
//			byte1 <= data_from_ram[7:0] ;
//		end
//		else
//		begin
//	//		byte3 <= byte3 ;
//	//		byte2 <= byte2 ;
//			byte1 <= byte1 ;
//		end	
//	end


always @ ( posedge clk ) 			//store data  (second byte)
	begin
		if ( reset )
		begin
			hex3 <= 0 ;
			hex2 <= 0 ;
			hex1 <= 0 ;
		end
		else if ( read_input_from_ram )		//(read_enable_to_ram)
		begin
			hex3 <= data_from_ram[11:8] ;
			hex2 <= data_from_ram[7:4] ;
			hex1 <= data_from_ram[3:0] ;//			byte1 <= data_from_ram[7:0] ;
		end
		else
		begin
			hex3 <= hex3 ;
			hex2 <= hex2 ;
			hex1 <= hex1 ;
		end	
	end
	
	
	
	
	
	always @ (posedge clk)				//uart_send        
	begin
		if (reset)
			uart_send <= 0 ;
		else if ( read_input_from_ram )				//( read_enable_to_ram )	
			uart_send <= 1;  
		else if ( ( byte_counter != 0) && ( uart_ready ) && ( ~ uart_send ) )
			uart_send <= 1;
		else
			uart_send <= 0;
	end		


	


	always @ ( posedge clk ) 			//uart_data 8bit
	begin
		if ( reset )
			uart_data <= 8'd0 ;
		else if ( read_input_from_ram )				//(read_enable_to_ram)	
		begin
			case (data_from_ram[15:12])
			
				0	:	uart_data <= 8'h30 ;
				1	:	uart_data <= 8'h31 ;
				2	:	uart_data <= 8'h32 ;
				3	:	uart_data <= 8'h33 ;
				4	:	uart_data <= 8'h34 ;
				5	:	uart_data <= 8'h35 ;
				6	:	uart_data <= 8'h36 ;
				7	:	uart_data <= 8'h37 ;
				8	:	uart_data <= 8'h38 ;
				9	:	uart_data <= 8'h39 ;
				10	:	uart_data <= 8'h41 ;
				11	:	uart_data <= 8'h42 ;
				12	:	uart_data <= 8'h43 ;
				13	:	uart_data <= 8'h44 ;
				14	:	uart_data <= 8'h45 ;
				15	:	uart_data <= 8'h46 ;
			endcase
		end	
		else if ( uart_ready && ( byte_counter != 0 ) && ( ~ uart_send ) )
		begin
			case (byte_counter)
				7 : uart_data <= 8'hFF ;
				6 : uart_data <= 8'hFF ;
				5 : 
				begin
					case (hex3)
					
						0	:	uart_data <= 8'h30 ;
						1	:	uart_data <= 8'h31 ;
						2	:	uart_data <= 8'h32 ;
						3	:	uart_data <= 8'h33 ;
						4	:	uart_data <= 8'h34 ;
						5	:	uart_data <= 8'h35 ;
						6	:	uart_data <= 8'h36 ;
						7	:	uart_data <= 8'h37 ;
						8	:	uart_data <= 8'h38 ;
						9	:	uart_data <= 8'h39 ;
						10	:	uart_data <= 8'h41 ;
						11	:	uart_data <= 8'h42 ;
						12	:	uart_data <= 8'h43 ;
						13	:	uart_data <= 8'h44 ;
						14	:	uart_data <= 8'h45 ;
						15	:	uart_data <= 8'h46 ;
					endcase
				end
				4 : 
				begin
					case (hex2)
					
						0	:	uart_data <= 8'h30 ;
						1	:	uart_data <= 8'h31 ;
						2	:	uart_data <= 8'h32 ;
						3	:	uart_data <= 8'h33 ;
						4	:	uart_data <= 8'h34 ;
						5	:	uart_data <= 8'h35 ;
						6	:	uart_data <= 8'h36 ;
						7	:	uart_data <= 8'h37 ;
						8	:	uart_data <= 8'h38 ;
						9	:	uart_data <= 8'h39 ;
						10	:	uart_data <= 8'h41 ;
						11	:	uart_data <= 8'h42 ;
						12	:	uart_data <= 8'h43 ;
						13	:	uart_data <= 8'h44 ;
						14	:	uart_data <= 8'h45 ;
						15	:	uart_data <= 8'h46 ;
					endcase
				end
				3 : 
				begin
					case (hex1)
					
						0	:	uart_data <= 8'h30 ;
						1	:	uart_data <= 8'h31 ;
						2	:	uart_data <= 8'h32 ;
						3	:	uart_data <= 8'h33 ;
						4	:	uart_data <= 8'h34 ;
						5	:	uart_data <= 8'h35 ;
						6	:	uart_data <= 8'h36 ;
						7	:	uart_data <= 8'h37 ;
						8	:	uart_data <= 8'h38 ;
						9	:	uart_data <= 8'h39 ;
						10	:	uart_data <= 8'h41 ;
						11	:	uart_data <= 8'h42 ;
						12	:	uart_data <= 8'h43 ;
						13	:	uart_data <= 8'h44 ;
						14	:	uart_data <= 8'h45 ;
						15	:	uart_data <= 8'h46 ;
					endcase
				end
				2 : uart_data <= 8'h0d ;			// new line
				1 : uart_data <= 8'h0a ;			// new line
				0 : uart_data <= 8'hFF;
			endcase
		end
	end		
	
/*	
		always @ ( posedge clk ) 			//uart_data 8bit
	begin
		if ( reset )
			uart_data <= 8'd0 ;
		else if ( read_input_from_ram )				//(read_enable_to_ram)	
			uart_data <= data_from_ram[15:8] ;
		else if ( uart_ready && ( byte_counter != 0 ) && ( ~ uart_send ) )
		begin
			case (byte_counter)
				6 : uart_data <= 8'hFF; 			// should never happen
				5 : uart_data <= 8'hFF; 			// should never happen
				4 : uart_data <= 8'hFF; 			// should never happen
				3 : uart_data <= byte1 ;
				2 : uart_data <= 8'h0d ;			// new line
				1 : uart_data <= 8'h0a ;			// new line
				0 : uart_data <= 8'hFF;
			endcase
		end
	end		
*/




		always @ ( posedge clk )				//uart_sec_free
		begin
			if (reset)
				uart_sec_free <= 1 ;
			else if ( ( byte_counter == 0 ) && uart_ready && ( ~read_enable_to_ram ) )	
				uart_sec_free <= 1 ;
			else 
				uart_sec_free <= 0 ;
		end


endmodule


module read_ram_and_uart(
    input clk,
    input reset,
	 input [15:0] data_from_ram,
	 output read_enable_to_ram,
	 output [5:0] address_to_ram, 
    output uart_TX
    );
	 
	 wire wr_uart_send, wr_uart_ready ;
	 wire[7:0] wr_data_byte ;
	 
	 
	 //for ram
	 //wire[31:0] wr_data_from_ram ;
	 //wire[3:0] wr_address_to_ram ; 
	 // wire wr_read_enable_to_ram ;	
	 
	 
	 
/*			// this ROM should be replaced by RAM later
	  ip_rom_in rom_input (
	  .clka(clk), // input clka
	  .ena(wr_read_enable_to_ram), // input ena
	  .addra(wr_address_to_ram), // input [3 : 0] addra
	  .douta(wr_data_from_ram) // output [31 : 0] douta
		);
*/

	 
	 
	 
	 read_from_ram read_RAM(
    .clk(clk),
	 .reset(reset),
    .data_from_ram(data_from_ram),						//32bit
    .uart_ready(wr_uart_ready),
    .address_to_ram(address_to_ram),					//4bit
    .read_enable_to_ram(read_enable_to_ram),
    .uart_send(wr_uart_send),
    .uart_data(wr_data_byte)								//8bit
    );
	 
	 
	 
	 UART_TX_CTRL UART_cont(
	  .SEND(wr_uart_send),
	  .DATA(wr_data_byte),					// 8bit
	  .CLK(clk),
	  .READY(wr_uart_ready),
	  .UART_TX(uart_TX)
	 ) ;


endmodule


module register_file(D, DA, AA, BA, RW, clk, reset, A, B);
	
	parameter nBit = 16;

	input [15:0] D;
	input [3:0] DA, AA, BA;
	input RW, reset, clk;
	
	output reg [15:0] A, B;
	 
	reg [15:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15;
	
	always @(negedge clk)
	begin
		if(reset)
		begin
			reg0 <= 0;
			reg1 <= 0;
			reg2 <= 0;
			reg3 <= 0;
			reg4 <= 0;
			reg5 <= 0;
			reg6 <= 0;
			reg7 <= 0;
			reg8 <= 0;
			reg9 <= 0;
			reg10 <= 0;
			reg11 <= 0;
			reg12 <= 0;
			reg13 <= 0;
			reg14 <= 0;
			reg15 <= 0;
		end
		else
		begin
			if(RW)
			begin
				case(DA)
					4'b0000: reg0 <= D;
					4'b0001: reg1 <= D;
					4'b0010: reg2 <= D;
					4'b0011: reg3 <= D;
					4'b0100: reg4 <= D;
					4'b0101: reg5 <= D;
					4'b0110: reg6 <= D;
					4'b0111: reg7 <= D;
					4'b1000: reg8 <= D;
					4'b1001: reg9 <= D;
					4'b1010: reg10 <= D;
					4'b1011: reg11 <= D;
					4'b1100: reg12 <= D;
					4'b1101: reg13 <= D;
					4'b1110: reg14 <= D;
					4'b1111: reg15 <= D;
				endcase
			end
			
			else if(RW == 0)
			begin
				reg0 <= reg0;
				reg1 <= reg1;
				reg2 <= reg2;
				reg3 <= reg3;
				reg4 <= reg4;
				reg5 <= reg5;
				reg6 <= reg6;
				reg7 <= reg7;
				reg8 <= reg8;
				reg9 <= reg9;
				reg10 <= reg10;
				reg11 <= reg11;
				reg12 <= reg12;
				reg13 <= reg13;
				reg14 <= reg14;
				reg15 <= reg15;
			end
		end
	end
	
	always @(*)
	begin
		case(AA)
			4'b0000 : A <= reg0;
			4'b0001 : A <= reg1;
			4'b0010 : A <= reg2;
			4'b0011 : A <= reg3;
			4'b0100 : A <= reg4;
			4'b0101 : A <= reg5;
			4'b0110 : A <= reg6;
			4'b0111 : A <= reg7;
			4'b1000 : A <= reg8;
			4'b1001 : A <= reg9;
			4'b1010 : A <= reg10;
			4'b1011 : A <= reg11;
			4'b1100 : A <= reg12;
			4'b1101 : A <= reg13;
			4'b1110 : A <= reg14;
			4'b1111 : A <= reg15;
		endcase
				
		case(BA)
			4'b0000 : B <= reg0;
			4'b0001 : B <= reg1;
			4'b0010 : B <= reg2;
			4'b0011 : B <= reg3;
			4'b0100 : B <= reg4;
			4'b0101 : B <= reg5;
			4'b0110 : B <= reg6;
			4'b0111 : B <= reg7;
			4'b1000 : B <= reg8;
			4'b1001 : B <= reg9;
			4'b1010 : B <= reg10;
			4'b1011 : B <= reg11;
			4'b1100 : B <= reg12;
			4'b1101 : B <= reg13;
			4'b1110 : B <= reg14;
			4'b1111 : B <= reg15;
		endcase
	end
	
endmodule



module top_level(
    input reset,
    input clk,
	 output UART_TX
    );

		//address lines
		wire[5:0] wr_address_to_rom ;
		wire [5:0] wr_read_address_to_ram_from_readout, wr_address_to_ram_from_cpu, wr_address_to_ram ;
		
		//enable lines
		wire wr_enable_to_rom, wr_enable_ram; //ROM and RAM enable lines
		wire wr_enable_ram_read;  //RAM enable line from UART
		wire wr_write_to_ram_from_cpu, wr_read_enable_to_ram_from_cpu; // RAM enable lines from CPU
		
		//data lines
		wire [15:0] wr_data_out_from_rom, wr_data_to_ram, wr_data_from_ram;
		
		//clock lines and uart control
		wire wr_clk_read_ram, wr_read_ram, wr_reset_read_ram ;
		
		
		//---------------- clk for the CPU (uut)
		
		wire clk_cpu; //enable clk_for_CPU
		assign clk_cpu = clk ; //& enable_cpu ;
		
		
		
		// controls for read_ram_and_uart
		assign wr_clk_read_ram =  clk && wr_enable_ram_read ; //wr_enable_ram_read && clk ;
		assign wr_reset_read_ram = reset_read_ram ;
		reg [3:0] counter_read_ram_reset ;
		
		reg reset_read_ram, reset_read_ram_done ;
		
		
		//-------------reset signal for read_ram_module------------------------
		
		
		always @ ( posedge clk )	//counter_read_ram_reset     -- to start reading ram
		begin
			if (reset) 
				counter_read_ram_reset <= 4'b0 ;
			else if ( wr_enable_ram_read && ( counter_read_ram_reset == 0 ) )
				counter_read_ram_reset <= 4'b1 ;
			else if ( ( counter_read_ram_reset != 0) && ( counter_read_ram_reset != 4'b1111 ) )	
				counter_read_ram_reset <= counter_read_ram_reset + 4'b1 ;
			else 	
				counter_read_ram_reset <= counter_read_ram_reset ;
		end	
		
		always @ (posedge clk )	//reset_read_ram
		begin
			if (reset)
				reset_read_ram <= 0 ;
			else if ( ( counter_read_ram_reset == 4'b1111 ) && ( reset_read_ram_done != 1) )
				reset_read_ram <= 1 ;
			else 
				reset_read_ram <= 0 ;
		end
		

		always @ ( posedge clk )
		begin
			if (reset)
				reset_read_ram_done <= 0 ;
			else if ( counter_read_ram_reset == 4'b1111 )
				reset_read_ram_done <= 1 ;
			else 
				reset_read_ram_done <= reset_read_ram_done ;
		end		
		
		
		//-------------------------------------------------------------------

	ip_rom_input_code ROM (
		.clka(clk), // input clka
		.ena(wr_enable_to_rom), // input ena
		.addra(wr_address_to_rom), // input [5 : 0] addra
		.douta(wr_data_out_from_rom) // output [15 : 0] douta
		);
		
	CPU dummy_unit1(			//reads ROM, reads and writes to RAM
		.data_from_rom(wr_data_out_from_rom),		
		.reset(reset),
		.clk(clk_cpu),
		.address_to_rom(wr_address_to_rom),		
		.enable_to_rom(wr_enable_to_rom),
		.data_from_ram(wr_data_from_ram),
		.data_to_ram(wr_data_to_ram),
		.write_enable_to_ram(wr_write_to_ram_from_cpu),
		.address_to_ram(wr_address_to_ram_from_cpu),				
		.read_enable_to_ram(wr_read_enable_to_ram_from_cpu),
		.enable_ram_read(wr_enable_ram_read)	//enable ram read and uart module
		);

	read_ram_and_uart read_ram_and_uart(
		.clk(wr_clk_read_ram),
		.reset(wr_reset_read_ram),
		.data_from_ram(wr_data_from_ram),				
		.read_enable_to_ram(wr_read_ram),
		.address_to_ram(wr_read_address_to_ram_from_readout), 
		.uart_TX(UART_TX)
		);
	
	assign wr_address_to_ram =  (wr_enable_ram_read) ?  wr_read_address_to_ram_from_readout : wr_address_to_ram_from_cpu;//address ram
	assign wr_enable_ram = wr_read_enable_to_ram_from_cpu || wr_write_to_ram_from_cpu  || wr_read_ram ;	
	
	ip_ram_output_code RAM (
	  .clka(clk), // input clka
	  .ena(wr_enable_ram), // input ena
	  .wea(wr_write_to_ram_from_cpu), // input wea
	  .addra(wr_address_to_ram), // input [5 : 0] addra
	  .dina(wr_data_to_ram), // input [15 : 0] dina
	  .douta(wr_data_from_ram) // output [15 : 0] douta
	);

endmodule