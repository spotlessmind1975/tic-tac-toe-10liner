# SOURCE CODE (EXPLAINED)

Below you will find the source code of the game explained. The plain file can be read [here](../tic-tac-toe-10liner-plain.bas). The source code has been written extensively (without abbreviations), in order to make it easier to understand. Each line has been commented to illustrate how the code works.

## INITIALIZATION (LINES 0-1)

    1 DEFINE STRING COUNT 32 : DEFINE STRING SPACE 512

These instructions are specific to [ugBasic](https://ugbasic.iwashere.eu), and they are intended to specify the actual space available to strings. The need to indicate this space depends on the fact that the rules oblige the program listing. It follows that, since the runtime module of [ugBasic](https://ugbasic.iwashere.eu) treats the source code like a "string", it is necessary to allocate an adequate amount of space for all computers in order to print it.

    2 BITMAP ENABLE (16)

We ask for a resolution that gives a good number of colors. Let us remember that [ugBasic](https://ugbasic.iwashere.eu) is an isomorphic language. This means that it is not advisable to indicate a specific resolution or color or other characteristics for the graphics you want, but it is given the opportunity to suggest it. Each compiler will decide, according to the limits of hardware, what resolution and color depth of use.

    INK WHITE : CLS BLACK

Change color to white (foreground) and black (background). 

     POSITIVE CONST t = 
        ( SCREEN HEIGHT - (((16*3))))/2 :
     POSITIVE CONST l = 
        ( SCREEN WIDTH - ((16*3)))/2

Now we calculate the left (`l`) and top margins (`t`) of the game board. This type of calculations is carried out through the use of the constants (`CONST`) which, in general, allow a better performance and an employment of space equal to zero. See [game state](./game-state.md) for more information about `POSITIVE` modifier.

      b = NEW IMAGE(16,16)
    1 c = NEW IMAGE (16,16)
      r = NEW IMAGE (16,16)

We define three spaces of image where we will position the background to delete the symbol (`b`), the symbol **O** (`r`) and the symbol **X** (`c`), respectively.

    DRAW 4,4 TO 12,12 : DRAW 12,4 TO 4,12

These instructions draw a (implicit `WHITE`) **X** symbol, located in the center of a square of 16 by 16 pixels from origin (0,0).

    INK RED : CIRCLE 24,8,4

These instructions draw a (explicit `RED`) **O** symbol, located in the center of a square of 16 by 16 pixels, from starting point (16,0).

    GET IMAGE b FROM 32,32 
	GET IMAGE c FROM 0,0
	GET IMAGE r FROM 16,0

These instructions save a copy of the image designed on the screen by three default areas. These copies are used to draw the symbols on the screen. See [game state](./game-state.md) for more information

## GAME LOOP (LINES 1-8)

    DO

This is where the game loop begins: every time the game ends, it will start over from here.

## PREPARE THE SCREEN (LINES 1-2)

	CLS BLACK : HOME

These instructions clear the screen and set the coordinates of the next screen write to the origin (0,0).

    2 GOSUB 9

At this point we call the routine which shows the symbol that is currently playing (at line 9).

    INK RED : CENTER "10 LINER" : CENTER "TIC-TAC-TOE!" : PRINT

Now let's print the three lines with the game title.

    INK WHITE : LOCATE 0, SCREEN ROWS - 1 : CENTER "1...9 TO PLAY"; 

We print the game instructions on the last line.

    p = (WORD) 0 : p1 = (WORD) 0 : p2 = (WORD) 0 

We initialize the three variables of the game, namely: the positions occupied by both symbols (`p`), the positions occupied by the first player (sign O, `p1`) and the positions occupied by the second player (X, `p2`). The use of the `WORD` modifier is necessary because the positions to be registered are 9, and a `BYTE` (which is the type automatically assumed for the value 0) is not able to maintain 9 positions as there are only 8 bits in a `BYTE`. See [game state](./game-state.md) for more information.

    w1 = 0 : w2 = 0

We also initialize the variables that take into account the victory conditions, i.e. those combinations that actually determine a victory for one or the other player.

    3 BOX l-5, t-8 TO l+(16*3)+5, t+(16*3)+8

This instruction draws the edge of the game board.

## INNER LOOP (3-7)

    DO : k = VAL(INKEY)

At each turn, we read the entered key from the keyboard, and convert it into a digit from zero to 9. 

    1 IF k>0 THEN : DEC k

This way we monitor keystrokes. Since the bits are 0 based, we decrement the index position entered.

    IF (p AND (2^k)) = 0 THEN : p=(p OR(2^k))

The first thing is to check if the box has already been used or not. If it hasn't been used...

    IF q=1 THEN : p1=(p1 OR(2^k))

Now let's see if it's the turn of the first player (symbol **O**). In which case, the variable `p1` will be populated with the occupied box.

    ELSE
    4 p2=(p2 OR(2^k)) : ENDIF

If it is the second player (symbol **X**) then the variable `p2` will be updated.

    ADD q, 1, 1 TO 2 

We're updating the current player indicator.

    GOSUB 9 : ENDIF : ENDIF

## UPDATE THE GAME BOARD (LINES 4-5) 

    FOR y = 0 TO 2 : FOR x = 0 TO 2 : k = y * 3 + x

We go through the entire game plan, for each row and for each column. The index `k` actually contains the positional index according to the table drawn above.

    IF (p1 AND(2^k))>0 THEN : PUT IMAGE c AT l+x*16,t+y*16

If the identified position is used by the first player, then we draw a **O**.

    5 ELSEIF (p2 AND(2^k))>0 THEN : PUT IMAGE r AT l+x*16,t+y*16

If the identified position is used by the second player, then we draw a **X**.

    ELSE : PUT IMAGE b AT l+x*16,t+y*16 : ENDIF

For other cases, we clean the position.

    NEXT : NEXT

Repeat the loop for each cell.

## CHECK CONDITIONS (LINES 5-7) 

	w1=(p1=7)+(p1=56)+(p1=448)+(p1=292) 
    6 w1=w1+(p1=146)+(p1=73)+(p1=273)+(p1=84)+(p1=49)+(p1=92)+(p1=124)

First we calculate if the first player has won, by adding up each single victory condition.

    w2=(p2=7)+(p2=56)+(p2=448)+(p2=292)+(p2=146)
    7 w2=w2+(p2=73)+(p2=273)+(p2=84)+(p2=49)+(p2=92)+(21=124)
			
Then we calculate if the second player has won, by adding up each single victory condition.

    net=(p=511)

Finally, we calculate if both players have drawn.

    EXIT IF (w1<>0) OR (w2<>0) OR (net<>0)

If one of the sums is not zero, we can break out of the innermost loop, and decide who wins.

   LOOP

Here ends the inner loop.

## FINAL SCREEN (LINES 7-8)

	CLS BLACK 

Clear the screen to black.

    IF w1 THEN : CLS 
    8 LOCATE 0,2 : CENTER "PLAYER 1 WINS!" : ENDIF

If it was the contribution of the sums for the first player to get us out of the internal loop, then we decree his victory by writing an appropriate message.

    IF w2 THEN : CLS : LOCATE 0,2 : CENTER "PLAYER 2 WINS!" : ENDIF

If it was the contribution of the sums for the second player to get us out of the internal loop, then we decree his victory by writing an appropriate message.

    IF net THEN : CLS : LOCATE 0,2 : CENTER "NO ONE WINS!" : ENDIF

If it was the fact that the game cannot go ahead since all the screen is filled by symbols, then write the appropriate message. Note that, due to the rules of the game, it is not possible to fill the screen and make the last move win. This ensures that the order of checking and writing messages is always correct.

	WAIT 4000 MS

We will wait for 4 seconds before restart the game.

	LOOP

End of the game loop.

## ROUTINE: WHO IS PLAYING? (LINE 9)

    9 IF q=1 THEN : PUT IMAGE b AT SCREEN WIDTH-16,t :
      PUT IMAGE c AT 0,t

It is the first player that is playing? Show the **O** symbol.

	ELSE : PUT IMAGE b AT 0,t : 
      PUT IMAGE r AT SCREEN WIDTH -16,t : ENDIF

It is the second player that is playing? Show the **X** symbol.

	RETURN

Return to the caller
