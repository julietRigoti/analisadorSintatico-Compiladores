%{
    #include "hashTable.c"
    #include <stdio.h>
	extern int yylex();
	void yyerror();
	extern int flag;
	extern HashEntry *H[], *HT[];
    extern FILE *yyin;
%}

%token SUB SUM MULT DIV POW MOD ASG COMP
%token AND OR NOT 
%token CHAR INT VOID FLOAT DOUBLE NUMBER STR 
%token O_KEY O_BRAC O_PAR C_PAR C_BRAC C_KEY SEMICOLON COMMA TWO_POINT POINT INCLUDE
%token WHILE FOR IF ELSE 
%token ID MAIN RETURN 

%start programa
%% 

programa: headers principal;

headers: INCLUDE |
		 headers headers;

principal: type MAIN O_PAR args C_PAR O_KEY conteudo return C_KEY;

type: INT | FLOAT | DOUBLE | CHAR | VOID ;

return: RETURN exp SEMICOLON | /* vazio */ ;

args: type ID | type MULT ID | type ID O_BRAC C_BRAC;

exp: exp_simples COMP exp_simples | exp_simples;

exp_simples: exp_simples op termo | termo; 

termo: termo op fator| fator ;

op: SUM | SUB | MULT | DIV | POW | MOD ;

fator: O_PAR exp C_PAR | NUMBER | ID;

conteudo: args

%%

void yyerror (){
  fprintf(stderr, "Erro de sintaxe na linha %d\n", flag);
}

int main(){

	int i;
    char str[MAX];
    initialization(H);
	initialization(HT);

	printf("Deseja entrar com um arquivo? 1-sim/2-nao\n>>");
	scanf("%d", &i);

	while(i == 1){
		printf("Entre com um arquivo.txt\n");
    	scanf("%s", str);
    	yyin = fopen(str,"r");
		printf("\n");
		if(yyin != NULL){
        	yylex();
			yyparse();
       		fclose(yyin);
			} else printf("Arquivo não encontrado\n");
		
		printf("Deseja entrar com um arquivo? 1-sim/2-nao\n");
		scanf("%d", &i);
	}
    return 0;
}
