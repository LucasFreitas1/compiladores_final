parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CLASS PROGRAM LCURLY field_decl* method_decl* RCURLY;
field_decl: (TYPE ID(VIRGULA TYPE ID)* | TYPE ID LSQUARE INTLITERAL RSQUARE (VIRGULA TYPE ID LSQUARE INTLITERAL RSQUARE)*) PONTOVIRGULA ;

method_decl: (TYPE | VOID) ID LPARENT (TYPE ID (VIRGULA TYPE ID)*)? RPARENT block;


block: LCURLY var_decl* statement* RCURLY;

var_decl: TYPE ID (VIRGULA ID)* PONTOVIRGULA;

statement:
location assign_op expr PONTOVIRGULA 
| method_call PONTOVIRGULA
| IF LPARENT expr RPARENT block (ELSE block)?
| FOR ID EQUAL expr VIRGULA expr block 
| RETURN expr? PONTOVIRGULA
| BREAK PONTOVIRGULA
| CONTINUE PONTOVIRGULA
| block;

assign_op: EQUAL | ASSIGNOP;

method_call:
method_name LPARENT (expr (VIRGULA expr)*)? RPARENT
| CALLOUT LPARENT STRING (VIRGULA callout_arg(VIRGULA callout_arg)*)? RPARENT;

callout_arg:
expr|STRING;

method_name: ID;

location: ID | ID LSQUARE expr RSQUARE;

expr:
location
| method_call
| literal
| expr (BINARYOP|UNARY) expr
| NEG expr
| LPARENT expr RPARENT
|UNARY?;



literal:BOOLEANLITERAL|INTLITERAL|CHAR;
