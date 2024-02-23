%{
    //#include "hashTable.c"
    #include <stdio.h>
	int yylex(void);
	void yyerror(char *);
    extern FILE *yyin;
%}

%token SUB SUM MULT DIV POW MOD ASG COMP
%token AND OR NOT 
%token CHAR INT VOID FLOAT DOUBLE NUMBER STR
%token O_KEY O_BRAC O_PAR C_PAR C_BRAC C_KEY SEMICOLON COMMA TWO_POINT POINT
%token WHILE FOR IF ELSE 
%token ID 
%%


void yyerror(char *s){
	fprintf(stderr, "%s\n", s);
}
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

int main(){
	yyparse();
	return 0;
}