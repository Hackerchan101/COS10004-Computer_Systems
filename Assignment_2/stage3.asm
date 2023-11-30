;Input name and match stick
ChoosingName: 
      MOV R1, #ChoosingNameLabel ;Writing Label
      STR R1, .WriteString
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
      MOV R0, #MyName   ;Inputing Name
      STR R0, .ReadString
      B ChoosingMatchStick
ChoosingMatchStick:
      MOV R1, #ChoosingMatchSticksLabel ;Writing Label
      STR R1, .WriteString
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
      LDR R0, .InputNum ;Inputing Number
      CMP R0, #5
      BGT CaseBiggerFive ;If R0 > 5
      BEQ CaseBiggerFive ;If R0 = 5
      BLT Invalid       ;If R0 < 5
CaseBiggerFive:
      CMP R0, #100 
      BGT Invalid       ;If R0 > 100
      BEQ SavingInput   ;If R0 = 100
      BLT SavingInput   ;If R0 < 100
Invalid: 
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString 
      MOV R1, #InvalidLabel ;Write Invalid Label
      STR R1, .WriteString
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
      B ChoosingMatchStick
SavingInput:
      MOV R12, R0       ;Moving The Match stick number to R12 for later uses
      MOV R11, R0       ;Moving the Match stick number to R11 incase there's a replay
;The main game
AfterSaving:
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString 
      MOV R1, #Player1Name ;Display Player Name Label
      STR R1, .WriteString
      MOV R1, #MyName   ;Display Player Name
      STR R1, .WriteString
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString 
      MOV R1, #MatchsticksNumberLabel ;Display Match Stick Label
      STR R1, .WriteString 
      MOV R1, R12       ;Displayer Choosen MatchStich
      STR R1, .WriteUnsignedNum
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString 
      B Main
Main:
      MOV R12, R11
;“Player <name>, there are <X> matchsticks remaining”
      MOV R1, #Player
      STR R1, .WriteString
      MOV R1, #MyName
      STR R1, .WriteString
      MOV R1, #comma
      STR R1, .WriteString
      MOV R1, #Space
      STR R1, .WriteString
      MOV R1, #ThereAre
      STR R1, .WriteString
      MOV R1, R12 
      STR R1, .WriteUnsignedNum
      MOV R1, #remaining
      STR R1, .WriteString
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
ChoosingRMV:
;“Player <name>, there are <X> matchsticks remaining”
      MOV R1, #Player
      STR R1, .WriteString
      MOV R1, #MyName
      STR R1, .WriteString
      MOV R1, #comma
      STR R1, .WriteString
      MOV R1, #Space
      STR R1, .WriteString
      MOV R1, #NumberRmvLabel
      STR R1, .WriteString
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
;Loading and Proccessing Input 
      LDR R0, .InputNum
      CMP R0, #1 
      BGT CaseBiggerOne
      BEQ CaseBiggerOne
      BLT InvalidRMV
CaseBiggerOne:
      CMP R0, #3
      BGT InvalidRMV
      CMP R0, R12
      BGT InvalidRMV
      BEQ continue
      BLT continue
InvalidRMV:
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString 
      MOV R1, #InvalidLabel ;Write Invalid Label
      STR R1, .WriteString
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
      B ChoosingRMV
continue:
      SUB R12, R12, R0  ;Calculating Match Sticks left
; "There are <R12> MatchStick remaining"
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
      MOV R1, #ThereAre
      STR R1, .WriteString
      MOV R1, R12 
      STR R1, .WriteUnsignedNum
      MOV R1, #remaining
      STR R1, .WriteString
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
;
      CMP R12, #1
      BGT ComputerTurn
      BEQ PlayerWin
      CMP R12, #0
      BEQ Draw
;ComputerTurn
ComputerTurn:
; "Computer Player’s turn"
      MOV R1, #ComputerPlaying
      STR R1, .WriteString
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
Select:
      LDR R0, .Random
      AND R0, R0, #3
      CMP R0, R12
      BGT Select
      CMP R0, #0
      BEQ Select
      SUB R12, R12, R0
; "There are <R12> MatchStick remaining"
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
      MOV R1, #ThereAre
      STR R1, .WriteString
      MOV R1, R12
      STR R1, .WriteUnsignedNum
      MOV R1, #remaining
      STR R1, .WriteString
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
;
      CMP R12, #1
      BGT Main
      BEQ ComputerWin
      CMP R12, #0
      BEQ Draw
;Ending Game
PlayerWin:
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
      MOV R1, #Player
      STR R1, .WriteString
      MOV R1, #MyName
      STR R1, .WriteString
      MOV R1, #comma
      STR R1, .WriteString
      MOV R1, #Space
      STR R1, .WriteString
      MOV R1, #YouWin
      STR R1, .WriteString
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
      B Replay
ComputerWin:
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
      MOV R1, #Player
      STR R1, .WriteString
      MOV R1, #Computer
      STR R1, .WriteString
      MOV R1, #comma
      STR R1, .WriteString
      MOV R1, #Space
      STR R1, .WriteString
      MOV R1, #YouWin
      STR R1, .WriteString
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
      B Replay
Draw: 
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
      MOV R1, #DrawN
      STR R1, .WriteString
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
      B Replay
Replay:
      MOV R1, #PlayAgain ;"Play again????
      STR R1, .WriteString
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
      MOV R0, #ReplayOption
      STR R0, .ReadString ;Reading Input to R0
      LDRB R2, [R0]     ;loading R0 to R2
      CMP R2, #121      ;if R2 = 'y'
      BEQ Main
      CMP R2, #110      ;if R2 = 'n'
      BEQ Over
      BNE Replay
Over:
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
      MOV R1, #OverLabel ;displayer "Game Over"
      STR R1, .WriteString
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
      HALT
;Stage 1 Label
ChoosingNameLabel: .ASCIZ "Please enter your name: "
ChoosingMatchSticksLabel: .ASCIZ "How many matchsticks (5-100)?"
InvalidLabel: .ASCIZ "Invalid Option Please Choose Again"
Player1Name: .ASCIZ "Player 1 is "
MatchsticksNumberLabel: .ASCIZ "Matchsticks: "
;Stage 2 Label
Player: .ASCIZ "Player "
ThereAre: .ASCIZ "there are " 
remaining: .ASCIZ " matchsticks remaining."
NumberRmvLabel: .ASCIZ " how many do you want to remove (1-3)?"
OverLabel: .ASCIZ "Game Over"
;Stage 3 Label
DrawN: .ASCIZ "It’s a draw!"
YouWin: .ASCIZ "YOU WIN!"
Computer: .ASCIZ "Computer"
ComputerPlaying: .ASCIZ "Computer Player’s turn"
PlayAgain: .ASCIZ "Play again (y/n) ?"
;Miscellaneous Label 
Space: .ASCIZ " "
line: .ASCIZ "\n"
comma: .ASCIZ ","
MyName: .BLOCK 128
ReplayOption: .BLOCK 1
