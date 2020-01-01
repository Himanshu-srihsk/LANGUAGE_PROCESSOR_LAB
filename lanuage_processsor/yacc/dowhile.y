%{
#include <stdio.h>
#include <stdlib.h>
int valid=1;
%}
%token ID NUM DO WHILE LE GE EQ NE OR AND ELSE
%right '='
%left AND OR
%left '<' '>' LE GE EQ NE
%left '+''-'
%left '*''/'
%right UMINUS
%left '!'
%%
S:ST1 {printf("valid notation !");exit (0);}
ST1:DO '{' ST '}' WHILE'('E')'
   ;
ST: ST ST
  | E ';'
  ;   
E    : ID'='E
    | E'+'E
    | E'-'E
    | E'*'E
    | E'/'E
    | E'<'E
    | E'>'E
    | E LE E
    | E GE E
    | E EQ E
    | E NE E
    | E OR E
    | E AND E
    | ID
    | NUM
    ;
  


%%


int yyerror()

{

    valid=0;

    printf("\nInvalid expression!\n");

    return 0;

}

int main(){

printf("Enter the statement: ");
yyparse();
if(valid)

    {

        printf("\nValid expression!\n");

    }
}

