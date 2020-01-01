%{
#include"stdio.h"
%}
%token DIGIT
%%
S       : E '\n' {printf("%d\n",$$);}
        ;
E       : E '+' T { $$ = $1 + $3 ;}
        | T
        ;
T       :T '-' FF { $$ = $1 - $3 ;}
        | FF
        ;
FF      :FF '/' FFF { $$ = $1 / $3 ;}
        |FFF;
FFF     :FFF '*' F { $$ =$1*$3 ;}
        |F
        ;
F       : '(' E ')' { $$ = $2 ;}
        |DIGIT
        ;
%%

void main() 
{ 
printf("\nEnter Any Arithmetic Expression which can have operations Addition, Subtraction, Multiplication, Divison,Modulus and Round brackets:\n"); 

yyparse(); 

} 

void yyerror() 
{ 
printf("\nEntered arithmetic expression is Invalid\n\n"); 

} 
