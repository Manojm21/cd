%{
#include<stdio.h>
#include<stdlib.h>
int count=0;
%}

%token IF ELSE LPAREN RPAREN LF RF EXP SPACE
%%

S:I
;
I:IF E B {count++;}
;
E:LPAREN EXP RPAREN
;
B:LF B RF
|I
|EXP
|EXP SPACE I
|
;
%%
int main()
{
yyparse();
printf("no. of nested IF's are: %d\n",count);
}
int yyerror()
{
printf("ERROR!!!\n");
exit(0);
}