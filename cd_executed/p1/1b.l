%{
#include "y.tab.h"
%}
%%
"a" { return 'a'; }
"b" { return 'b'; }
"c" { return 'c'; }
. ;
\n { return 0; }

%%
int yywrap() {
return 1;
}