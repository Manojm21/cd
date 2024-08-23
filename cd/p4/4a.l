%{
#include<stdio.h>
int i=0,k=0,op=0;
%}
%%
auto|break|case|char|continue|do|default|const|double|else|enum|extern|for|if|goto|float|int|long|register|return|signed|static|sizeof|short|struct|switch|typedef|union|void|while|volatile|unsigned { }
("/"[^\"]*"/") { k++;}
("_"|[a-z]|[A-Z])("_"|[a-z]|[A-Z]|[0-9])* {i++;}
"#include".* ;
"#"[a-zA-Z]+.* ;
[;] ;
[ ] ;
[,] ;
[+*%/-] {op++;}
[\n] ;

%%
int main()
{
yyin=fopen("d.c","r");
yylex();
printf("No. of identifiers=%d\n,keywords=%d,operators=%d",i,k,op);
}