%{
    #include "hashTable.h"
    #include <stdio.h>
	void yyerror();
	extern int yylex();
	extern int flag;
	extern HashEntry *H[], *HT[];
    extern FILE *yyin;
%}

%token SUB SUM MULT DIV POW MOD ASSIGMENT COMP INCR DECR
%token AND OR NOT 
%token CHAR INT VOID FLOAT DOUBLE NUMBER STR 
%token O_KEY O_BRAC O_PAR C_PAR C_BRAC C_KEY O_COMENT C_COMENT SEMICOLON COMMA INCLUDE
%token WHILE FOR IF ELSE 
%token ID RETURN 

%start program
%% 

program: headers main { printf("\t1.COMECOU O PROGRAMA\n\n");};

headers: headers headers | INCLUDE | /*empty*/; 

type: INT | CHAR | DOUBLE | FLOAT | VOID; 

op: SUM | SUB | MULT | DIV | POW | MOD | ASSIGMENT;

opL: AND | OR;

opIorD: INCR | DECR;

main: type ID O_PAR args C_PAR O_KEY content return C_KEY; 

args: type MULT ID |type ID O_BRAC C_BRAC| type ID | /*empty*/;

return: RETURN NUMorID SEMICOLON; 

content: content cont | cont;

cont:  attSTATE | ifSTATE | forSTATE | whileSTATE | comentSTATE  | /*empty*/;

attSTATE: bodyATT SEMICOLON;

bodyATT: type ID  | bodyATT COMMA ID  | bodyATT ASSIGMENT NUMorID; 

NUMorID: NUMBER | ID ;	

ifSTATE: IF O_PAR expCOND C_PAR bodyLOOP elseSTATE;

expCOND: expCOND COMP expCOND | O_PAR expCOND C_PAR |
		 expCOND op expCOND | expCOND opL expCOND | NUMorID; 

elseSTATE : ELSE O_KEY content C_KEY| ELSE ifSTATE| /*empty*/  ;

forSTATE: FOR O_PAR forINIT SEMICOLON expCOND SEMICOLON forUPD C_PAR bodyLOOP; 

forINIT: type INITF | INITF | /*empty*/;
		 
INITF: ID ASSIGMENT NUMorID | INITF COMMA INITF;

forUPD: UPDF | /*empty*/; 

UPDF: ID opIorD | UPDF COMMA UPDF; 

whileSTATE: WHILE O_PAR expCOND C_PAR bodyLOOP;

bodyLOOP: O_KEY content C_KEY;

comentSTATE: O_COMENT content C_COMENT;

%%

void yyerror (){
  fprintf(stderr, "Erro de sintaxe na linha %d\n", flag);
}

int main(){

	int i;
    char str[MAX];
    initialization(H);
	initialization(HT);

	printf("Deseja entrar com um arquivo? 1-SIM/2-NAO\n>> ");
	scanf("%d%*c", &i);

	while(i == 1){
		printf("Entre com um arquivo.txt\n>> ");
    	scanf("%s", str);
    	yyin = fopen(str, "r");
		printf("\n");
		if(yyin != NULL){
        	yylex();
			yyparse();
       		fclose(yyin);
			} else printf("Arquivo não encontrado\n");
		
		printf("Deseja entrar com um arquivo? 1-SIM/2-NAO\n>> ");
		scanf("%d%*c", &i);
	}
    return 0;
}
