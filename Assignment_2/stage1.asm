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
      BEQ DisplayAfterInput ;If R0 = 100
      BLT DisplayAfterInput ;If R0 < 100
Invalid: 
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString 
      MOV R1, #InvalidLabel ;Write Invalid Label
      STR R1, .WriteString
      MOV R1, #line     ;Go down a line
      STR R1, .WriteString
      B ChoosingMatchStick
DisplayAfterInput:
      MOV R12, R0       ;Moving The Match stick number to R12 for later uses
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
      HALT
ChoosingNameLabel: .ASCIZ "Please enter your name: "
ChoosingMatchSticksLabel: .ASCIZ "How many matchsticks (5-100)?"
InvalidLabel: .ASCIZ "Invalid Option Please Choose Again"
Player1Name: .ASCIZ "Player 1 is "
MatchsticksNumberLabel: .ASCIZ "Matchsticks: "
line: .ASCIZ "\n"
MyName: .BLOCK 128
