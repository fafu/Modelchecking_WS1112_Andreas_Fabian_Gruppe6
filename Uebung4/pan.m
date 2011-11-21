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

		 /* PROC :init: */
	case 3: /* STATE 1 - exercise15.pml:66 - [(run B())] (0:0:0 - 1) */
		IfNotBlocked
		reached[4][1] = 1;
		if (!(addproc(II, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: /* STATE 2 - exercise15.pml:67 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[4][2] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC travel */
	case 5: /* STATE 1 - exercise15.pml:59 - [((man==cabbage))] (0:0:0 - 1) */
		IfNotBlocked
		reached[3][1] = 1;
		if (!((((int)now.man)==((int)now.cabbage))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: /* STATE 2 - exercise15.pml:59 - [man = !(man)] (0:0:1 - 1) */
		IfNotBlocked
		reached[3][2] = 1;
		(trpt+1)->bup.oval = ((int)now.man);
		now.man =  !(((int)now.man));
#ifdef VAR_RANGES
		logval("man", ((int)now.man));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: /* STATE 3 - exercise15.pml:59 - [cabbage = !(cabbage)] (0:0:1 - 1) */
		IfNotBlocked
		reached[3][3] = 1;
		(trpt+1)->bup.oval = ((int)now.cabbage);
		now.cabbage =  !(((int)now.cabbage));
#ifdef VAR_RANGES
		logval("cabbage", ((int)now.cabbage));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: /* STATE 4 - exercise15.pml:59 - [printf('Mann faehrt mit Cabbage in R:%d\\n',man)] (0:0:0 - 1) */
		IfNotBlocked
		reached[3][4] = 1;
		Printf("Mann faehrt mit Cabbage in R:%d\n", ((int)now.man));
		_m = 3; goto P999; /* 0 */
	case 9: /* STATE 5 - exercise15.pml:60 - [((man==goat))] (0:0:0 - 1) */
		IfNotBlocked
		reached[3][5] = 1;
		if (!((((int)now.man)==((int)now.goat))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: /* STATE 6 - exercise15.pml:60 - [man = !(man)] (0:0:1 - 1) */
		IfNotBlocked
		reached[3][6] = 1;
		(trpt+1)->bup.oval = ((int)now.man);
		now.man =  !(((int)now.man));
#ifdef VAR_RANGES
		logval("man", ((int)now.man));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: /* STATE 7 - exercise15.pml:60 - [goat = !(goat)] (0:0:1 - 1) */
		IfNotBlocked
		reached[3][7] = 1;
		(trpt+1)->bup.oval = ((int)now.goat);
		now.goat =  !(((int)now.goat));
#ifdef VAR_RANGES
		logval("goat", ((int)now.goat));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: /* STATE 8 - exercise15.pml:60 - [printf('Mann faehrt mit Goat in R:%d\\n',man)] (0:0:0 - 1) */
		IfNotBlocked
		reached[3][8] = 1;
		Printf("Mann faehrt mit Goat in R:%d\n", ((int)now.man));
		_m = 3; goto P999; /* 0 */
	case 13: /* STATE 9 - exercise15.pml:61 - [((man==wolf))] (0:0:0 - 1) */
		IfNotBlocked
		reached[3][9] = 1;
		if (!((((int)now.man)==((int)now.wolf))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: /* STATE 10 - exercise15.pml:61 - [man = !(man)] (0:0:1 - 1) */
		IfNotBlocked
		reached[3][10] = 1;
		(trpt+1)->bup.oval = ((int)now.man);
		now.man =  !(((int)now.man));
#ifdef VAR_RANGES
		logval("man", ((int)now.man));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: /* STATE 11 - exercise15.pml:61 - [wolf = !(wolf)] (0:0:1 - 1) */
		IfNotBlocked
		reached[3][11] = 1;
		(trpt+1)->bup.oval = ((int)now.wolf);
		now.wolf =  !(((int)now.wolf));
#ifdef VAR_RANGES
		logval("wolf", ((int)now.wolf));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: /* STATE 12 - exercise15.pml:61 - [printf('Mann faehrt mit Wolf in R:%d\\n',man)] (0:0:0 - 1) */
		IfNotBlocked
		reached[3][12] = 1;
		Printf("Mann faehrt mit Wolf in R:%d\n", ((int)now.man));
		_m = 3; goto P999; /* 0 */
	case 17: /* STATE 13 - exercise15.pml:62 - [man = !(man)] (0:0:1 - 1) */
		IfNotBlocked
		reached[3][13] = 1;
		(trpt+1)->bup.oval = ((int)now.man);
		now.man =  !(((int)now.man));
#ifdef VAR_RANGES
		logval("man", ((int)now.man));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 18: /* STATE 14 - exercise15.pml:62 - [printf('Mann faehrt alleine in R:%d\\n',man)] (0:0:0 - 1) */
		IfNotBlocked
		reached[3][14] = 1;
		Printf("Mann faehrt alleine in R:%d\n", ((int)now.man));
		_m = 3; goto P999; /* 0 */
	case 19: /* STATE 17 - exercise15.pml:64 - [-end-] (0:0:0 - 5) */
		IfNotBlocked
		reached[3][17] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* CLAIM never_0 */
	case 20: /* STATE 1 - exercise15.pml:53 - [(((goat&&wolf)&&cabbage))] (0:0:0 - 1) */
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			int nn = (int) ((Pclaim *)this)->_n;
			if (verbose && !reported1)
			{	printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)this)->_p, src_claim[ (int) ((Pclaim *)this)->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)this)->_p, src_claim[ (int) ((Pclaim *)this)->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][1] = 1;
		if (!(((((int)now.goat)&&((int)now.wolf))&&((int)now.cabbage))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 21: /* STATE 7 - exercise15.pml:56 - [-end-] (0:0:0 - 3) */
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported7 = 0;
			int nn = (int) ((Pclaim *)this)->_n;
			if (verbose && !reported7)
			{	printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)this)->_p, src_claim[ (int) ((Pclaim *)this)->_p ]);
				reported7 = 1;
				fflush(stdout);
		}	}
#else
{	static int reported7 = 0;
			if (verbose && !reported7)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)this)->_p, src_claim[ (int) ((Pclaim *)this)->_p ]);
				reported7 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[2][7] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC B */
	case 22: /* STATE 1 - exercise15.pml:38 - [printf('%d%d%d%d',cabbage,goat,wolf,man)] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][1] = 1;
		Printf("%d%d%d%d", ((int)now.cabbage), ((int)now.goat), ((int)now.wolf), ((int)now.man));
		_m = 3; goto P999; /* 0 */
	case 23: /* STATE 2 - exercise15.pml:40 - [(((goat==cabbage)&&(goat!=man)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][2] = 1;
		if (!(((((int)now.goat)==((int)now.cabbage))&&(((int)now.goat)!=((int)now.man)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: /* STATE 3 - exercise15.pml:40 - [printf('Abbruch')] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][3] = 1;
		Printf("Abbruch");
		_m = 3; goto P999; /* 0 */
	case 25: /* STATE 5 - exercise15.pml:41 - [(((wolf==goat)&&(wolf!=man)))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][5] = 1;
		if (!(((((int)now.wolf)==((int)now.goat))&&(((int)now.wolf)!=((int)now.man)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 26: /* STATE 6 - exercise15.pml:41 - [printf('Abbruch')] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][6] = 1;
		Printf("Abbruch");
		_m = 3; goto P999; /* 0 */
	case 27: /* STATE 9 - exercise15.pml:44 - [((man==cabbage))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][9] = 1;
		if (!((((int)now.man)==((int)now.cabbage))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 28: /* STATE 10 - exercise15.pml:44 - [man = !(man)] (0:29:2 - 1) */
		IfNotBlocked
		reached[1][10] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.man);
		now.man =  !(((int)now.man));
#ifdef VAR_RANGES
		logval("man", ((int)now.man));
#endif
		;
		/* merge: cabbage = !(cabbage)(29, 11, 29) */
		reached[1][11] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.cabbage);
		now.cabbage =  !(((int)now.cabbage));
#ifdef VAR_RANGES
		logval("cabbage", ((int)now.cabbage));
#endif
		;
		/* merge: printf('Mann faehrt mit Cabbage in R:%d\\n',man)(29, 12, 29) */
		reached[1][12] = 1;
		Printf("Mann faehrt mit Cabbage in R:%d\n", ((int)now.man));
		/* merge: .(goto)(0, 28, 29) */
		reached[1][28] = 1;
		;
		/* merge: .(goto)(0, 30, 29) */
		reached[1][30] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 29: /* STATE 14 - exercise15.pml:45 - [((man==goat))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][14] = 1;
		if (!((((int)now.man)==((int)now.goat))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 30: /* STATE 15 - exercise15.pml:45 - [man = !(man)] (0:29:2 - 1) */
		IfNotBlocked
		reached[1][15] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.man);
		now.man =  !(((int)now.man));
#ifdef VAR_RANGES
		logval("man", ((int)now.man));
#endif
		;
		/* merge: goat = !(goat)(29, 16, 29) */
		reached[1][16] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.goat);
		now.goat =  !(((int)now.goat));
#ifdef VAR_RANGES
		logval("goat", ((int)now.goat));
#endif
		;
		/* merge: printf('Mann faehrt mit Goat in R:%d\\n',man)(29, 17, 29) */
		reached[1][17] = 1;
		Printf("Mann faehrt mit Goat in R:%d\n", ((int)now.man));
		/* merge: .(goto)(0, 28, 29) */
		reached[1][28] = 1;
		;
		/* merge: .(goto)(0, 30, 29) */
		reached[1][30] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 31: /* STATE 19 - exercise15.pml:46 - [((man==wolf))] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][19] = 1;
		if (!((((int)now.man)==((int)now.wolf))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 32: /* STATE 20 - exercise15.pml:46 - [man = !(man)] (0:29:2 - 1) */
		IfNotBlocked
		reached[1][20] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.man);
		now.man =  !(((int)now.man));
#ifdef VAR_RANGES
		logval("man", ((int)now.man));
#endif
		;
		/* merge: wolf = !(wolf)(29, 21, 29) */
		reached[1][21] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.wolf);
		now.wolf =  !(((int)now.wolf));
#ifdef VAR_RANGES
		logval("wolf", ((int)now.wolf));
#endif
		;
		/* merge: printf('Mann faehrt mit Wolf in R:%d\\n',man)(29, 22, 29) */
		reached[1][22] = 1;
		Printf("Mann faehrt mit Wolf in R:%d\n", ((int)now.man));
		/* merge: .(goto)(0, 28, 29) */
		reached[1][28] = 1;
		;
		/* merge: .(goto)(0, 30, 29) */
		reached[1][30] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 33: /* STATE 24 - exercise15.pml:47 - [man = !(man)] (0:29:1 - 1) */
		IfNotBlocked
		reached[1][24] = 1;
		(trpt+1)->bup.oval = ((int)now.man);
		now.man =  !(((int)now.man));
#ifdef VAR_RANGES
		logval("man", ((int)now.man));
#endif
		;
		/* merge: printf('Mann faehrt alleine in R:%d\\n',man)(29, 25, 29) */
		reached[1][25] = 1;
		Printf("Mann faehrt alleine in R:%d\n", ((int)now.man));
		/* merge: .(goto)(0, 28, 29) */
		reached[1][28] = 1;
		;
		/* merge: .(goto)(0, 30, 29) */
		reached[1][30] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 34: /* STATE 32 - exercise15.pml:50 - [-end-] (0:0:0 - 5) */
		IfNotBlocked
		reached[1][32] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC A */
	case 35: /* STATE 1 - exercise15.pml:6 - [anwesendVorUeberfahrt[0] = 1] (0:13:7 - 1) */
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.ovals = grab_ints(7);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->_1_anwesendVorUeberfahrt[0]);
		((P0 *)this)->_1_anwesendVorUeberfahrt[0] = 1;
#ifdef VAR_RANGES
		logval("A:anwesendVorUeberfahrt[0]", ((int)((P0 *)this)->_1_anwesendVorUeberfahrt[0]));
#endif
		;
		/* merge: anwesendVorUeberfahrt[1] = 1(13, 2, 13) */
		reached[0][2] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->_1_anwesendVorUeberfahrt[1]);
		((P0 *)this)->_1_anwesendVorUeberfahrt[1] = 1;
#ifdef VAR_RANGES
		logval("A:anwesendVorUeberfahrt[1]", ((int)((P0 *)this)->_1_anwesendVorUeberfahrt[1]));
#endif
		;
		/* merge: anwesendVorUeberfahrt[2] = 1(13, 3, 13) */
		reached[0][3] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_1_anwesendVorUeberfahrt[2]);
		((P0 *)this)->_1_anwesendVorUeberfahrt[2] = 1;
#ifdef VAR_RANGES
		logval("A:anwesendVorUeberfahrt[2]", ((int)((P0 *)this)->_1_anwesendVorUeberfahrt[2]));
#endif
		;
		/* merge: anwesendNachUeberfahrt[0] = 0(13, 4, 13) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals[3] = ((int)((P0 *)this)->_1_anwesendNachUeberfahrt[0]);
		((P0 *)this)->_1_anwesendNachUeberfahrt[0] = 0;
#ifdef VAR_RANGES
		logval("A:anwesendNachUeberfahrt[0]", ((int)((P0 *)this)->_1_anwesendNachUeberfahrt[0]));
#endif
		;
		/* merge: anwesendNachUeberfahrt[1] = 0(13, 5, 13) */
		reached[0][5] = 1;
		(trpt+1)->bup.ovals[4] = ((int)((P0 *)this)->_1_anwesendNachUeberfahrt[1]);
		((P0 *)this)->_1_anwesendNachUeberfahrt[1] = 0;
#ifdef VAR_RANGES
		logval("A:anwesendNachUeberfahrt[1]", ((int)((P0 *)this)->_1_anwesendNachUeberfahrt[1]));
#endif
		;
		/* merge: anwesendNachUeberfahrt[2] = 0(13, 6, 13) */
		reached[0][6] = 1;
		(trpt+1)->bup.ovals[5] = ((int)((P0 *)this)->_1_anwesendNachUeberfahrt[2]);
		((P0 *)this)->_1_anwesendNachUeberfahrt[2] = 0;
#ifdef VAR_RANGES
		logval("A:anwesendNachUeberfahrt[2]", ((int)((P0 *)this)->_1_anwesendNachUeberfahrt[2]));
#endif
		;
		/* merge: i = 0(13, 7, 13) */
		reached[0][7] = 1;
		(trpt+1)->bup.ovals[6] = ((int)((P0 *)this)->_1_i);
		((P0 *)this)->_1_i = 0;
#ifdef VAR_RANGES
		logval("A:i", ((int)((P0 *)this)->_1_i));
#endif
		;
		/* merge: .(goto)(0, 14, 13) */
		reached[0][14] = 1;
		;
		_m = 3; goto P999; /* 7 */
	case 36: /* STATE 8 - exercise15.pml:14 - [((i<=2))] (13:0:1 - 1) */
		IfNotBlocked
		reached[0][8] = 1;
		if (!((((int)((P0 *)this)->_1_i)<=2)))
			continue;
		/* merge: assert((anwesendVorUeberfahrt[i]!=anwesendNachUeberfahrt[i]))(13, 9, 13) */
		reached[0][9] = 1;
		spin_assert((((int)((P0 *)this)->_1_anwesendVorUeberfahrt[ Index(((int)((P0 *)this)->_1_i), 3) ])!=((int)((P0 *)this)->_1_anwesendNachUeberfahrt[ Index(((int)((P0 *)this)->_1_i), 3) ])), "(anwesendVorUeberfahrt[i]!=anwesendNachUeberfahrt[i])", II, tt, t);
		/* merge: i = (i+1)(13, 10, 13) */
		reached[0][10] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_1_i);
		((P0 *)this)->_1_i = (((int)((P0 *)this)->_1_i)+1);
#ifdef VAR_RANGES
		logval("A:i", ((int)((P0 *)this)->_1_i));
#endif
		;
		/* merge: .(goto)(0, 14, 13) */
		reached[0][14] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 37: /* STATE 16 - exercise15.pml:30 - [assert((!(((anwesendVorUeberfahrt[0]==1)&&(anwesendVorUeberfahrt[2]==1)))&&!(((anwesendVorUeberfahrt[0]==1)&&(anwesendVorUeberfahrt[1]==1)))))] (0:17:0 - 3) */
		IfNotBlocked
		reached[0][16] = 1;
		spin_assert(( !(((((int)((P0 *)this)->_1_anwesendVorUeberfahrt[0])==1)&&(((int)((P0 *)this)->_1_anwesendVorUeberfahrt[2])==1)))&& !(((((int)((P0 *)this)->_1_anwesendVorUeberfahrt[0])==1)&&(((int)((P0 *)this)->_1_anwesendVorUeberfahrt[1])==1)))), "( !(((anwesendVorUeberfahrt[0]==1)&&(anwesendVorUeberfahrt[2]==1)))&& !(((anwesendVorUeberfahrt[0]==1)&&(anwesendVorUeberfahrt[1]==1))))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 38: /* STATE 17 - exercise15.pml:32 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][17] = 1;
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

