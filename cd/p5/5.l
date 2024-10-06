%{
#include "y.tab.h"
%}
%%
"int" { return INT; }
"float" { return FLOAT; }
"char" { return CHAR; }
"double" { return DOUBLE; }
[a-zA-Z_][a-zA-Z0-9_]*  {return IDENTIFIER; }
[0-9]+ {return NUM;}
"[" { return '['; }
"]" { return ']'; }
"," { return ','; }
";" { return ';'; }

. { /* Ignore any other characters */ }
%%
int yywrap() {
return 1;
}
