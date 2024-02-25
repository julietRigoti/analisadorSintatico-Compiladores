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
    ASG = 264,                     /* ASG  */
    COMP = 265,                    /* COMP  */
    AND = 266,                     /* AND  */
    OR = 267,                      /* OR  */
    NOT = 268,                     /* NOT  */
    CHAR = 269,                    /* CHAR  */
    INT = 270,                     /* INT  */
    VOID = 271,                    /* VOID  */
    FLOAT = 272,                   /* FLOAT  */
    DOUBLE = 273,                  /* DOUBLE  */
    NUMBER = 274,                  /* NUMBER  */
    STR = 275,                     /* STR  */
    O_KEY = 276,                   /* O_KEY  */
    O_BRAC = 277,                  /* O_BRAC  */
    O_PAR = 278,                   /* O_PAR  */
    C_PAR = 279,                   /* C_PAR  */
    C_BRAC = 280,                  /* C_BRAC  */
    C_KEY = 281,                   /* C_KEY  */
    SEMICOLON = 282,               /* SEMICOLON  */
    COMMA = 283,                   /* COMMA  */
    TWO_POINT = 284,               /* TWO_POINT  */
    POINT = 285,                   /* POINT  */
    INCLUDE = 286,                 /* INCLUDE  */
    WHILE = 287,                   /* WHILE  */
    FOR = 288,                     /* FOR  */
    IF = 289,                      /* IF  */
    ELSE = 290,                    /* ELSE  */
    ID = 291,                      /* ID  */
    MAIN = 292,                    /* MAIN  */
    RETURN = 293                   /* RETURN  */
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
#define ASG 264
#define COMP 265
#define AND 266
#define OR 267
#define NOT 268
#define CHAR 269
#define INT 270
#define VOID 271
#define FLOAT 272
#define DOUBLE 273
#define NUMBER 274
#define STR 275
#define O_KEY 276
#define O_BRAC 277
#define O_PAR 278
#define C_PAR 279
#define C_BRAC 280
#define C_KEY 281
#define SEMICOLON 282
#define COMMA 283
#define TWO_POINT 284
#define POINT 285
#define INCLUDE 286
#define WHILE 287
#define FOR 288
#define IF 289
#define ELSE 290
#define ID 291
#define MAIN 292
#define RETURN 293

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
