#define PROCCOUNT 5 /* Anzahl der gesamten Prozesse muss ungerade sein*/
#define FAULTYCOUNT 1 /*Anzahl der faulty Prozesse*/

bit startValues[PROCCOUNT];
bit endValues[PROCCOUNT];
bool finishedProcs[PROCCOUNT];

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
	printf("This faulty process has pid = %d and given i = %d\n",_pid,i);
	/*Die validen Prozesse erwarten FAULTYCOUNT+1 Runden*/
	for(round : 0..FAULTYCOUNT){
		atomic{sendFaulty();}
		receive_mv_faulty();
		/*Wenn aktuelle Prozessnummer der Rundennummer entspricht*/
		/*sendet der Prozess als General an alle Prozesse*/
		if
		:: (round == i) -> sendFaulty();
		:: else -> ;
		fi;
		/*Empfange den vom General gesendeten Wert*/
		/*nur um den Kanal zu raeumen, keine Auswertung*/
  		A[round].ch[i]?tempCounter;
	}
	finishedProcs[i] = true;
}

/*Modelliert einen validen Prozess*/
/*Modell setzt das Protokoll von Berman und Garay um*/
proctype validProcess(byte i; bool localValue){
	/*Speichere den Startwert dieses Prozesses*/
	startValues[i] = localValue;
	printf("This valid process has pid = %d and given i = %d\n",_pid,i);
	bool proposedValue, tempCounter;
	byte round, j, valueCounter;
	/*nach FAULTYCOUNT +1 Schritten soll Einigkeit bestehen*/
	for(round : 0..FAULTYCOUNT){
		atomic{send(localValue);};
		/*Empfange den lokalen Wert jedes Prozesses*/
		receive_mv();
		atomic{
			/*Werte den empfangenen Vektor aus*/
			/*Setze den lokalen Wert auf die Mehrheit der empfangenen Werte*/
			if
			:: (valueCounter >= ((PROCCOUNT/2)+1)) -> localValue = 1;
			:: else -> localValue = 0; valueCounter = PROCCOUNT - valueCounter;
			fi;
			/*Wenn aktuelle Prozessnummer der Rundennummer entspricht*/
			/*sendet der Prozess als General die ermittelte Mehrheit an alle Prozesse*/
			if
			:: (round == i) -> send(localValue);
			:: else -> ;
			fi;		
	}
		/*Empfange den vom General gesendeten Wert*/
		A[round].ch[i]?proposedValue;
		/*Nur wenn weniger als 3/4 der Prozesse denselben Wert gemeldet haben*/
		/*wird der Wert vom General übernommen*/
		atomic{
			if
			:: (valueCounter <= ((3*PROCCOUNT)/4)) -> localValue = proposedValue;
			:: else -> ;
			fi;
		}
	}
	/*Speichere den Endwert dieses Prozesses*/
	endValues[i] = localValue;
	finishedProcs[i] = true;	
}



/*Initialsierungsbereich*/
init {
	byte i;
	byte localValueSum;
	/*Concensus Definition:*/
	/* 0 = lokale Variable aller validen Prozesse ist 0*/
	/* 1 = lokale Variable aller validen Prozesse ist 1*/
	/* 2 = lokale Variable aller validen Prozesse stimmt nicht ueberein*/
	byte preConsensus = 1;
	byte postConsensus = 3;
	bool allFinished = false;
	/*Setze alle Werte des finishedProcs auf false*/
	for(i : 0..(PROCCOUNT-1)){
		finishedProcs[i] = false;
	}
	
	/*Erstelle zuerst alle invaliden Prozesse und danach alle validen Prozesse*/
	for(i : 0..(PROCCOUNT-1)){
		if
		:: (i<FAULTYCOUNT) -> run faultyProcess(i);
		:: else -> run validProcess(i, 1);
		fi;
	}
	
	for(i : 0..(PROCCOUNT-1)){
		if
		:: (i<FAULTYCOUNT) -> ;
		:: else -> printf("Startwert Prozess %d ist %d und finishedValue: %d\n", i, startValues[i], finishedProcs[i]);
		fi;
	}
	/*Warte bis alle Prozesse terminieren*/
	for(i : 0..(PROCCOUNT-1)){
		(finishedProcs[i]==true);
	}
	
	atomic{
		for(i : FAULTYCOUNT..(PROCCOUNT-1)){
			localValueSum = localValueSum + endValues[i];		
		}
		if
		:: (localValueSum == (PROCCOUNT - FAULTYCOUNT)) -> postConsensus = 1;
		:: (localValueSum == 0) -> postConsensus = 0;
		:: else -> postConsensus = 2; 
		fi
		/*moeglich: assert(postConsensus != 2)*/
	}
	
	atomic{
		localValueSum = 0;
		for(i : FAULTYCOUNT..(PROCCOUNT-1)){
			localValueSum = localValueSum + startValues[i];		
		}
		if
		:: (localValueSum == (PROCCOUNT - FAULTYCOUNT)) -> preConsensus = 1;
		:: (localValueSum == 0) -> preConsensus = 0;
		:: else -> preConsensus = 2; 
		fi
		/*moeglich: wenn(preConsensus < 2) dann assert(postConsensus == preConsensus)*/
	}
	
	allFinished = true;
}

never {
	do
	:: 
	::
	od
}