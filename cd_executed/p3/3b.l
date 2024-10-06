%{
#include "y.tab.h"
%}
%%
"for" { return FOR; }
"(" { return LPAREN; }
")" { return RPAREN; }
"{" { return LF; }
"}" { return RF; }
"=" { return '='; }
"-" { return '-'; }
"+" { return '+'; }
">" { return '>'; }
"<" { return '<'; }
";" { return ';'; }
"==" { return EQ; }
"<=" { return LE; }
">=" { return GE; }
"+=" { return ADD_ASSIGN; }
"-=" { return SUB_ASSIGN; }
"++" { return INC; }
"--" { return DEC; }
[a-zA-Z]+ { return EXP; }
[0-9]+ { return NUM; }
[ \t] { /* Ignore whitespace */ }
\n { return 0; }
. { /* Ignore any other character */ }
%%
int yywrap(){
return 1;
}