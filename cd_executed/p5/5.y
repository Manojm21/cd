%{
#include <stdio.h>
#include <stdlib.h>
int var_count = 0;
extern FILE* yyin;
void yyerror(const char *s);
int yylex();
%}

%token IDENTIFIER
%token INT FLOAT CHAR DOUBLE NUM

%%

program: declarations
;

declarations: declaration ';'
            | declarations declaration ';'
;

declaration: type var_list
;

type: INT
    | FLOAT
    | CHAR
    | DOUBLE
;

var_list: var
        | var_list ',' var
;

var: identifier
    | identifier '[' ']'
    | identifier '[' NUM ']'
;

identifier: IDENTIFIER
{
    var_count++;
}
;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    
    yyin=fopen("input.c","r");
    yyparse();
    printf("Total number of variables declared: %d\n", var_count);
    return 0;
}
