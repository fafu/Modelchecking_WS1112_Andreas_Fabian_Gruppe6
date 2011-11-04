#define rand	pan_rand
#if defined(HAS_CODE) && defined(VERBOSE)
	cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC p1 */
	case 3: /* STATE 1 - exercise4_part2.pml:32 - [flag[1] = 1] (0:0:1 - 1) */
		IfNotBlocked
		reached[2][1] = 1;
		(trpt+1)->bup.oval = ((int)now.flag[1]);
		now.flag[1] = 1;
#ifdef VAR_RANGES
		logval("flag[1]", ((int)now.flag[1]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: /* STATE 2 - exercise4_part2.pml:34 - [((turn==0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][2] = 1;
		if (!((((int)now.turn)==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: /* STATE 3 - exercise4_part2.pml:34 - [((flag[0]==0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][3] = 1;
		if (!((((int)now.flag[0])==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: /* STATE 4 - exercise4_part2.pml:34 - [turn = 1] (0:0:1 - 1) */
		IfNotBlocked
		reached[2][4] = 1;
		(trpt+1)->bup.oval = ((int)now.turn);
		now.turn = 1;
#ifdef VAR_RANGES
		logval("turn", ((int)now.turn));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: /* STATE 10 - exercise4_part2.pml:37 - [assert((turn==1))] (0:0:0 - 3) */
		IfNotBlocked
		reached[2][10] = 1;
		spin_assert((((int)now.turn)==1), "(turn==1)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 8: /* STATE 11 - exercise4_part2.pml:38 - [flag[1] = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[2][11] = 1;
		(trpt+1)->bup.oval = ((int)now.flag[1]);
		now.flag[1] = 0;
#ifdef VAR_RANGES
		logval("flag[1]", ((int)now.flag[1]));
#endif
		;
		_m = 3; goto P999; /* 0 */

		 /* PROC p0 */
	case 9: /* STATE 1 - exercise4_part2.pml:19 - [flag[0] = 1] (0:0:1 - 1) */
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((int)now.flag[0]);
		now.flag[0] = 1;
#ifdef VAR_RANGES
		logval("flag[0]", ((int)now.flag[0]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: /* STATE 2 - exercise4_part2.pml:21 - [((turn==1))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][2] = 1;
		if (!((((int)now.turn)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: /* STATE 3 - exercise4_part2.pml:21 - [((flag[1]==0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][3] = 1;
		if (!((((int)now.flag[1])==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: /* STATE 4 - exercise4_part2.pml:21 - [turn = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[1][4] = 1;
		(trpt+1)->bup.oval = ((int)now.turn);
		now.turn = 0;
#ifdef VAR_RANGES
		logval("turn", ((int)now.turn));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: /* STATE 10 - exercise4_part2.pml:24 - [assert((turn==0))] (0:0:0 - 3) */
		IfNotBlocked
		reached[1][10] = 1;
		spin_assert((((int)now.turn)==0), "(turn==0)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 14: /* STATE 11 - exercise4_part2.pml:25 - [flag[0] = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[1][11] = 1;
		(trpt+1)->bup.oval = ((int)now.flag[0]);
		now.flag[0] = 0;
#ifdef VAR_RANGES
		logval("flag[0]", ((int)now.flag[0]));
#endif
		;
		_m = 3; goto P999; /* 0 */

		 /* PROC :init: */
	case 15: /* STATE 1 - exercise4_part2.pml:6 - [turn = 1] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((int)now.turn);
		now.turn = 1;
#ifdef VAR_RANGES
		logval("turn", ((int)now.turn));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: /* STATE 2 - exercise4_part2.pml:7 - [turn = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)now.turn);
		now.turn = 0;
#ifdef VAR_RANGES
		logval("turn", ((int)now.turn));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: /* STATE 5 - exercise4_part2.pml:10 - [flag[0] = 0] (0:0:1 - 3) */
		IfNotBlocked
		reached[0][5] = 1;
		(trpt+1)->bup.oval = ((int)now.flag[0]);
		now.flag[0] = 0;
#ifdef VAR_RANGES
		logval("flag[0]", ((int)now.flag[0]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 18: /* STATE 6 - exercise4_part2.pml:11 - [flag[1] = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][6] = 1;
		(trpt+1)->bup.oval = ((int)now.flag[1]);
		now.flag[1] = 0;
#ifdef VAR_RANGES
		logval("flag[1]", ((int)now.flag[1]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: /* STATE 7 - exercise4_part2.pml:12 - [(run p0())] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][7] = 1;
		if (!(addproc(II, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 20: /* STATE 8 - exercise4_part2.pml:13 - [(run p1())] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][8] = 1;
		if (!(addproc(II, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 21: /* STATE 9 - exercise4_part2.pml:14 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][9] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

