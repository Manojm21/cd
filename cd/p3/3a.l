%{
#include<stdio.h>
int flag=0;
int c=0;int flg=0;
%}
%%
"//".* { if(flag==1){fprintf(yyout," ");flg--;}else{c++;
fprintf(yyout," ");flg++;}}
"/*".*\n?"*/"? { if(flg==1){fprintf(yyout," ");} else {flag++; fprintf(yyout," ");c++;}}
.*"*/" {if(flag==1){ fprintf(yyout," "); c++;flag--;}}
%%
int main()
{
yyin= fopen("v.txt","r");
yyout = fopen("v1.txt","w");
yylex();
printf("Number of comment lines=%d",c);
}