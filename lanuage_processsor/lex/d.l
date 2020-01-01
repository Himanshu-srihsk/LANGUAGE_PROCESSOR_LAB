%{
#include <stdio.h>
int stmt=0;
int id=0,len=0;
int amper=0;
%}


%%


[a-zA-Z]+ { len=strlen(yytext);
               if(len >=6){stmt++;}
               int k=len;
                  
              for(int i=0;i<k;i++){
              if(yytext[i]=='a' || yytext[i]=='e' || yytext[i]=='i'|| yytext[i]=='o'|| yytext[i]=='u'){ id++;}
              else if(yytext[i]='@'){amper++;}
                }

              

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



fprintf(yyout,"vowels=%d\n",id);
fprintf(yyout,"words=%d\n",stmt);
fprintf(yyout,"ampersand no=%d\n",amper);

return 0;

}

