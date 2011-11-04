	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC p1 */

	case 3: /* STATE 1 */
		;
		now.flag[1] = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 6: /* STATE 4 */
		;
		now.turn = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 8: /* STATE 11 */
		;
		now.flag[1] = trpt->bup.oval;
		;
		goto R999;

		 /* PROC p0 */

	case 9: /* STATE 1 */
		;
		now.flag[0] = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 12: /* STATE 4 */
		;
		now.turn = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 14: /* STATE 11 */
		;
		now.flag[0] = trpt->bup.oval;
		;
		goto R999;

		 /* PROC :init: */

	case 15: /* STATE 1 */
		;
		now.turn = trpt->bup.oval;
		;
		goto R999;

	case 16: /* STATE 2 */
		;
		now.turn = trpt->bup.oval;
		;
		goto R999;

	case 17: /* STATE 5 */
		;
		now.flag[0] = trpt->bup.oval;
		;
		goto R999;

	case 18: /* STATE 6 */
		;
		now.flag[1] = trpt->bup.oval;
		;
		goto R999;

	case 19: /* STATE 7 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 20: /* STATE 8 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 21: /* STATE 9 */
		;
		p_restor(II);
		;
		;
		goto R999;
	}

