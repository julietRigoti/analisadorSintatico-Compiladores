%{
	/*1°Definições */
    #include "hashTable.h"
    #include "y.tab.h"
    int flag = 1;
    HashEntry *H[TAM], *HT[TAM];
%}

/*Operadores aritmeticos*/
SUB "-" 
SUM "+"	
MULT "*" 
DIV "/"	 
POW "**"
MOD "%" 

/*Incremento e decremento*/
INCR "++" 
DECR "--" 

/*Atribuição*/      
ASSIGMENT "=" 

/*Operadores de comparação*/
COMPARATOR  ("<"|">"|"<="|">="|"!="|"==") 

/*Operadores Logicos*/
AND "&&" 
OR "||" 
NOT  ("~"|"!") 

CHAR "char"
INT "int"
VOID "void"
FLOAT "float"
DOUBLE "double"
RETURN "return"

O_KEY "{" 
C_KEY "}" 
O_BRAC "[" 
C_BRAC "]" 
O_PAR "(" 
C_PAR ")" 
O_COMENT ("/*")
C_COMENT ("*/")
SEMICOLON ";" 
COMMA ","
EOF "\0"
INCLUDE ("#include"[ ]*<.+\.h>)

LETTER [a-zA-Z] 
STR (\".*\") 
NUMBER [0-9]+
ID {LETTER}({LETTER}|{NUMBER})* 

%%

(while) {
    printf("Token: Palavra reservada -> %s\n", yytext);
    inserts(HT, yytext, strlen(yytext), 0, flag);
    return WHILE;
}
(for) {
    printf("Token: Palavra reservada -> %s\n", yytext);
    inserts(HT, yytext, strlen(yytext), 0, flag);
    return FOR;
}
(if) {
    printf("Token: Palavra reservada -> %s\n", yytext);
    inserts(HT, yytext, strlen(yytext), 0, flag);
    return IF;
}
(else) {
    printf("Token: Palavra reservada -> %s\n", yytext);
    inserts(HT, yytext, strlen(yytext), 0, flag);
    return ELSE;
}
(char) {
    printf("Token: Palavra reservada -> %s\n", yytext);
    inserts(HT, yytext, strlen(yytext), 0, flag);
    return CHAR;
}
(void) {
    printf("Token: Palavra reservada -> %s\n", yytext);
    inserts(HT, yytext, strlen(yytext), 0, flag);
    return VOID;
}
(int) {
    printf("Token: Palavra reservada -> %s\n", yytext);
    inserts(HT, yytext, strlen(yytext), 0, flag);
    return INT;
}
(float) {
    printf("Token: Palavra reservada -> %s\n", yytext);
    inserts(HT, yytext, strlen(yytext), 0, flag);
    return FLOAT;
}
(double) {
    printf("Token: Palavra reservada -> %s\n", yytext);
    inserts(HT, yytext, strlen(yytext), 0, flag);
    return DOUBLE;
}
(return) {
    printf("Token: return\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return RETURN;
}
{STR} {
    inserts(H, yytext, strlen(yytext), 0, flag);
    return STR;
}
{ID} {
    if(strlen(yytext) < 10){
        printf("Token: Identificador \"%s\"\n", yytext);
        inserts(H, yytext, strlen(yytext), 0, flag);
        return ID;
    }
    else{
        printf("ERRO: Tamanho maximo de identificador (20) excedido!\n");
    }
}
{NUMBER} {
    printf("Token: Digito\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return NUMBER;
}
{SUM} {
    printf("Token: Operador de soma\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return SUM;
}
{SUB} {
    printf("Token: Operador de subtracao\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return SUB;
}
{MULT} {
    printf("Token: Operador de multiplicacao\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return MULT;
} 
{DIV} {
    printf("Token: Operador de divisao\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return DIV;
}
{POW} {
    printf("Token: Operador de pow\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return POW;
}
{MOD} {
    printf("Token: Operador de mod\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return MOD;
}
{INCR} {
    printf("Token: Incremento\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return INCR;
}
{DECR} {
    printf("Token: Decremento\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return DECR;
}
{AND} {
    printf("Token: Operador Logico AND\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return AND;
}
{OR} {
	printf("Token: Operador Logico OR\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return OR;
}
{NOT} {
    printf("Token: Operador Logico NOT\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return NOT;
}
{INCLUDE} {
    printf("Token: Headers\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return INCLUDE;
}
{O_KEY} {
    printf("Token: Abre Chaves\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return O_KEY;
}
{O_BRAC} {
    printf("Token: Abre Colchetes\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return O_BRAC;
}
{O_PAR} {
    printf("Token: Abre Parenteses\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return O_PAR;
}
{C_PAR} {
    printf("Token: Fecha Parenteses\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return C_PAR;
}
{C_BRAC} {
    printf("Token: Fecha Colchetes\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return C_BRAC;       
}
{C_KEY} {
    printf("Token: Fecha Chaves\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return C_KEY;
}
{O_COMENT} {
    printf("Token: Abre comentario\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return O_COMENT;
}
{C_COMENT} {
    printf("Token: Fecha comentario\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return C_COMENT;
}
{COMPARATOR} {
    printf("Token: Comparacao\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return COMP;
}
{ASSIGMENT} {
    printf("Token: Atribuicao\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return ASSIGMENT;
}
{SEMICOLON} {
    printf("Token: Ponto-Virgula\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return SEMICOLON;
}
{COMMA} {
    printf("Token: Virgula\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return COMMA;
}
{EOF} {
    printf("Token: EOF\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return EOF;
}
{NUMBER}("$"|"@"|{LETTER}|{NUMBER})+  {
		printf("ERRO ID: Token nao identificado na linha\n\n");
}
{LETTER}("$"|"@"|{LETTER}|{NUMBER})+  {
		printf("ERRO ID: Token nao identificado na linha\n\n");
}

"\n" {flag++;}
[ \t\r\f]+
. {
    printf("Token não identificado\n\n");
}

%%

int yywrap(void){ return 1;}
