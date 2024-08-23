%{
#include "y.tab.h"
%}
%%
"if" return IF;
"else" return ELSE;
"(" return LPAREN;
")" return RPAREN;
"{" return LF;
"}" return RF;
[a-z]* return EXP;
[ ] return SPACE;
\n return 0;
%%