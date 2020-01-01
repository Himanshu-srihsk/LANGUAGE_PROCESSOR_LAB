%{
    #include "y.tab.h"
%}

%%
[ \t\n]
if                  return IF;
then                return THEN;
[0-9]+              return NUM;
[a-zA-Z_][a-zA-Z_0-9]* return ID;
">=" return GE;
"<="  return LE;
"=="  return EQ;
"!="                return NE;
"||"                return OR;
"&&"                return AND;
.                   return yytext[0];

%%      

int yywrap()

{

return 1;

}     
