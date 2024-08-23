%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
int yyerror();
%}

%token NUM
%left '+' '-'
%left '/' '*'
%%

S: I { printf("result is %d\n", $$); };
I: I '+' I  { $$ = $1 + $3; }
| I '-' I  { $$ = $1 - $3; }
| I '*' I  { $$ = $1 * $3; }
| I '/' I {
if ($3 == 0) {
yyerror();
} else {
$$ = $1 / $3;
}}
| '(' I ')' { $$ = $2; }
| NUM;
%%
int main() {
yyparse();
printf("Valid\n");
return 0;
}
int yyerror() {
printf("INVALID!!!!\n");
exit(0);
}