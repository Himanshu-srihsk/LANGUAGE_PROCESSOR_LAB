%{

#include<stdio.h>
 #include "y.tab.h"
 extern int  yylval;

%}

DIGIT    [0-9]
%%
{DIGIT}+ {yylval=atoi(yytext);return T_Int;}
[-+*/] {return yytext[0];}
\n    yyterminate();
.    ;

%%

int yywrap()

{

return 1;

}
