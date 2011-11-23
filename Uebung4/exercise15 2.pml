proctype A(){
	/*index 0 = goat, 1 = wulf, 2 = cabbage*/
	bit anwesendVorUeberfahrt[3];
	bit anwesendNachUeberfahrt[3];
	/*setze alle zuerst anwesend*/
	anwesendVorUeberfahrt[0] = 1;
	anwesendVorUeberfahrt[1] = 1;
	anwesendVorUeberfahrt[2] = 1;
	anwesendNachUeberfahrt[0] = 0;
	anwesendNachUeberfahrt[1] = 0;
	anwesendNachUeberfahrt[2] = 0;
	/*versichere das alle unterschiedlich*/
	byte i;
	for(i : 0..2){
		assert(anwesendVorUeberfahrt[i]!=anwesendNachUeberfahrt[i]);
	}
	/*wie funktionen erstellen? wie abbilden */
	/*for(i : 0..2){
		if
		:: value = 3;
		:: value = 4;
		fi
	}*/
	/*
	rules: 
		one one side: 
			goat and cabbage not on one side: 0 and 2 
			wulf and goat not on one side: 0 and 1	
	*/
	assert(!((anwesendVorUeberfahrt[0]==1)&&(anwesendVorUeberfahrt[2]==1))&&!((anwesendVorUeberfahrt[0]==1)&&(anwesendVorUeberfahrt[1]==1)));

};
bit goat = 0;
bit wolf = 0;
bit cabbage = 0;
bit man = 0;
proctype B(){
	printf("%d%d%d%d",cabbage, goat, wolf, man);
	do
	:: (goat == cabbage && goat != man) -> printf("Abbruch"); break; 
	:: (wolf == goat && wolf != man) -> printf("Abbruch"); break;
	:: else 
		if
		:: (man == cabbage) -> atomic{man = !man; cabbage = !cabbage; printf("Mann faehrt mit Cabbage in R:%d\n", man);}
		:: (man == goat) -> atomic{man = !man; goat = !goat; printf("Mann faehrt mit Goat in R:%d\n", man);}
		:: (man == wolf) -> atomic{man = !man; wolf = !wolf; printf("Mann faehrt mit Wolf in R:%d\n", man);}
		:: atomic{man = !man; printf("Mann faehrt alleine in R:%d\n", man);}
		fi 
	od
}
never{
	do
	:: (goat && wolf && cabbage) -> break;
	:: else
	od
}
proctype travel(){
	if
	:: (man == cabbage) -> man = !man; cabbage = !cabbage; printf("Mann faehrt mit Cabbage in R:%d\n", man);
	:: (man == goat) -> man = !man; goat = !goat; printf("Mann faehrt mit Goat in R:%d\n", man);
	:: (man == wolf) -> man = !man; wolf = !wolf; printf("Mann faehrt mit Wolf in R:%d\n", man);
	:: man = !man; printf("Mann faehrt alleine in R:%d\n", man);
	fi
}
init{
	run B();
}
