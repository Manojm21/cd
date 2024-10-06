%{
#include<stdio.h>
int i=0,k=0,op=0;
%}
%%

auto|break|case|char|continue|do|default|const|double|else|enum|extern|for|if|goto|float|int|long|register|return|signed|static|sizeof|short|struct|switch|typedef|union|void|while|volatile|unsigned { k++; }


[a-zA-Z_][a-zA-Z0-9_]* { i++; }

[+*/%=-] { op++; }

. ;


%%
int main()
{
yyin=fopen("d.c","r");
yylex();
printf("No. of identifiers=%d\n,keywords=%d,operators=%d",i,k,op);
}
int yywrap(){
return 1;
}
