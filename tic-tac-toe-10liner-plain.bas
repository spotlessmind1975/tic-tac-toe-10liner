0 

	DEFINE STRING COUNT 32
	DEFINE STRING SPACE 512 
	BITMAP ENABLE (16) 
	INK WHITE 
	CLS BLACK 
	POSITIVE CONST t = ( SCREEN HEIGHT -(((16*3))))/2 
	POSITIVE CONST l = ( SCREEN WIDTH -((16*3)))/2
	b = NEW IMAGE(16,16)

1

	c = NEW IMAGE (16,16)
	r = NEW IMAGE (16,16)
	DRAW 4,4 TO 12,12
	DRAW 12,4 TO 4,12
	INK RED
	CIRCLE 24,8,4
	GET IMAGE b FROM 32,32 
	GET IMAGE c FROM 0,0
	GET IMAGE r FROM 16,0
	HALT
	DO
		CLS BLACK
		HOME
		
2 

		GOSUB 9
		INK RED
		CENTER "10 LINER"
		CENTER "TIC-TAC-TOE!"
		PRINT
		INK WHITE
		LOCATE 0, SCREEN ROWS - 1
		CENTER "1...9 TO PLAY"; 
		p=(WORD) 0 
		p1= (WORD)0 
		p2=(WORD)0 
		w1=0 
		w2=0
		
3

        BOX l-5, t-8 TO l+(16*3)+5,t+(16*3)+8
        DO
        	k = VAL(INKEY)
			IF k>0 THEN 
				DEC k
				IF (p AND (2^k))=0 THEN
  					p=(p OR(2^k))
  					IF q=1 THEN
     					p1=(p1 OR(2^k))
  					ELSE
  					
4

  						p2=(p2 OR(2^k))
					ENDIF
					ADD q,1,1To2 
					GOSUB 9
				ENDIF
			ENDIF

			FOR y = 0 TO 2
				FOR x = 0 TO 2
					k=y*3+x
					IF (p1 AND(2^k))>0 THEN
						PUT IMAGE c AT l+x*16,t+y*16
						
5

					ELSEIF (p2 AND(2^k))>0 THEN
						PUT IMAGE r AT l+x*16,t+y*16
					ELSE
						PUT IMAGE b AT l+x*16,t+y*16
					ENDIF
				NEXT
			NEXT
			w1=(p1=7)+(p1=56)+(p1=448)+(p1=292)

6

			w1=w1+(p1=146)+(p1=73)+(p1=273)+(p1=84)+(p1=49)+(p1=92)+(p1=124)
			w2=(p2=7)+(p2=56)+(p2=448)+(p2=292)+(p2=146)
			
7
			w2=w2+(p2=73)+(p2=273)+(p2=84)+(p2=49)+(p2=92)+(21=124)
			net=(p=511)
			EXIT IF (w1<>0) OR (w2<>0) OR (net<>0)
		LOOP
		CLS BLACK 
		IF w1 THEN
			CLS
			
8

			LOCATE 0,2
			CENTER "PLAYER 1 WINS!"
		ENDIF
		IF w2 THEN
		    CLS
			LOCATE 0,2
			CENTER "PLAYER 2 WINS!"
		ENDIF
		IF net THEN
			CLS
			LOCATE 0,2
			CENTER "NO ONE WINS!"
		ENDIF
		WAIT 4000 MILLISECOND
	LOOP

9

	IF q=1 THEN
		PUT IMAGE b AT SCREEN WIDTH-16,t
		PUT IMAGE c AT 0,t
	ELSE
		PUT IMAGE b AT 0,t
		PUT IMAGE r AT SCREEN WIDTH -16,t
	ENDIF
	RETURN


