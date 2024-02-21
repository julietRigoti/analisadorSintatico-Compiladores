%{
    #include "hashTable.c"
    #include <stdio.h>
    extern FILE *yyin;
    int flag = 1;
%}

%token SUB SUM MULT DIV POW MOD INCR DECR ASG COMP

%start program 
%%

%% 

/*int main(){

	int i;
    char str[MAX];
    initialization(H);

	printf("Deseja entrar com um arquivo? 1-sim/2-nao\n>>");
	scanf("%d", &i);

	while(i == 1){
		printf("Entre com um arquivo.txt\n");
    	scanf("%s", str);
    	yyin = fopen(str,"r");
		printf("\n");
		if(yyin != NULL){
        	yylex();
       		fclose(yyin);
			} else printf("Arquivo não encontrado\n");
		
		printf("Deseja entrar com um arquivo? 1-sim/2-nao\n");
		scanf("%d", &i);
	}
    return 0;
}*/