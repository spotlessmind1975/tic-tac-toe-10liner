# SOURCE CODE (EXPLAINED)

Below you will find the source code of the game explained. The plain file can be read [here](../tic-tac-toe-10liner-plain.bas). The source code has been written extensively (without abbreviations), in order to make it easier to understand. Each line has been commented to illustrate how the code works.

## INITIALIZATION (LINES 0-1)

    1 DEFINE STRING COUNT 32 : DEFINE STRING SPACE 512

These instructions are specific to [ugBasic](https://ugbasic.iwashere.eu), and they are intended to specify the actual space available to strings. The need to indicate this space depends on the fact that the rules oblige the program listing. It follows that, since the runtime module of [ugBasic](https://ugbasic.iwashere.eu) treats the source code like a "string", it is necessary to allocate an adequate amount of space for all computers in order to print it.

    2 BITMAP ENABLE (16)

We ask for a resolution that gives a good number of colors. Let us remember that [ugBasic](https://ugbasic.iwashere.eu) is an isomorphic language. This means that it is not advisable to indicate a specific resolution or color or other characteristics for the graphics you want, but it is given the opportunity to suggest it. Each compiler will decide, according to the limits of hardware, what resolution and color depth of use.

    INK WHITE : CLS BLACK

Change color to white (foreground) and black (background). 

    CONST w=16*3
	POSITIVE CONST t = ( SCREEN HEIGHT - w )  /2 
	POSITIVE CONST l = ( SCREEN WIDTH - w ) / 2

Now we calculate the left (`l`) and top margins (`t`) of the game board. This type of calculations is carried out through the use of the constants (`CONST`) which, in general, allow a better performance and an employment of space equal to zero. See [game state](./game-state.md#the-board-margins-t-l) for more information about `POSITIVE` modifier.

      b = NEW IMAGE(16,16)
      c = NEW IMAGE (16,16)
    1 r = NEW IMAGE (16,16)

We define three spaces of image where we will position the background to delete the symbol (`b`), the symbol **O** (`r`) and the symbol **X** (`c`), respectively. See [game state](./game-state.md#the-pieces-b-c-r) for more information

    DRAW 4,4 TO 12,12 : DRAW 12,4 TO 4,12

These instructions draw a (implicit `WHITE`) **X** symbol, located in the center of a square of 16 by 16 pixels from origin (0,0).

    INK RED : CIRCLE 24,8,4

These instructions draw a (explicit `RED`) **O** symbol, located in the center of a square of 16 by 16 pixels, from starting point (16,0).

    GET IMAGE b FROM 32,32 
	GET IMAGE c FROM 0,0
	GET IMAGE r FROM 16,0

These instructions save a copy of the image designed on the screen by three default areas. These copies are used to draw the symbols on the screen. See [game state](./game-state.md#the-pieces-b-c-r) for more information

## GAME LOOP (LINES 1-8)

    DO

This is where the game loop begins: every time the game ends, it will start over from here.

## PREPARE THE SCREEN (LINES 1-2)

	CLS BLACK : HOME

These instructions clear the screen and set the coordinates of the next screen write to the origin (0,0).

    q = 1 : GOSUB 9

At this point we call the routine which shows the symbol that is currently playing (at line 9).

      INK RED
    2 CENTER "10 LINER" : CENTER "TIC-TAC-TOE!" : PRINT

Now let's print the three lines with the game title.

    INK WHITE : LOCATE , SCREEN ROWS - 1 : CENTER "1...9 TO PLAY"; 

We print the game instructions on the last line.

    p = (WORD) 0 : a = (WORD) 0 : g = (WORD) 0 

We initialize the three variables of the game, namely: the positions occupied by both symbols (`p`), the positions occupied by the first player (sign O, `a`) and the positions occupied by the second player (X, `g`). See [game state](./game-state.md#the-game-board-p-a-g) for more information.

    h = 0 : j = 0

We also initialize the variables that take into account the victory conditions, i.e. those combinations that actually determine a victory for one or the other player. See [game state](./game-state.md#who-wins-h-j-n) for more information.

    BOX l-5, t-8 TO l+w+5, t+w+8

This instruction draws the edge of the game board.

## INNER LOOP (3-7)

    3 DO : k = VAL(INKEY)

At each turn, we read the entered key from the keyboard, and convert it into a digit from zero to 9. See [game state](./game-state.md#selected-box-k) for more information.

    IF k THEN : DEC k : u = 2^k

This way we monitor keystrokes. Since the bits are 0 based, we decrement the index position entered.

    IF (p AND u) = 0 THEN : p=(p OR u)

The first thing is to check if the box has already been used or not. See [game state](./game-state.md#the-game-board-p-a-g) for more information.

    IF q=1 THEN : a=(a OR u)

Now let's see if it's the turn of the first player (symbol **O**). In which case, the variable `a` will be populated with the occupied box. See [game state](./game-state.md#the-game-board-p-a-g) for more information.

    ELSE : g=(g OR u) : ENDIF

If it is the second player (symbol **X**) then the variable `g` will be updated. See [game state](./game-state.md#the-game-board-p-a-g) for more information.

    ADD q, 1, 1 TO 2 

We're updating the current player indicator. See [game state](./game-state.md#current-player-q) for more information.

    GOSUB 9 : ENDIF : ENDIF

At this point we can call the routine which shows the symbol that is currently playing (at line 9), to update the screen.

## UPDATE THE GAME BOARD (LINES 3-5) 

      FOR y = 0 TO 2
    4 FOR x = 0 TO 2 : k = y * 3 + x

We go through the entire game plan, for each row and for each column. The index `k` actually contains the positional index according to the table drawn above. See [game state](./game-state.md#row-and-column-xy) for more information.

    IF (a AND(2^k))>0 THEN : PUT IMAGE c AT l+x*16,t+y*16

If the identified position is used by the first player, then we draw a **O**. See [game state](./game-state.md#the-game-board-p-a-g) for more information.

    ELSEIF (g AND(2^k))>0 THEN : PUT IMAGE r AT l+x*16,t+y*16

If the identified position is used by the second player, then we draw a **X**.  See [game state](./game-state.md#the-game-board-p-a-g) for more information.

      ELSE : PUT IMAGE b AT l+x*16,t+y*16 
    5 ENDIF

For other cases, we clean the position.

    NEXT : NEXT

Repeat the loop for each cell.

## CHECK CONDITIONS (LINES 5-7) 

      h=((a AND 7)=7)+((a AND 56)=56)+((a AND 448)=448)+((a AND 292)=292)
	  n=(p=511)
    6 h=h+((a AND 146)=146)+((a AND 273)=273)+((a AND 84)=84)+((a AND 73)=73)
	  j=((g AND 7)=7)+((g AND 56)=56)+((g AND 448)=448)+((g AND 292)=292)
			
    7 j=j+((g AND 146)=146)+((g AND 273)=273)+((g AND 84)=84)+((g AND 73)=73)

We calculate if the first player has won, by adding up each single victory condition.At the same time, we calculate if the second player has won, by adding up each single victory condition. Finally, we calculate if both players have drawn. See [game state](./game-state.md#who-wins-h-j-n) for more information.

    EXIT IF (h) OR (j) OR (n)

If one of the sums is not zero, we can break out of the innermost loop, and decide who wins.

    LOOP

Here ends the inner loop.

## FINAL SCREEN (LINES 7-8)

	CLS : LOCATE ,2 

Clear the screen and move the cursor to the destination position.

      IF h THEN : CLS 
    8 CENTER "PLAYER 1 WINS!" : ENDIF

If it was the contribution of the sums for the first player to get us out of the internal loop, then we decree his victory by writing an appropriate message. See [game state](./game-state.md#who-wins-h-j-n) for more information.

    IF j THEN : CENTER "PLAYER 2 WINS!" : ENDIF

If it was the contribution of the sums for the second player to get us out of the internal loop, then we decree his victory by writing an appropriate message. See [game state](./game-state.md#who-wins-h-j-n) for more information.

    IF n THEN : CENTER "NO ONE WINS!" : ENDIF

If it was the fact that the game cannot go ahead since all the screen is filled by symbols, then write the appropriate message. Note that, due to the rules of the game, it is not possible to fill the screen and make the last move win. This ensures that the order of checking and writing messages is always correct. See [game state](./game-state.md#who-wins-h-j-n) for more information.

	WAIT 4000 MS

We will wait for 4 seconds before restart the game.

	LOOP

End of the game loop.

## ROUTINE: WHO IS PLAYING? (LINE 9)

    9 IF q=1 THEN : PUT IMAGE b AT SCREEN WIDTH-16,t :
      PUT IMAGE c AT 0,t

It is the first player that is playing? Show the **O** symbol. See [game state](./game-state.md#current-player-q) for more information.

	ELSE : PUT IMAGE b AT 0,t : 
      PUT IMAGE r AT SCREEN WIDTH -16,t : ENDIF

It is the second player that is playing? Show the **X** symbol.  See [game state](./game-state.md#current-player-q) for more information.

	RETURN

Return to the caller
