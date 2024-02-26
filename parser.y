%{
    #include "hashTable.c"
    #include <stdio.h>
	extern int yylex();
	void yyerror();
	extern int flag;
	extern HashEntry *H[], *HT[];
    extern FILE *yyin;
%}

%token SUB SUM MULT DIV POW MOD ASSIGMENT COMP
%token AND OR NOT 
%token CHAR INT VOID FLOAT DOUBLE NUMBER STR 
%token O_KEY O_BRAC O_PAR C_PAR C_BRAC C_KEY SEMICOLON COMMA TWO_POINT POINT INCLUDE
%token WHILE FOR IF ELSE 
%token ID RETURN 

%start program
%% 

program: headers main;

headers: headers headers| INCLUDE | /*empty*/; 

type: INT | CHAR | DOUBLE | FLOAT | VOID; 

main: type ID O_PAR args C_PAR O_KEY content C_KEY; 

args: type MULT ID |type ID O_BRAC C_BRAC| type ID | /*empty*/;

content: content content | attSTATE | expSTATE | /*empty*/;

attSTATE: bodyATT SEMICOLON;

bodyATT: type ID  |
		 bodyATT COMMA ID  | 
		 bodyATT ASSIGMENT NumORCh| bodyATT ASSIGMENT expSTATE; 

NumORCh: NUMBER | CHAR;	

expSTATE: expSTATE SUM expSTATE | 
		  expSTATE SUB expSTATE | 
		  expSTATE MULT expSTATE | 
		  expSTATE DIV expSTATE | 
		  expSTATE POW expSTATE | 
		  expSTATE MOD expSTATE |
		  expSTATE AND expSTATE |
		  expSTATE OR expSTATE |
		  NOT expSTATE |
		  expSTATE COMP expSTATE|
		  O_PAR expSTATE C_PAR |
		  NumORCh;
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
