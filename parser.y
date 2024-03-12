%{
    #include "hashTable.h"
	#include "tree.h"

	extern int yylex();
	extern int flag;
	extern HashTable *H, *HT;
    extern FILE *yyin;
	extern FILE *yyout;

	struct node* no;
	void yyerror();
	int flagError = 0;
%}

%union {
		struct teste{
			char name[MAX*2];
			struct node* tr; 
		} obj;
}

%token <obj> SUB SUM MULT DIV POW MOD ASSIGMENT COMP INCR DECR
%token <obj> AND OR NOT 
%token <obj> CHAR INT VOID FLOAT DOUBLE NUMBER STR 
%token <obj> O_KEY O_BRAC O_PAR C_PAR C_BRAC C_KEY O_COMENT C_COMENT SEMICOLON COMMA INCLUDE PRINTF SCANF 
%token <obj> WHILE FOR IF ELSE 
%token <obj> ID RETURN ERROID

%left MULT DIV MOD 
%left SUB SUM 
%left COMP 
%right ASSIGMENT 

%type <obj> program headers dataType operator opLogical opINCorDEC NUMorID NUMorEMP PRorSC main args return content cont PRorSC_STATE bodyPRorSC attSTATE bodyATT attSTR bodySTR ifSTATE expCOND elseSTATE forSTATE forINIT InitFor forUpdate UpdateDF whileSTATE bodyLOOP comentSTATE

%start program

%% 

program: headers main { 
			$$.tr = insertNode($1.tr, $2.tr, "program");
			no = $$.tr;
};

headers: headers headers {
			$$.tr = insertNode($1.tr, $2.tr, "headers headers");} | 
		 INCLUDE {
			$$.tr = insertNode(NULL, NULL, $1.name);} | /*empty*/; 

dataType: INT {
			$$.tr = insertNode(NULL, NULL, $1.name);} | 
		  CHAR {
			$$.tr = insertNode(NULL, NULL, $1.name);} | 
		  DOUBLE {
			$$.tr = insertNode(NULL, NULL, $1.name);} | 
		  FLOAT {
			$$.tr = insertNode(NULL, NULL, $1.name);} |
		  VOID {
			$$.tr = insertNode(NULL, NULL, $1.name);
		   }; 

operator: SUM {
			$$.tr = insertNode(NULL, NULL, $1.name);} | 
		  SUB {
			$$.tr = insertNode(NULL, NULL, $1.name);} | 
		  MULT {
			$$.tr = insertNode(NULL, NULL, $1.name);} | 
		  DIV {
			$$.tr = insertNode(NULL, NULL, $1.name);} | 
		  POW {
			$$.tr = insertNode(NULL, NULL, $1.name);} | 
		  MOD {
			$$.tr = insertNode(NULL, NULL, $1.name);} | 
		  ASSIGMENT {
			$$.tr = insertNode(NULL, NULL, $1.name);
		   };

opLogical: AND {
			$$.tr = insertNode(NULL, NULL, $1.name);} | 
		   OR {
			$$.tr = insertNode(NULL, NULL, $1.name);
		  };

opINCorDEC: INCR {
			  $$.tr = insertNode(NULL, NULL, $1.name);} | 
			DECR {
			  $$.tr = insertNode(NULL, NULL, $1.name);
			};

PRorSC: PRINTF {
		  $$.tr = insertNode(NULL, NULL, $1.name);} |
	    SCANF {
		  $$.tr = insertNode(NULL, NULL, $1.name);
		};

NUMorID: NUMBER {
	  		$$.tr = insertNode(NULL, NULL, $1.name);} | 
		 ID {
			$$.tr = insertNode(NULL, NULL, $1.name);
		};

NUMorEMP: NUMBER {
			$$.tr = insertNode(NULL, NULL, $1.name); } | /*empty*/ ;

main: dataType ID O_PAR args C_PAR O_KEY content return C_KEY{
		struct node *a = insertNode($1.tr, $4.tr, "cab");
		struct node *b = insertNode($7.tr, $8.tr, "body");
		$$.tr = insertNode(a,b, "main");
}; 

args: dataType MULT ID { 
		$$.tr = insertNode($1.tr, NULL, "pointer paramenter");} |
	  dataType ID O_BRAC C_BRAC { 
		$$.tr = insertNode($1.tr, NULL, "paramenter");} | 
	  dataType ID { 
		$$.tr = insertNode($1.tr, NULL, "args");} | /*empty*/;

return: RETURN NUMorID SEMICOLON {
			$$.tr = insertNode(NULL, $2.tr, "return");
		}; 

content: content cont { 
			$$.tr = insertNode($1.tr, $2.tr, "content cont");} | 
		 cont {
			$$.tr = insertNode($1.tr, NULL, "cont");
		 };

cont:   attSTATE{ 
		$$.tr = insertNode($1.tr, NULL, "attSTATE");} |
	 	ifSTATE { 
		$$.tr = insertNode($1.tr, NULL, "ifSTATE");} |
		forSTATE { 
		$$.tr = insertNode($1.tr, NULL, "forSTATE");} |
		whileSTATE { 
		$$.tr = insertNode($1.tr, NULL, "whileSTATE");} |
		comentSTATE  { 
		$$.tr = insertNode($1.tr, NULL, "comentSTATE");} |
		PRorSC_STATE { 
		$$.tr = insertNode($1.tr, NULL, "PRorSC_STATE");} |
		/*empty*/;

PRorSC_STATE: PRorSC O_PAR STR bodyPRorSC C_PAR SEMICOLON {
				$$.tr = insertNode($1.tr, $4.tr, "printf/scanf");
};

bodyPRorSC: COMMA ID bodyPRorSC {
				 $$.tr = insertNode(NULL, $3.tr, "ID bodyPRorSC");} | 
			COMMA expCOND bodyPRorSC { 
				$$.tr = insertNode(NULL, $3.tr, "expCOND bodyPRorSC");} | /*empty*/; 

attSTATE: bodyATT SEMICOLON {
	$$.tr = insertNode($1.tr, NULL, "bodyATT");
};

bodyATT: dataType ID {
			$$.tr = insertNode($1.tr, NULL, "dataType ID"); } | 
		bodyATT COMMA ID  {
			$$.tr = insertNode($1.tr, NULL, "bodyATT ID");} | 
		bodyATT ASSIGMENT NUMorID {
			$$.tr = insertNode($1.tr, $3.tr, "bodyATT NUMorID");} | 
		attSTR {
			$$.tr = insertNode($1.tr, NULL, "attSTR"); } | 
		error {
			$$.tr = insertNode(NULL, NULL, "_ERROR_");
			flagError++;
};


attSTR: CHAR ID O_BRAC NUMorEMP C_BRAC bodySTR{
	$$.tr = insertNode($4.tr, $6.tr, "attSTR");
};

bodySTR: ASSIGMENT STR { 
			struct node *a = insertNode(NULL, NULL, $1.name); 
			$$.tr = insertNode(a, NULL, $2.name);} | /*empty*/ ;

ifSTATE: IF O_PAR expCOND C_PAR bodyLOOP elseSTATE {
			struct node * init = insertNode($3.tr, $5.tr, "if");
			$$.tr = insertNode(init, $5.tr, "ifSTATE");
};

expCOND: expCOND COMP expCOND { 
		$$.tr = insertNode($1.tr, $3.tr, "COMP");} |
		 O_PAR expCOND C_PAR { 
		$$.tr = insertNode($2.tr, NULL, "O_PAR expCOND C_PAR");} |
		 expCOND operator expCOND { 
		$$.tr = insertNode($1.tr, $3.tr, "operator");} |
		 expCOND opLogical expCOND { 
		$$.tr = insertNode($1.tr, $3.tr, "opLogical");} |
		 NUMorID;

elseSTATE : ELSE O_KEY content C_KEY {
				$$.tr = insertNode($3.tr, NULL, "elseSTATE"); }|
			ELSE ifSTATE {
				$$.tr = insertNode(NULL, $2.tr, "else ifSTATE"); }| /*empty*/  ;

forSTATE: FOR O_PAR forINIT SEMICOLON expCOND SEMICOLON forUpdate C_PAR bodyLOOP {
				struct node* init = insertNode($3.tr, NULL, "init");
				struct node* cond = insertNode($4.tr, $6.tr, "cond");
				struct node* f = insertNode(init, cond, "for");
				$$.tr = insertNode(f, $8.tr, "forSTATE");
}; 

forINIT: dataType InitFor {
			$$.tr = insertNode($1.tr, NULL, "data InitFor");} | 
		 InitFor {
			$$.tr = insertNode($1.tr, NULL, "InitFor");} | /*empty*/;
		 

InitFor: ID ASSIGMENT NUMorID { 
			$$.tr = insertNode(NULL, $3.tr, "InitFor NUMorID");}; | 
		InitFor COMMA InitFor { 
			$$.tr = insertNode($1.tr, $3.tr, "InitFor-InitFor"); 
};

forUpdate: UpdateDF { 
			$$.tr = insertNode($1.tr, NULL, "forUpdate");} | /*empty*/; 

UpdateDF: ID opINCorDEC { 
			$$.tr = insertNode(NULL, $2.tr, "ID opINCorDEC");} | 
	  UpdateDF COMMA UpdateDF { 
			$$.tr = insertNode($1.tr, $3.tr, "UpdateDF-UpdateDF"); 
}; 

whileSTATE: WHILE O_PAR expCOND C_PAR bodyLOOP{ 
				$$.tr = insertNode(NULL, $3.tr, "whileSTATE"); 
};

bodyLOOP: O_KEY content C_KEY{ 
			$$.tr = insertNode(NULL, $2.tr, "bodyLOOP"); 
};

comentSTATE: O_COMENT content C_COMENT{ 
			$$.tr = insertNode(NULL, $2.tr, "comentSTATE"); 
};

%%

void yyerror (){
  fprintf(stderr, "\nErro de sintaxe na linha %d\n", flag);
}

int main(int argc, char *argv[]){

	int i;
    char str[MAX], fileTree[MAX*2];
	FILE *tabs; 
    H = initialization();
	HT = initialization();

	printf("Deseja entrar com um arquivo? 1-SIM/2-NAO\n>> ");
	scanf("%d%*c", &i);

	while(i == 1){
		printf("Entre com um arquivo.txt\n>> ");
    	scanf("%s%*c", str);
    	yyin = fopen(str, "r");

		printf("\n");

		if(yyin != NULL){
			yylex();
			yyparse();
			
			printHash(HT);
			printHash(H);
			fclose(yyin);
			sprintf(fileTree, "Arvore-%s", str);
			yyout = fopen(fileTree, "w");

			if(flagError == 0 && yyout != NULL){
				printTree(yyout, no);
			} else {
				fprintf(yyout, "\nNão é possivel criar a arvore sintatica! Possui erros lexicos e sintaticos no codigo.\n");
			}

		} else printf("\nArquivo não encontrado\n");
		
		printf("\nDeseja entrar com um arquivo? 1-SIM/2-NAO\n>> ");
		scanf("%d%*c", &i);
		H = initialization();
		HT = initialization();
		flag = 1;
	}
    return 0;
}
