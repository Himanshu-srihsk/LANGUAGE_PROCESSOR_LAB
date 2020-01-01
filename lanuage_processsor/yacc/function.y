%{
#include <stdio.h>
#include <stdlib.h>
int valid=1;
%}

%token TYPE RETURN ID NUM
%right "="
%left '+' '-'
%left '*' '/'
%right UMINUS
%left '!'

%%

S    : FUN {printf("Input accepted\n"); exit(0);}
FUN    : TYPE ID '(' PARAM ')' '{' BODY '}'     
      ;
PARAM    : PARAM ',' TYPE ID
    | TYPE ID
    |
    ;         
BODY    : BODY BODY
    | PARAM ';'
    | E ';'        
        | RETURN E ';'
        |
    ;              
E    : ID '=' E
    | E '+' E
    | E '-' E
    | E '*' E
    | E '/' E       
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

