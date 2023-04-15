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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/raini/Desktop/414 labs/Dec1finalsc/top_level.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {2U, 0U};
static unsigned int ng3[] = {3U, 0U};
static unsigned int ng4[] = {1U, 0U};



static void Always_38_0(char *t0)
{
    char t4[8];
    char t15[8];
    char t39[8];
    char t40[8];
    char t44[8];
    char t77[8];
    char t92[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;
    char *t38;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    char *t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t78;
    char *t79;
    char *t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    char *t87;
    int t88;
    char *t89;
    char *t90;
    char *t91;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    char *t96;
    char *t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    char *t105;
    char *t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    int t115;
    int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    char *t123;

LAB0:    t1 = (t0 + 2984U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 3304);
    *((int *)t2) = 1;
    t3 = (t0 + 3016);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(39, ng0);

LAB5:    xsi_set_current_line(40, ng0);
    t5 = (t0 + 1184U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t4 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 1);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 1);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 3U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 3U);
    t14 = ((char*)((ng1)));
    memset(t15, 0, 8);
    t16 = (t4 + 4);
    t17 = (t14 + 4);
    t18 = *((unsigned int *)t4);
    t19 = *((unsigned int *)t14);
    t20 = (t18 ^ t19);
    t21 = *((unsigned int *)t16);
    t22 = *((unsigned int *)t17);
    t23 = (t21 ^ t22);
    t24 = (t20 | t23);
    t25 = *((unsigned int *)t16);
    t26 = *((unsigned int *)t17);
    t27 = (t25 | t26);
    t28 = (~(t27));
    t29 = (t24 & t28);
    if (t29 != 0)
        goto LAB9;

LAB6:    if (t27 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t15) = 1;

LAB9:    t31 = (t15 + 4);
    t32 = *((unsigned int *)t31);
    t33 = (~(t32));
    t34 = *((unsigned int *)t15);
    t35 = (t34 & t33);
    t36 = (t35 != 0);
    if (t36 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1184U);
    t3 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t4 + 4);
    t5 = (t3 + 4);
    t8 = *((unsigned int *)t3);
    t9 = (t8 >> 2);
    t10 = (t9 & 1);
    *((unsigned int *)t4) = t10;
    t11 = *((unsigned int *)t5);
    t12 = (t11 >> 2);
    t13 = (t12 & 1);
    *((unsigned int *)t2) = t13;
    memset(t15, 0, 8);
    t6 = (t4 + 4);
    t18 = *((unsigned int *)t6);
    t19 = (~(t18));
    t20 = *((unsigned int *)t4);
    t21 = (t20 & t19);
    t22 = (t21 & 1U);
    if (t22 != 0)
        goto LAB13;

LAB14:    if (*((unsigned int *)t6) != 0)
        goto LAB15;

LAB16:    t14 = (t15 + 4);
    t23 = *((unsigned int *)t15);
    t24 = (!(t23));
    t25 = *((unsigned int *)t14);
    t26 = (t24 || t25);
    if (t26 > 0)
        goto LAB17;

LAB18:    memcpy(t44, t15, 8);

LAB19:    t71 = (t44 + 4);
    t72 = *((unsigned int *)t71);
    t73 = (~(t72));
    t74 = *((unsigned int *)t44);
    t75 = (t74 & t73);
    t76 = (t75 != 0);
    if (t76 > 0)
        goto LAB27;

LAB28:
LAB29:
LAB12:    goto LAB2;

LAB8:    t30 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(41, ng0);
    t37 = (t0 + 1664U);
    t38 = *((char **)t37);
    t37 = (t0 + 2064);
    xsi_vlogvar_wait_assign_value(t37, t38, 0, 0, 16, 0LL);
    goto LAB12;

LAB13:    *((unsigned int *)t15) = 1;
    goto LAB16;

LAB15:    t7 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB16;

LAB17:    t16 = (t0 + 1184U);
    t17 = *((char **)t16);
    memset(t39, 0, 8);
    t16 = (t39 + 4);
    t30 = (t17 + 4);
    t27 = *((unsigned int *)t17);
    t28 = (t27 >> 1);
    t29 = (t28 & 1);
    *((unsigned int *)t39) = t29;
    t32 = *((unsigned int *)t30);
    t33 = (t32 >> 1);
    t34 = (t33 & 1);
    *((unsigned int *)t16) = t34;
    memset(t40, 0, 8);
    t31 = (t39 + 4);
    t35 = *((unsigned int *)t31);
    t36 = (~(t35));
    t41 = *((unsigned int *)t39);
    t42 = (t41 & t36);
    t43 = (t42 & 1U);
    if (t43 != 0)
        goto LAB20;

LAB21:    if (*((unsigned int *)t31) != 0)
        goto LAB22;

LAB23:    t45 = *((unsigned int *)t15);
    t46 = *((unsigned int *)t40);
    t47 = (t45 | t46);
    *((unsigned int *)t44) = t47;
    t38 = (t15 + 4);
    t48 = (t40 + 4);
    t49 = (t44 + 4);
    t50 = *((unsigned int *)t38);
    t51 = *((unsigned int *)t48);
    t52 = (t50 | t51);
    *((unsigned int *)t49) = t52;
    t53 = *((unsigned int *)t49);
    t54 = (t53 != 0);
    if (t54 == 1)
        goto LAB24;

LAB25:
LAB26:    goto LAB19;

LAB20:    *((unsigned int *)t40) = 1;
    goto LAB23;

LAB22:    t37 = (t40 + 4);
    *((unsigned int *)t40) = 1;
    *((unsigned int *)t37) = 1;
    goto LAB23;

LAB24:    t55 = *((unsigned int *)t44);
    t56 = *((unsigned int *)t49);
    *((unsigned int *)t44) = (t55 | t56);
    t57 = (t15 + 4);
    t58 = (t40 + 4);
    t59 = *((unsigned int *)t57);
    t60 = (~(t59));
    t61 = *((unsigned int *)t15);
    t62 = (t61 & t60);
    t63 = *((unsigned int *)t58);
    t64 = (~(t63));
    t65 = *((unsigned int *)t40);
    t66 = (t65 & t64);
    t67 = (~(t62));
    t68 = (~(t66));
    t69 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t69 & t67);
    t70 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t70 & t68);
    goto LAB26;

LAB27:    xsi_set_current_line(43, ng0);

LAB30:    xsi_set_current_line(44, ng0);
    t78 = (t0 + 1184U);
    t79 = *((char **)t78);
    memset(t77, 0, 8);
    t78 = (t77 + 4);
    t80 = (t79 + 4);
    t81 = *((unsigned int *)t79);
    t82 = (t81 >> 0);
    *((unsigned int *)t77) = t82;
    t83 = *((unsigned int *)t80);
    t84 = (t83 >> 0);
    *((unsigned int *)t78) = t84;
    t85 = *((unsigned int *)t77);
    *((unsigned int *)t77) = (t85 & 3U);
    t86 = *((unsigned int *)t78);
    *((unsigned int *)t78) = (t86 & 3U);

LAB31:    t87 = ((char*)((ng2)));
    t88 = xsi_vlog_unsigned_case_compare(t77, 2, t87, 2);
    if (t88 == 1)
        goto LAB32;

LAB33:    t2 = ((char*)((ng3)));
    t62 = xsi_vlog_unsigned_case_compare(t77, 2, t2, 2);
    if (t62 == 1)
        goto LAB34;

LAB35:    t2 = ((char*)((ng1)));
    t62 = xsi_vlog_unsigned_case_compare(t77, 2, t2, 2);
    if (t62 == 1)
        goto LAB36;

LAB37:    t2 = ((char*)((ng4)));
    t62 = xsi_vlog_unsigned_case_compare(t77, 2, t2, 2);
    if (t62 == 1)
        goto LAB38;

LAB39:
LAB40:    goto LAB29;

LAB32:    xsi_set_current_line(45, ng0);
    t89 = (t0 + 1344U);
    t90 = *((char **)t89);
    t89 = (t0 + 1504U);
    t91 = *((char **)t89);
    t93 = *((unsigned int *)t90);
    t94 = *((unsigned int *)t91);
    t95 = (t93 & t94);
    *((unsigned int *)t92) = t95;
    t89 = (t90 + 4);
    t96 = (t91 + 4);
    t97 = (t92 + 4);
    t98 = *((unsigned int *)t89);
    t99 = *((unsigned int *)t96);
    t100 = (t98 | t99);
    *((unsigned int *)t97) = t100;
    t101 = *((unsigned int *)t97);
    t102 = (t101 != 0);
    if (t102 == 1)
        goto LAB41;

LAB42:
LAB43:    t123 = (t0 + 2064);
    xsi_vlogvar_wait_assign_value(t123, t92, 0, 0, 16, 0LL);
    goto LAB40;

LAB34:    xsi_set_current_line(46, ng0);
    t3 = (t0 + 1344U);
    t5 = *((char **)t3);
    t3 = (t0 + 1504U);
    t6 = *((char **)t3);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t6);
    t10 = (t8 | t9);
    *((unsigned int *)t4) = t10;
    t3 = (t5 + 4);
    t7 = (t6 + 4);
    t14 = (t4 + 4);
    t11 = *((unsigned int *)t3);
    t12 = *((unsigned int *)t7);
    t13 = (t11 | t12);
    *((unsigned int *)t14) = t13;
    t18 = *((unsigned int *)t14);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB44;

LAB45:
LAB46:    t30 = (t0 + 2064);
    xsi_vlogvar_wait_assign_value(t30, t4, 0, 0, 16, 0LL);
    goto LAB40;

LAB36:    xsi_set_current_line(47, ng0);
    t3 = (t0 + 1344U);
    t5 = *((char **)t3);
    t3 = (t0 + 1504U);
    t6 = *((char **)t3);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t6);
    t10 = (t8 ^ t9);
    *((unsigned int *)t4) = t10;
    t3 = (t5 + 4);
    t7 = (t6 + 4);
    t14 = (t4 + 4);
    t11 = *((unsigned int *)t3);
    t12 = *((unsigned int *)t7);
    t13 = (t11 | t12);
    *((unsigned int *)t14) = t13;
    t18 = *((unsigned int *)t14);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB47;

LAB48:
LAB49:    t16 = (t0 + 2064);
    xsi_vlogvar_wait_assign_value(t16, t4, 0, 0, 16, 0LL);
    goto LAB40;

LAB38:    xsi_set_current_line(48, ng0);
    t3 = (t0 + 1344U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t3 = (t4 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (~(t8));
    *((unsigned int *)t4) = t9;
    *((unsigned int *)t3) = 0;
    if (*((unsigned int *)t6) != 0)
        goto LAB51;

LAB50:    t18 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t18 & 65535U);
    t19 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t19 & 65535U);
    t7 = (t0 + 2064);
    xsi_vlogvar_wait_assign_value(t7, t4, 0, 0, 16, 0LL);
    goto LAB40;

LAB41:    t103 = *((unsigned int *)t92);
    t104 = *((unsigned int *)t97);
    *((unsigned int *)t92) = (t103 | t104);
    t105 = (t90 + 4);
    t106 = (t91 + 4);
    t107 = *((unsigned int *)t90);
    t108 = (~(t107));
    t109 = *((unsigned int *)t105);
    t110 = (~(t109));
    t111 = *((unsigned int *)t91);
    t112 = (~(t111));
    t113 = *((unsigned int *)t106);
    t114 = (~(t113));
    t115 = (t108 & t110);
    t116 = (t112 & t114);
    t117 = (~(t115));
    t118 = (~(t116));
    t119 = *((unsigned int *)t97);
    *((unsigned int *)t97) = (t119 & t117);
    t120 = *((unsigned int *)t97);
    *((unsigned int *)t97) = (t120 & t118);
    t121 = *((unsigned int *)t92);
    *((unsigned int *)t92) = (t121 & t117);
    t122 = *((unsigned int *)t92);
    *((unsigned int *)t92) = (t122 & t118);
    goto LAB43;

LAB44:    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t14);
    *((unsigned int *)t4) = (t20 | t21);
    t16 = (t5 + 4);
    t17 = (t6 + 4);
    t22 = *((unsigned int *)t16);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t66 = (t24 & t23);
    t25 = *((unsigned int *)t17);
    t26 = (~(t25));
    t27 = *((unsigned int *)t6);
    t88 = (t27 & t26);
    t28 = (~(t66));
    t29 = (~(t88));
    t32 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t32 & t28);
    t33 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t33 & t29);
    goto LAB46;

LAB47:    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t14);
    *((unsigned int *)t4) = (t20 | t21);
    goto LAB49;

LAB51:    t10 = *((unsigned int *)t4);
    t11 = *((unsigned int *)t6);
    *((unsigned int *)t4) = (t10 | t11);
    t12 = *((unsigned int *)t3);
    t13 = *((unsigned int *)t6);
    *((unsigned int *)t3) = (t12 | t13);
    goto LAB50;

}


extern void work_m_00000000004200714016_3448780807_init()
{
	static char *pe[] = {(void *)Always_38_0};
	xsi_register_didat("work_m_00000000004200714016_3448780807", "isim/tb_top_level_isim_beh.exe.sim/work/m_00000000004200714016_3448780807.didat");
	xsi_register_executes(pe);
}
