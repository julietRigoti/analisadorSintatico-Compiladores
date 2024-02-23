/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    SUB = 258,                     /* SUB  */
    SUM = 259,                     /* SUM  */
    MULT = 260,                    /* MULT  */
    DIV = 261,                     /* DIV  */
    POW = 262,                     /* POW  */
    MOD = 263,                     /* MOD  */
    INCRM = 264,                   /* INCRM  */
    DECRM = 265,                   /* DECRM  */
    ASG = 266,                     /* ASG  */
    COMP = 267,                    /* COMP  */
    AND = 268,                     /* AND  */
    OR = 269,                      /* OR  */
    NOT = 270,                     /* NOT  */
    CHAR = 271,                    /* CHAR  */
    INT = 272,                     /* INT  */
    VOID = 273,                    /* VOID  */
    FLOAT = 274,                   /* FLOAT  */
    DOUBLE = 275,                  /* DOUBLE  */
    NUMBER = 276,                  /* NUMBER  */
    STRING = 277,                  /* STRING  */
    STR = 278,                     /* STR  */
    O_KEY = 279,                   /* O_KEY  */
    O_BRAC = 280,                  /* O_BRAC  */
    O_PAR = 281,                   /* O_PAR  */
    C_PAR = 282,                   /* C_PAR  */
    C_BRAC = 283,                  /* C_BRAC  */
    C_KEY = 284,                   /* C_KEY  */
    SEMICOLON = 285,               /* SEMICOLON  */
    COMMA = 286,                   /* COMMA  */
    TWO_POINT = 287,               /* TWO_POINT  */
    POINT = 288,                   /* POINT  */
    WHILE = 289,                   /* WHILE  */
    FOR = 290,                     /* FOR  */
    IF = 291,                      /* IF  */
    ELSE = 292,                    /* ELSE  */
    ID = 293                       /* ID  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define SUB 258
#define SUM 259
#define MULT 260
#define DIV 261
#define POW 262
#define MOD 263
#define INCRM 264
#define DECRM 265
#define ASG 266
#define COMP 267
#define AND 268
#define OR 269
#define NOT 270
#define CHAR 271
#define INT 272
#define VOID 273
#define FLOAT 274
#define DOUBLE 275
#define NUMBER 276
#define STRING 277
#define STR 278
#define O_KEY 279
#define O_BRAC 280
#define O_PAR 281
#define C_PAR 282
#define C_BRAC 283
#define C_KEY 284
#define SEMICOLON 285
#define COMMA 286
#define TWO_POINT 287
#define POINT 288
#define WHILE 289
#define FOR 290
#define IF 291
#define ELSE 292
#define ID 293

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
