%{
    #include <stdio.h>
    int count=0;
%}
%%
"//".* {count++; fprintf(yyout," ");}
"/*"(.|\n)*?"*/" {count++; fprintf(yyout," ");}

. {fprintf(yyout,"%s",yytext);}
\n {fprintf(yyout,"\n");}
%%
int main(){
    yyin=fopen("v.txt","r");
    yyout=fopen("v1.txt","w");
    yylex();
    printf("Comments:%d\n",count);
}
