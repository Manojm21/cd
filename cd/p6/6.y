%{
#include <stdio.h>
#include <stdlib.h>

struct incod {
    char opd1, opd2, opr;
} code[20];

int ind = 0;
int flag = 0;
char temp = 'T';  // Start with 'T'

char AddToTable(char, char, char);
void generateCode();
%}

%union { char sym; }

%token <sym> LETTER NUMBER
%type <sym> expr
%left '-' '+'
%right '*' '/'

%%
statement: LETTER '=' expr ';' { AddToTable($1, $3, '='); }
         | expr ';' ;

expr: expr '+' expr { $$ = AddToTable($1, $3, '+'); }
    | expr '-' expr { $$ = AddToTable($1, $3, '-'); }
    | expr '*' expr { $$ = AddToTable($1, $3, '*'); }
    | expr '/' expr { $$ = AddToTable($1, $3, '/'); }
    | '(' expr ')' { $$ = $2; }
    | NUMBER       { $$ = $1; }
    | LETTER       { $$ = $1; }
    ;
%%

char AddToTable(char opd1, char opd2, char opr) {
    code[ind++] = (struct incod){ opd1, opd2, opr };
    char retTemp = temp;
    
    // Cycle through 'T', 'U', 'V', ... by incrementing the character
    if (temp < 'Z') {
        temp++;  // Increment to next character
    } else {
        printf("Error: Temporary variable limit reached.\n");
        exit(1);  // Stop if out of temporary variable names
    }
    
    return retTemp;
}

void generateCode() {
    printf("\nThree-Address Code:\n");
    for (int i = 0; i < ind; i++) 
        printf("%c = %c %c %c\n", temp - ind + i, code[i].opd1, code[i].opr, code[i].opd2);

    printf("\nQuadruple Code:\n");
    for (int i = 0; i < ind; i++) 
        printf("%d\t%c\t%c\t%c\t%c\n", i, code[i].opr, code[i].opd1, code[i].opd2, temp - ind + i);

    printf("\nTriple Code:\n");
    for (int i = 0; i < ind; i++) 
        printf("%d\t%c\t%c\t%c\n", i, code[i].opr, code[i].opd1, code[i].opd2);
}

int main() {
    printf("Enter the Expression (e.g. a = b + c;): ");
    yyparse();
    if (flag == 0)
        generateCode();
    return 0;
}

int yywrap() { return 1; }

int yyerror(char *s) {
    flag = 1;
    printf("%s\n", s);
    return 0;
}
