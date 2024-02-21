%{
	/*1°)Definições */
#include "hashTable.c"
HashEntry *H[TAM];
%}

/*Operadores aritmeticos*/
sub "-" 
sum "+"	
mult "*" 
div "/"	 
pow "**"
mod "%" 

/*Incremento e decremento/*
incr "++" 
decr "--" 

/*Atribuição*/      
assignment "=" 

/*Operadores de comparação*/
comparator  ("<"|">"|"<="|">="|"!="|"==") 

/*Operadores Logicos*/
and "&&" 
or "||" 
not  ("~"|"!") 
type ("char"|"int"|"void"|"float"|"double")

o_key "{" 
c_key "}" 
o_brac "/[" 
c_brac "/]" 
o_par "(" 
c_par ")" 
two_point ":"
semicolon ";" 
comma ","
point "." 
EOF '\0' 

letter [a-zA-Z] 
string (\".*\") 
number [0-9] 
id {letter}({letter}|{number})* 

{string} {
    printf("Token: String -> %s\n", yytext);
    inserts(H, yytext, strlen(yytext), 0, flag);
    return STRING;
}
(while) {
    printf("Token: Palavra reservada -> %s\n", yytext);
    inserts(H, yytext, strlen(yytext), 0, flag);
    return WHILE;
}
(for) {
    printf("Token: Palavra reservada -> %s\n", yytext);
    inserts(H, yytext, strlen(yytext), 0, flag);
    return FOR;
}
(if) {
    printf("Token: Palavra reservada -> %s\n", yytext);
    inserts(H, yytext, strlen(yytext), 0, flag);
    return IF;
}
(type) {
    printf("Token: Palavra reservada -> %s\n", yytext);
    inserts(H, yytext, strlen(yytext), 0, flag);
    return TYPE;
}
{id} {
    if(strlen(yytext) < 10){
        printf("Token: Identificador \"%s\"\n", yytext);
        inserts(H, yytext, strlen(yytext), 0, flag);
        return ID;
    }
    else{
        printf("ERRO: Tamanho maximo de identificador (20) excedido!\n");
    }
}
{number} {
    printf("Token: Digito\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return NUMBER;
}
{sum} {
    printf("Token: Operador de soma\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return SUM;
}
{sub} {
    printf("Token: Operador de subtracao\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return SUB;
}
{mult} {
    printf("Token: Operador de multiplicacao\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return MULT;
} return ERROR;
{div} {
    printf("Token: Operador de divisao\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return DIV;
}
{and} {
    printf("Token: Operador Logico AND\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return AND;
}
{or} {
	printf("Token: Operador Logico OR\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return OR;
}
{not} {
    printf("Token: Operador Logico NOT\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return NOT;
}
{o_key} {
    printf("Token: Abre Chaves\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return O_KEY;
}
{o_brac} {
    printf("Token: Abre Colchetes\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return O_BRAC;
}
{o_par} {
    printf("Token: Abre Parenteses\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return O_PAR;
}
{c_par} {
    printf("Token: Fecha Parenteses\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return C_PAR;
}
{c_brac} {
    printf("Token: Fecha Colchetes\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return C_BRAC;        return ERROR;
}
{c_key} {
    printf("Token: Fecha Chaves\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return C_KEY;
}
{comparator} {
    printf("Token: Comparacao\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return COMP;
}
{assignment} {
    printf("Token: Atribuicao\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return ASG;
}
{semicolon} {
    printf("Token: Ponto-Virgula\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return SEMICOLON;
}
{comma} {
    printf("Token: Virgula\n");
    inserts(H, yytext, strlen(yytext), 0, flag);
    return COMMA;
}
{number}("$"|"@"|{letter}|{number})+  {
		printf("ERRO ID: Token [%s] nao identificado na linha: %d\n\n", yytext, flag);
}
{letter}("$"|"@"|{letter}|{number})+  {
		printf("ERRO ID: Token [%s] nao identificado na linha: %d\n\n", yytext, flag);
}

"\n" {flag++;}
[ \t\r\f]+
. {
	printf("Token [%s] nao identificado na linha: %d\n", yytext, flag);
}

%%

int yywrap(){ return 1;}
