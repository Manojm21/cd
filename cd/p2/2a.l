%{
#include <stdio.h>
int p = 0, n = 0, pf = 0, nf = 0;
%}

%%

[+]?[0-9]+ { p++; }
[-][0-9]+ { n++; }
[0-9]*[.][0-9]+ { pf++; }
[-][0-9]*[.][0-9]+ { nf++; }
[-][0-9]*[.]*[0-9]+[/][-][0-9]*[.]*[0-9]+ { pf++; }
[0-9]*[.]*[0-9]+[/][0-9]*[.]*[0-9]+ { pf++; }
[0-9]*[.]*[0-9]+[/][-][0-9]*[.]*[0-9]+ { nf++; }
[-][0-9]*[.]*[0-9]+[/][0-9]*[.]*[0-9]+ { nf++; }
\n { return 0; }

%%
int main() {
printf("Enter the no.'s\n");
yylex();
printf("Number of positive integers = %d\n\tnegative integers = %d\n\tpositive fractions = %d\n\tnegative fractions = %d\n", p, n, pf, nf);
return 0;
}