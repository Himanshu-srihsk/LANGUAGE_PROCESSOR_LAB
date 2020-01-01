%{
#include <stdio.h>
#include <stdlib.h>
int valid=1;
%}
%token ID NUM SWITCH CASE DEFAULT BREAK LE GE EQ NE OR AND ELSE
%right '='
%left AND OR
%left '<' '>' LE GE EQ NE
%left '+''-'
%left '*''/'
%right UMINUS
%left '!'
%%

S       : ST {printf("Input accepted.\n");exit(0);}
         ;
ST     :    SWITCH '(' ID ')' '{' B '}'
         ;
   
B       :    C
         |    C    D
        ;
   
C      :    C    C
        |    CASE NUM ':' E ';'
        | BREAK ';'
        ;

D      :    DEFAULT    ':' E ';' BREAK ';'
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



/*


switch(a){ case 1: a=1; break; default:a=0;break;}

*/
