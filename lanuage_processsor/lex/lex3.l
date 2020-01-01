%{
#include <stdio.h>
int stmt=0;
int key=0;
int id=0,assign=0,rel=0,integer=0;
int total=0;
%}


%%
"if"|"else"|"int"|"float"|"break"|"return"|"while"  {key++;}
"=" {assign++;}
[a-zA-Z][a-zA-Z0-9]* {id++;}
">"|"<"|">="|"<="|"<>"|"!="|"=="  {rel++;}
[0-9]+[0-9]*  {integer++;}
"\n"  {stmt++;}
[" "] {}


%%

int yywrap(){return 1;}

int main(){
yyin=fopen("file2.txt","r");
yylex();
printf("The file contains\n");
printf("statememt :%d \n",stmt);
printf("Keyword: %d \n",key);
printf("Identifier:%d \n",id);
printf("Assignment :%d \n",assign);
printf("Integer: %d \n",integer);
printf("Relational Operator:%d \n",rel);
return 0;

}
