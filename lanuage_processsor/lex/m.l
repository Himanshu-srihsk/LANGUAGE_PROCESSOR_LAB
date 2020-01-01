%{
#include <stdio.h>
#include <string.h>
char line[100];
%}
reg1 ^m.*\n

%%
{reg1} {ECHO;}
. ;

%%


int yywrap(void){return 1;}

int main(){
char inp[20],out[20];
printf("enter the input file name:");
scanf("%s",inp);
yyin=fopen(inp,"r");
printf("enter the output file name:");
scanf("%s",out);
yyout=fopen(out,"w");
yylex();
return 0;
}
