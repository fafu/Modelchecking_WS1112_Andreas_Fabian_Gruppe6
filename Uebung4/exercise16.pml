#define PROCCOUNT 5 /*Gesamtanzahl an Prozessen; muss ungerade sein*/
#define FAULTYCOUNT 1 /*Anzahl fehlerhafter Prozesse*/

/*verwende zwei Arrays fuer Start- und Endwerte aller lokalen Variablen*/
/*die anfangs zugewiesenen Werte aller Prozesse*/
bit startValues[PROCCOUNT];
/*die am Ende erreichten Werte aller Prozesse*/
bit endValues[PROCCOUNT];

/*jeder Prozess meldet, wenn er terminiert*/
/*finishedProcs[i] wird true, wenn Prozess i terminiert*/
bool finishedProcs[PROCCOUNT];
/*allFinished wird wahr gesetzt, wenn die Protokolldurchlaeufe beendet sind*/
/*und die Auswertung abgeschlossen ist*/
bool allFinished = false;

/*verwende zwei Variablen, die speichern, ob anfangs bzw. am Ende Konsens*/
/*unter den validen Prozessen besteht*/
/*concensus Definition:*/
/* 0 = lokale Variable aller validen Prozesse ist 0*/
/* 1 = lokale Variable aller validen Prozesse ist 1*/
/* 2 = lokale Variable aller validen Prozesse stimmt nicht ueberein*/
/* 3 = Initialwert*/
byte preConsensus = 3;
byte postConsensus = 3;

/*Struktur zum speichern von PROCCOUNT Kanaelen*/
typedef Arraychan{
  chan ch[PROCCOUNT] = [1] of {bit};
}

/*2D-Array zum Senden von jedem zu jedem Prozess*/
/*wie in der Aufgabe empfohlen*/
Arraychan A[PROCCOUNT];

/*sendet an alle Prozesse den Wert value*/
inline send(value){
  for(j : 0..(PROCCOUNT-1)){
    A[i].ch[j]!value;
  }
}

/*sendet an alle Prozesse einen nichtdeterministischen Wert, 0 oder 1*/
inline sendFaulty(){
  for(j : 0..(PROCCOUNT-1)){
    if
    ::A[i].ch[j]!1;
    ::A[i].ch[j]!0;
    fi;
  }
}

/*empfaengt alle an Prozess i gesendeten Messages*/
/*wird nur genutzt, um den Kanal frei zu raeumen*/
inline receive_mv_faulty(){
  for(j : 0..(PROCCOUNT-1)){
    A[j].ch[i]?tempCounter;
  }
}

/*empfaengt alle an Prozess i gesendeten Messages */
inline receive_mv(){
  for(j : 0..(PROCCOUNT-1)){
    A[j].ch[i]?tempCounter;
    valueCounter = valueCounter + tempCounter;
  }
}

/*modelliert einen fehlerhaften Prozess*/
/*Modell garantiert nur, dass Kanaele zum richtigen Zeitpunkt*/
/*gefuellt sowie geraeumt werden*/
proctype faultyProcess(byte i){
  bit tempCounter;  /*Dummyvariable, noetig fuer den Empfang aus Kanal*/
  byte round;       /*Laufvariable fuer die Runden des Protokolls*/ 
  byte j;           /*Laufvariable fuer das Empfangen von allen Prozessen*/
  //printf("This faulty process has pid = %d and given i = %d\n",_pid,i);
  /*das Protokoll durchlaeuft FAULTYCOUNT+1 Runden*/
  for(round : 0..(FAULTYCOUNT)){
    atomic{
      sendFaulty();
    }
    receive_mv_faulty();
    /*wenn aktuelle Prozessnummer der Rundennummer entspricht*/
    /*sendet der Prozess als General an alle Prozesse*/
    if
    :: (round == i) -> sendFaulty();
    :: else -> ;
    fi;
    /*empfange den vom General gesendeten Wert*/
    /*nur um den Kanal zu raeumen, keine Auswertung*/
    A[round].ch[i]?tempCounter;
  }
  finishedProcs[i] = true;
}

/*modelliert einen validen Prozess*/
/*Modell setzt das Protokoll von Berman und Garay um*/
proctype validProcess(byte i; bool localValue){
  /*speichere den Startwert dieses Prozesses*/
  startValues[i] = localValue;
  //printf("This valid process has pid = %d and given i = %d\n",_pid,i);
  bool proposedValue, tempCounter;
  byte round, j, valueCounter;
  /*das Protokoll durchlaeuft FAULTYCOUNT +1 Schritte*/ 
  for(round : 0..(FAULTYCOUNT)){
    atomic{
      send(localValue);
    };
    /*empfange den lokalen Wert jedes Prozesses*/
    receive_mv();
    atomic{
      /*werte den empfangenen Vektor aus*/
      /*setze den lokalen Wert auf die Mehrheit der empfangenen Werte*/
      if
      :: (valueCounter >= ((PROCCOUNT/2)+1)) -> localValue = 1;
      :: else -> localValue = 0; valueCounter = PROCCOUNT - valueCounter;
      fi;
      /*wenn aktuelle Prozessnummer der Rundennummer entspricht*/
      /*sendet der Prozess als General die ermittelte Mehrheit an alle Prozesse*/
      if
      :: (round == i) -> send(localValue);
      :: else -> ;
      fi;		
    }
    /*empfange den vom General gesendeten Wert*/
    A[round].ch[i]?proposedValue;
    /*nur wenn weniger als 3/4 der Prozesse denselben Wert gemeldet haben*/
    /*wird der Wert vom General übernommen*/
    atomic{
      if
      :: (valueCounter <= ((3*PROCCOUNT)/4)) -> localValue = proposedValue;
      :: else -> ;
      fi;
    }
  }
  /*speichere den Endwert dieses Prozesses*/
  endValues[i] = localValue;
  finishedProcs[i] = true;	
}



/*Initialsierungsbereich*/
init {
  byte i;
  byte localValueSum;
  
  /*setze alle Werte des finishedProcs auf false*/
  for(i : 0..(PROCCOUNT-1)){
    finishedProcs[i] = false;
  }
	
  /*erstelle zuerst alle invaliden Prozesse und danach alle validen Prozesse*/
  for(i : 0..(PROCCOUNT-1)){
    if
    :: (i<FAULTYCOUNT) -> run faultyProcess(i);
    :: else -> run validProcess(i, 1);
    fi;
  }
	
  /*warte bis alle Prozesse terminieren*/
  for(i : 0..(PROCCOUNT-1)){
    (finishedProcs[i]==true);
  }

  /*alle Prozesse sind nun fertig; werte aus*/	

  atomic{
    /*ermittle, ob am Ende Einigkeit unter allen validen Prozessen besteht*/
    localValueSum = 0;
    for(i : FAULTYCOUNT..(PROCCOUNT-1)){
      localValueSum = localValueSum + endValues[i];		
    }
    /*alle Wert 1 -> Summe entspricht Anzahl valider Prozesse*/
    /*alle Wert 0 -> Summe 0*/
    /*ansonsten kein einheitlicher Wert*/
    if
    :: (localValueSum == (PROCCOUNT - FAULTYCOUNT)) -> postConsensus = 1;
    :: (localValueSum == 0) -> postConsensus = 0;
    :: else -> postConsensus = 2; 
    fi
    /*moeglich: assert(postConsensus != 2)*/
  }
	
  atomic{
    /*ermittle, ob am Anfang Einigkeit unter allen Prozessen bestand*/
    localValueSum = 0;
    for(i : FAULTYCOUNT..(PROCCOUNT-1)){
      localValueSum = localValueSum + startValues[i];		
    }
    /*wie oben*/
    if
    :: (localValueSum == (PROCCOUNT - FAULTYCOUNT)) -> preConsensus = 1;
    :: (localValueSum == 0) -> preConsensus = 0;
    :: else -> preConsensus = 2; 
    fi
    /*moeglich: (preConsensus < 2) dann assert(postConsensus == preConsensus)*/
  }
	
  allFinished = true;
}

never {
  do
  :: (allFinished && postConsensus > 1) -> break
  :: else
  od
}

never {
  do
  :: (allFinished && preConsensus < 2 && preConsensus != postConsensus) -> break
  :: else
  od
}
