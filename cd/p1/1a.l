%{
int l=0,w=0,s=0,c=0;
%}
%%
[.] l++;
[ ] s++;
[\t] s=s+3;
[a-zA-Z]+ {w++; c=c+yyleng;}
. ;
\n return 0;
%%
int main()
{
printf("Enter the string\n");
yylex();
printf("no. of lines=%d\n\twords=%d\n\tcharacters=%d\n\tspaces=%d\n",l,w,c,s);
}