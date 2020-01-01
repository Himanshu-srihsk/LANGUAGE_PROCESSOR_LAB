%{

#include<stdio.h>
#include<string.h>
#include<math.h>
int stmt=0;
int key=0;
int pos=0,neg=0,zero=0,posf=0,negf=0;
int total=0;


%}


%%

\+?[0-9]+  {pos++;}
-[0-9]+    {neg++;}
\+?[0-9]*\.[0-9]+ {posf++;}
-[0-9]*\.[0-9]+  {negf++;}
. ;
%%
int yywrap(){return 1;}

int main(){
yyin=fopen("file1.txt","r");
yylex();
printf("\npos no:- %d",pos);
printf("\nneg no:- %d",neg);
printf("\npos fraction:- %d",posf);
printf("\nneg fraction:- %d",negf);
return 0;

}

