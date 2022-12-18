%{
#define YYSTYPE void*
#include "parser.hpp"
extern "C" int yylex();
extern "C" void yyerror(char* str);
%}

%option yylineno
%option noyywrap

%%

"#"*\n      				; // is a comment


[0-9]+						{
								yylval = strdup(yytext);
								return NUM;
							}
							
"proc"						{ /*printf("ProcBegin\n");*/ return PROC; }

"goto"						{ /*printf("GotoToken\n");*/ return GOTO; }

"integer"					{ /*printf("integerToken");*/ return INTEGER; }

"label"						{ return LABEL; }

"dindon"					{ return DINDON; }

[A-Za-z_][A-Za-z_0-9]*      {
                  				/*printf("Identifier %s\n", yytext);*/
                  				yylval = strdup(yytext);
                  				return IDENTIFIER;
							}

[ \t\r\n]					; // whitespace

.							{ return *yytext;/*yyerror("Wrong character"); exit(-1);*/ }

%%