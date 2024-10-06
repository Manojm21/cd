%{
#include <stdio.h>
#include <stdlib.h>
// Declare yylex function
int yylex(void);
int count = 0;
void yyerror(const char *s);
%}
%token FOR LPAREN RPAREN LF RF EXP NUM
%token EQ LE GE ADD_ASSIGN SUB_ASSIGN INC DEC
%%
S : I
;
I : FOR A B { count++; }
;
A : LPAREN E ';' E ';' E RPAREN
;
E : EXP Z NUM
| EXP Z EXP| EXP U
| 
;
Z : '='
| '>'
| '<'
| LE /* Placeholder for '<=' */
| GE /* Placeholder for '>=' */
| EQ /* Placeholder for '==' */
| ADD_ASSIGN /* Placeholder for '+=' */
| SUB_ASSIGN /* Placeholder for '-=' */
;
U : INC /* Placeholder for '++' */
| DEC /* Placeholder for '--' */
;
B : LF B RF
| I
| EXP| EXP I
| /* empty */
;
%%
int main() {
yyparse();
printf("Number of nested FOR's are: %d\n", count);
return 0;
}
void yyerror(const char *s) {
printf("ERROR: %s\n", s);
exit(1);
}
