/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *STD_STANDARD;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    xilinxcorelib_ver_m_00000000001358910285_0952861014_init();
    xilinxcorelib_ver_m_00000000001358910285_0187987045_init();
    xilinxcorelib_ver_m_00000000001687936702_2748435483_init();
    xilinxcorelib_ver_m_00000000000277421008_3452567212_init();
    xilinxcorelib_ver_m_00000000001603977570_2498081034_init();
    work_m_00000000003388451136_0790153733_init();
    work_m_00000000003518791632_3381898454_init();
    work_m_00000000001427985753_3691094019_init();
    work_m_00000000001634067880_4089252921_init();
    work_m_00000000001847206925_0930862535_init();
    work_m_00000000001162371276_2925701156_init();
    work_m_00000000001003405110_3039078618_init();
    work_m_00000000003778036139_4122600708_init();
    work_m_00000000002908618193_3190593924_init();
    work_m_00000000001117045912_3947352507_init();
    work_m_00000000004200714016_3448780807_init();
    work_m_00000000000141972200_4234898879_init();
    work_m_00000000004027376898_2445721060_init();
    work_m_00000000003042693273_4282031698_init();
    work_m_00000000000844525646_3508565487_init();
    work_m_00000000001068333784_3074773880_init();
    work_m_00000000002657611581_1116449457_init();
    xilinxcorelib_ver_m_00000000000277421008_0433842692_init();
    xilinxcorelib_ver_m_00000000001603977570_2505490065_init();
    work_m_00000000003869038185_3189953690_init();
    work_m_00000000000710410021_1163904914_init();
    work_m_00000000000046251397_2333963519_init();
    work_m_00000000004134447467_2073120511_init();
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_3149536953_3212880686_init();


    xsi_register_tops("work_m_00000000000046251397_2333963519");
    xsi_register_tops("work_m_00000000004134447467_2073120511");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    STD_STANDARD = xsi_get_engine_memory("std_standard");

    return xsi_run_simulation(argc, argv);

}
