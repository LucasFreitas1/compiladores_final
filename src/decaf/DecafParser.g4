parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CLASS PROGRAM program2 EOF;
program2: LCURLY field_decl* method_decl* RCURLY;

field_decl: field_decl_arg (field_decl_arg (VIRGULA field_decl_arg)*)? PONTOVIRGULA;
field_decl_arg: TYPE ID | TYPE ID LSQUARE INTLITERAL RSQUARE;

method_decl: (TYPE | VOID) ID LPARENT method_decl_arg? RPARENT block;
method_decl_arg: TYPE ID (VIRGULA method_decl_arg)*;

block: LCURLY var_decl* statement* RCURLY;

var_decl: TYPE ID (VIRGULA TYPE ID)* PONTOVIRGULA;

statement:
location assign_op expr PONTOVIRGULA 
| method_call PONTOVIRGULA
| IF LPARENT expr RPARENT block (ELSE block)?
| FOR ID EQUAL expr VIRGULA expr block 
| RETURN expr? PONTOVIRGULA
| BREAK PONTOVIRGULA
| CONTINUE PONTOVIRGULA
| block ;

assign_op: EQUAL | ASSIGNOP;

method_call:
method_name LPARENT (expr (VIRGULA expr)*)? RPARENT
| CALLOUT LPARENT STRING (VIRGULA (callout_arg VIRGULA)*)? RPARENT;


method_name: ID;

location: ID | ID LSQUARE expr RSQUARE;

expr:
location
| method_call
| ( INTLITERAL | BOOLEANLITERAL) 
| expr BINARYOP expr
| UNARY expr
| NEG expr
| LPARENT expr RPARENT;

callout_arg:
expr | STRING;