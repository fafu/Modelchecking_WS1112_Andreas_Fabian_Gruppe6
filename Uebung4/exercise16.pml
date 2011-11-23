#define P 5 /* Anzahl der gesamten Prozesse muss ungerade sein*/
#define PG 6
byte t = 1; /*Anzahl der faulty Prozesse*/

typedef Arraychan{
	chan ch[PG] = [1] of {bit};
}

Arraychan A[PG];


inline send(value){
	for(j : 1..P){
		/*Sende an alle Prozsse den Wert value*/
		A[i].ch[j]!value;
	}
}
inline sendFaulty(){
	for(j : 1..P){
		/*Sende an alle Prozsse einen arbitrary Wert*/
		if
		::A[i].ch[j]!1;
		::A[i].ch[j]!0;
		fi;
	}
}
inline receive_mv_faulty(){
	for(j : 1..P){
		/*Empfange alle an diesen Prozess i gesendeten Messages */
		A[j].ch[i]?c_i;
	}
}
inline receive_mv(){
	for(j : 1..P){
		/*Empfange alle an diesen Prozess i gesendeten Messages */
		A[j].ch[i]?c_i;
		c_i_sum = c_i_sum + c_i;
	}
}
proctype faultyProcess(byte i){
	bit c_i;
	byte m, j;
	for(m : 1..((P/4)+1)){
		atomic{sendFaulty();}
		receive_mv_faulty();
		if
		:: (m == i) -> sendFaulty();
		:: else -> ;
		fi;
  		A[m].ch[i]?c_i;
	}
}


proctype validProcess(byte i){
	bool v_i, u, c_i;
	if
	:: v_i = true;
	:: v_i = false;
	fi;
	byte m, j, c_i_sum;
	for(m : 1..((P/4)+1)){
		atomic{send(v_i);};
		receive_mv();
		atomic{
			if
			:: (c_i_sum >= ((P/2)+1)) -> v_i = 1;
			:: else -> v_i = 0; c_i_sum = P - c_i_sum;
			fi;
			if
			:: (m == i) -> send(v_i);
			:: else -> ;
			fi;		
	}
		A[m].ch[i]?u;
		atomic{
			if
			:: (c_i_sum <= ((3*P)/4)) -> v_i = u;
			:: else -> ;
			fi;
		}
	}
	
}



init {
	byte i;
	for(i : 1..P){
		if
		:: (i<=t) -> run faultyProcess(i);
		:: else -> run validProcess(i);
		fi;
	}
}