#define PROCCOUNT 5 /* Anzahl der gesamten Prozesse muss ungerade sein*/
#define FAULTYCOUNT 1 /*Anzahl der faulty Prozesse*/

typedef Arraychan{
	chan ch[PROCCOUNT] = [1] of {bit};
}

Arraychan A[PROCCOUNT];

/*Sendet an alle Prozesse den Wert value*/
inline send(value){
	for(j : 0..(PROCCOUNT-1)){
		A[i].ch[j]!value;
	}
}

/*Sendet an alle Prozesse einen nichtdeterministischen Wert zwischen 0 und 1*/
inline sendFaulty(){
	for(j : 0..(PROCCOUNT-1)){
		if
		::A[i].ch[j]!1;
		::A[i].ch[j]!0;
		fi;
	}
}

/*Empfaengt alle an Prozess i gesendeten Messages*/
/*dies wird nur genutzt um den Kanal frei zu raeumen*/
inline receive_mv_faulty(){
	for(j : 0..(PROCCOUNT-1)){
		A[j].ch[i]?tempCounter;
	}
}

/*Empfaengt alle an Prozess i gesendeten Messages */
inline receive_mv(){
	for(j : 0..(PROCCOUNT-1)){
		A[j].ch[i]?tempCounter;
		valueCounter = valueCounter + tempCounter;
	}
}

/*Modelliert einen fehlerhaften Prozess*/
/*Modell garantiert nur, dass Kanaele zum richtigen Zeitpunkt*/
/*gefuellt sowie geraeumt werden*/
proctype faultyProcess(byte i){
	bit tempCounter;	/*Dummyvariable, noetig fuer den Empfang aus Kanal*/
	byte round;			/*Laufvariable fuer die Runden des Protokolls*/
	byte j;				/*Laufvariable fuer das Empfangen von allen Prozessen*/
	
	for(round : 0..(PROCCOUNT/4)){
		atomic{sendFaulty();}
		receive_mv_faulty();
		
		if
		:: (round == i) -> sendFaulty();
		:: else -> ;
		fi;
  		A[round].ch[i]?tempCounter;
	}
}


proctype validProcess(byte i; bool localValue){
	bool proposedValue, tempCounter;
	byte round, j, valueCounter;
	for(round : 0..(PROCCOUNT/4)){
		atomic{send(localValue);};
		receive_mv();
		atomic{
			if
			:: (valueCounter >= ((PROCCOUNT/2)+1)) -> localValue = 1;
			:: else -> localValue = 0; valueCounter = PROCCOUNT - valueCounter;
			fi;
			if
			:: (round == i) -> send(localValue);
			:: else -> ;
			fi;		
	}
		A[round].ch[i]?proposedValue;
		atomic{
			if
			:: (valueCounter <= ((3*PROCCOUNT)/4)) -> localValue = proposedValue;
			:: else -> ;
			fi;
		}
	}
	
}



init {
	byte i;
	for(i : 0..(PROCCOUNT-1)){
		if
		:: (i<=FAULTYCOUNT) -> run faultyProcess(i);
		:: else -> run validProcess(i, 0);
		fi;
	}
}