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
%token O_KEY O_BRAC O_PAR C_PAR C_BRAC C_KEY O_COMENT C_COMENT SEMICOLON COMMA INCLUDE PRINTF SCANF 
%token WHILE FOR IF ELSE 
%token ID RETURN 

%left MULT DIV MOD 
%left SUB SUM 
%left COMP 
%right ASSIGMENT 

%start program
%% 

program: headers main;

headers: headers headers | INCLUDE | /*empty*/; 

dataType: INT | CHAR | DOUBLE | FLOAT | VOID; 

operator: SUM | SUB | MULT | DIV | POW | MOD | ASSIGMENT;

opLogical: AND | OR;

opINCorDEC: INCR | DECR;

main: dataType ID O_PAR args C_PAR O_KEY content return C_KEY; 

args: dataType MULT ID | dataType ID O_BRAC C_BRAC| dataType ID | /*empty*/;

return: RETURN NUMorID SEMICOLON; 

content: content cont | cont;

cont:  attSTATE | ifSTATE | forSTATE | whileSTATE | comentSTATE  | PRorSC_STATE | /*empty*/;

PRorSC_STATE: PRorSC O_PAR STR bodyPRorSC C_PAR SEMICOLON;

PRorSC: PRINTF | SCANF;

bodyPRorSC: COMMA ID bodyPRorSC | COMMA expCOND bodyPRorSC| /*empty*/; 

attSTATE: bodyATT SEMICOLON;

bodyATT: dataType ID  | bodyATT COMMA ID  | bodyATT ASSIGMENT NUMorID | attSTR; 

attSTR: CHAR ID O_BRAC NUMorEMP C_BRAC bodySTR;

bodySTR: ASSIGMENT STR | /*empty*/ ;

NUMorID: NUMBER | ID ;

NUMorEMP: NUMBER | /*empty*/  ;

ifSTATE: IF O_PAR expCOND C_PAR bodyLOOP elseSTATE;

expCOND: expCOND COMP expCOND | O_PAR expCOND C_PAR |
		 expCOND operator expCOND | expCOND opLogical expCOND | NUMorID; 

elseSTATE : ELSE O_KEY content C_KEY| ELSE ifSTATE| /*empty*/  ;

forSTATE: FOR O_PAR forINIT SEMICOLON expCOND SEMICOLON forUPD C_PAR bodyLOOP; 

forINIT: dataType INITF | INITF | /*empty*/;
		 
INITF: ID ASSIGMENT NUMorID | INITF COMMA INITF;

forUPD: UPDF | /*empty*/; 

UPDF: ID opINCorDEC | UPDF COMMA UPDF; 

whileSTATE: WHILE O_PAR expCOND C_PAR bodyLOOP;

bodyLOOP: O_KEY content C_KEY;

comentSTATE: O_COMENT content C_COMENT;

%%

void yyerror (){
  fprintf(stderr, "\nErro de sintaxe na linha %d\n", flag);
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
