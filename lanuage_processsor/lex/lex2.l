%{
#include <stdio.h>
int lines=0;
int words=0;
int spl_char=0;
int total=0;
%}

%%

\n {lines++; words++;}
[\t ' '] {words++;}
. {spl_char++;}


%%

int yywrap(){return 1;}

int main(){
yyin=fopen("file2.txt","r");
yylex();
printf("The file contains\n");
printf("%d \n",lines);
printf("%d \n",words);
printf("%d \n",spl_char);
return 0;

}
