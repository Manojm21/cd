%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(const char *s);int yylex(void);
%}
%start S
%%
S: B C
;
B: 'a' B 'b'
| /* empty */
;
C: 'b' C 'c'
| /* empty */
;
%%
int main() {
if (yyparse() == 0) {printf("\nValid string\n");
}
return 0;
}
void yyerror(const char *s) {
fprintf(stderr, "INVALID!!!\n");
exit(1);
}