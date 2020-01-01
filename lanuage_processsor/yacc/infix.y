%{

#include <stdio.h>
#include <stdlib.h>
int valid=1;
int pop();
void push();
int top();
%}

%%




%%

int stack[100],count=0;
int pop(){
assert(count>0);
return stack[--count];

}
void push(int num){

 assert(count<sizeof(stack)/sizeof(int));
stack[count++]=num;
}

int top(){
assert(count>0);
return stack[count];
}
int yyerror(void)
{

valid=0;

    printf("\nInvalid expression!\n");

    return 0;

}

int main(){
printf("Enter the postfix statement: ");
yyparse();
if(valid)

    {

        printf("\nValid expression!\n");

    }

}
