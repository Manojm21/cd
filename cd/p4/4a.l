%{
#include<stdio.h>
int i=0,k=0,op=0;
%}
%%
/* Keywords */
auto|break|case|char|continue|do|default|const|double|else|enum|extern|for|if|goto|float|int|long|register|return|signed|static|sizeof|short|struct|switch|typedef|union|void|while|volatile|unsigned { k++; }

/* Identifiers */
[a-zA-Z_][a-zA-Z0-9_]* { i++; }

/* Operators */
[+*/%=-] { op++; }

/* Ignore all other characters */
. ;


%%
int main()
{
yyin=fopen("d.c","r");
yylex();
printf("No. of identifiers=%d\n,keywords=%d,operators=%d",i,k,op);
}
