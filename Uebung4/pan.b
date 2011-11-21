	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: /* STATE 1 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 4: /* STATE 2 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC travel */
;
		;
		
	case 6: /* STATE 2 */
		;
		now.man = trpt->bup.oval;
		;
		goto R999;

	case 7: /* STATE 3 */
		;
		now.cabbage = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 10: /* STATE 6 */
		;
		now.man = trpt->bup.oval;
		;
		goto R999;

	case 11: /* STATE 7 */
		;
		now.goat = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 14: /* STATE 10 */
		;
		now.man = trpt->bup.oval;
		;
		goto R999;

	case 15: /* STATE 11 */
		;
		now.wolf = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 17: /* STATE 13 */
		;
		now.man = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 19: /* STATE 17 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* CLAIM never_0 */
;
		;
		
	case 21: /* STATE 7 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC B */
;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		;
		
	case 28: /* STATE 11 */
		;
		now.cabbage = trpt->bup.ovals[1];
		now.man = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 30: /* STATE 16 */
		;
		now.goat = trpt->bup.ovals[1];
		now.man = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 32: /* STATE 21 */
		;
		now.wolf = trpt->bup.ovals[1];
		now.man = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 33: /* STATE 24 */
		;
		now.man = trpt->bup.oval;
		;
		goto R999;

	case 34: /* STATE 32 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC A */

	case 35: /* STATE 7 */
		;
		((P0 *)this)->_1_i = trpt->bup.ovals[6];
		((P0 *)this)->_1_anwesendNachUeberfahrt[2] = trpt->bup.ovals[5];
		((P0 *)this)->_1_anwesendNachUeberfahrt[1] = trpt->bup.ovals[4];
		((P0 *)this)->_1_anwesendNachUeberfahrt[0] = trpt->bup.ovals[3];
		((P0 *)this)->_1_anwesendVorUeberfahrt[2] = trpt->bup.ovals[2];
		((P0 *)this)->_1_anwesendVorUeberfahrt[1] = trpt->bup.ovals[1];
		((P0 *)this)->_1_anwesendVorUeberfahrt[0] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 7);
		goto R999;

	case 36: /* STATE 10 */
		;
		((P0 *)this)->_1_i = trpt->bup.oval;
		;
		goto R999;
;
		
	case 37: /* STATE 16 */
		goto R999;

	case 38: /* STATE 17 */
		;
		p_restor(II);
		;
		;
		goto R999;
	}

