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
static int ng1[] = {0, 0};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {3U, 0U};



static void Always_676_0(char *t0)
{
    char t14[8];
    char t16[8];
    char t18[8];
    char t22[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    int t13;
    char *t15;
    char *t17;
    char *t19;
    char *t20;
    unsigned int t21;
    char *t23;

LAB0:    t1 = (t0 + 3328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(676, ng0);
    t2 = (t0 + 3648);
    *((int *)t2) = 1;
    t3 = (t0 + 3360);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(677, ng0);

LAB5:    xsi_set_current_line(678, ng0);
    t4 = (t0 + 1848U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(684, ng0);

LAB10:    xsi_set_current_line(685, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);

LAB11:    t2 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t13 == 1)
        goto LAB12;

LAB13:    t2 = ((char*)((ng3)));
    t13 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t13 == 1)
        goto LAB14;

LAB15:    t2 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t13 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng5)));
    t13 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t13 == 1)
        goto LAB18;

LAB19:
LAB20:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(679, ng0);

LAB9:    xsi_set_current_line(680, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 6, 0LL);
    xsi_set_current_line(681, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 6, 0LL);
    goto LAB8;

LAB12:    xsi_set_current_line(687, ng0);

LAB21:    xsi_set_current_line(688, ng0);
    t4 = (t0 + 2248);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 6, 0LL);
    xsi_set_current_line(689, ng0);
    t2 = (t0 + 2408);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t11 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 6, 0LL);
    goto LAB20;

LAB14:    xsi_set_current_line(693, ng0);

LAB22:    xsi_set_current_line(694, ng0);
    t4 = (t0 + 2248);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng3)));
    memset(t14, 0, 8);
    xsi_vlog_unsigned_add(t14, 6, t11, 6, t12, 6);
    t15 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t15, t14, 0, 0, 6, 0LL);
    xsi_set_current_line(695, ng0);
    t2 = (t0 + 2408);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t11 = ((char*)((ng3)));
    memset(t14, 0, 8);
    xsi_vlog_unsigned_add(t14, 6, t5, 6, t11, 6);
    t12 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t12, t14, 0, 0, 6, 0LL);
    goto LAB20;

LAB16:    xsi_set_current_line(699, ng0);

LAB23:    xsi_set_current_line(700, ng0);
    t4 = (t0 + 2248);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng3)));
    memset(t14, 0, 8);
    xsi_vlog_unsigned_add(t14, 6, t11, 6, t12, 6);
    t15 = (t0 + 1368U);
    t17 = *((char **)t15);
    t15 = (t0 + 1208U);
    t19 = *((char **)t15);
    memset(t18, 0, 8);
    t15 = (t18 + 4);
    t20 = (t19 + 4);
    t6 = *((unsigned int *)t19);
    t7 = (t6 >> 0);
    *((unsigned int *)t18) = t7;
    t8 = *((unsigned int *)t20);
    t9 = (t8 >> 0);
    *((unsigned int *)t15) = t9;
    t10 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t10 & 3U);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t21 & 3U);
    xsi_vlogtype_concat(t16, 6, 6, 2U, t18, 2, t17, 4);
    memset(t22, 0, 8);
    xsi_vlog_unsigned_add(t22, 6, t14, 6, t16, 6);
    t23 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t23, t22, 0, 0, 6, 0LL);
    xsi_set_current_line(701, ng0);
    t2 = (t0 + 2408);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t11 = ((char*)((ng3)));
    memset(t14, 0, 8);
    xsi_vlog_unsigned_add(t14, 6, t5, 6, t11, 6);
    t12 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t12, t14, 0, 0, 6, 0LL);
    goto LAB20;

LAB18:    xsi_set_current_line(705, ng0);

LAB24:    xsi_set_current_line(706, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 6, 0LL);
    xsi_set_current_line(707, ng0);
    t2 = (t0 + 1048U);
    t4 = *((char **)t2);
    t2 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t2, t4, 0, 0, 6, 0LL);
    goto LAB20;

}


extern void work_m_00000000003518791632_3381898454_init()
{
	static char *pe[] = {(void *)Always_676_0};
	xsi_register_didat("work_m_00000000003518791632_3381898454", "isim/tb_top_level_isim_beh.exe.sim/work/m_00000000003518791632_3381898454.didat");
	xsi_register_executes(pe);
}
