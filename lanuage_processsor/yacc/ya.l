%{



 #include "y.tab.h"

%}

%%
[' '\t\n]
if   return IF;
then return THEN;
[a-zA-A_][a-zA-Z_0-9]*  return ID;
"<="  return LE;
">=" return GE;
"==" return EQ;
"!="  return NE;
"||"  return OR;
"&&"  return AND;
[0-9]+ return NUM;
.                   return yytext[0];

%%
int yywrap(){


return 1;

}
