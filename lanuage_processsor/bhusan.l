%{
#include <stdio.h>
int stmt=0;
int id=0,len=0;
int amper=0;
int quesa=0;
int quesb=0;
int quesc=0;
int quesd=0;
char sub[]="bbb";
void check(char*);
%}


%%

[a-zA-Z]*bbb[a-zA-Z]* {quesd++; 
                         check(yytext); }
[A-Zb-z]*a[A-Zb-z]*   { quesa++; 
                               
                               check(yytext);
                              }


[a-zA-Z]+  {   
                              check(yytext);
               
               }
            

              
[0-9]+      {
               len=strlen(yytext);
               if(len ==4 ){quesc++;}

              }
              



%%

int yywrap(void){return 1;}

int main(){
char inp[20],out[20];
printf("enter the input file name:");
scanf("%s",inp);
yyin=fopen(inp,"r");

//yyin=fopen("file2.txt","r");

printf("enter the output file name:");
scanf("%s",out);
yyout=fopen(out,"w");

yylex();
/*printf("The file contains\n");
printf("vowels :-%d \n",id);
printf("words >=6:-%d \n",stmt);
printf("ampersand no:-%d \n",amper);*/



fprintf(yyout,"Q1=%d\n",quesa);
fprintf(yyout,"Q2=%d\n",quesb);
fprintf(yyout,"Q3=%d\n",quesc);
fprintf(yyout,"Q4=%d\n",quesd);

return 0;

}
void check(char* st){
int n=strlen(st);
int flag=0;
if(n==5){
for(int i=0;i<n;i++){
if(st[i]=='a'){flag=1;break;}

}
}
if(flag==1){quesb++;}
}

