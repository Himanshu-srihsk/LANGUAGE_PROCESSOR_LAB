%{
#include <stdio.h>

%}

%%
"aa"+[a+b]*+"bb" {printf("valid string");}
[0+1]*+000+[0+1]* {printf("valid string");}
.+ {printf("invalid string");}


%%

int yywrap(){return 1;}
int main(){
yylex();
return 0;

}

