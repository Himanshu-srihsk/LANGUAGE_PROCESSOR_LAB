%{

#include <stdio.h>
#include <stdlib.h>
int line=1;
%}

li .*\n 
comment2 \/\*(.|\n)*\*\/
%%

{li} {fprintf(yyout,"%5d %s",line++,yytext);}


%%

int yywrap(void){}

int main(){
char inp[20],out[20];
extern FILE *yyin,*yyout;
printf("enter the input file name:");
scanf("%s",inp);
yyin=fopen(inp,"r");
printf("enter the output file name:");
scanf("%s",out);
yyout=fopen(out,"w");
yylex();
return 0;
}
