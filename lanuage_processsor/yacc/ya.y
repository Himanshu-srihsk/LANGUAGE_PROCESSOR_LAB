%{
#include <stdio.h>
#include <stdlib.h>
int valid=1;
%}

%token ID NUM IF THEN LE NE GE EQ OR AND
%right '='
%left AND OR
%left '<' '>' LE NE EQ GE
%left '+' '-'
%left '*' '/'
%right UMINUS
%left '!'

%%

S: ST{printf("valid string");exit(0);};
ST: IF '(' E2 ')' THEN E ';'
    

E:  ID '=' E
    | E '+' E
    | E '-' E
    | E '*' E
    | E '/' E    
    | E LE E
    | E GE E
    | E EQ E
    | E NE E
    | E OR E
    | E AND E
    | ID
    |NUM
    ;
E2:   E '>' E
    | E'<' E
     |E LE E
    | E GE E
    | E EQ E
    | E NE E
    | E OR E
    | E AND E
    | ID
    |NUM
    ;
%%

int yyerror()

{

    printf("\nInvalid expression!\n");

    return 0;

}

int main()
{
printf("Enter the statement: ");
yyparse();
}   
