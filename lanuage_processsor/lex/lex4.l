%{
#include <stdio.h>
#include <string.h>
char line[100];
%}


%%
[0-9]+    {}
"\n"      {fprintf(yyout,"%s\n",line);}
[*]  {strcpy(line,yytext);}
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
