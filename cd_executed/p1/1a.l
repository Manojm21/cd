%{
int w = 0;
int l = 0;
int c = 0;
int s = 0;
%}

%%

[a-zA-Z]+ {w++; c += yyleng;};
[.] l++;
[ \t] s += (yytext[0] == '\t')? 3: 1;
\n return 0;

%%
int main()
{

yyin=fopen("1.txt","r");
yylex();
printf("no. of lines=%d\n\twords=%d\n\tcharacters=%d\n\tspaces=%d\n",l,w,c,s);
}
int yywrap(){
return 1;
}
