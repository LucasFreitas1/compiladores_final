parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}
decl: type ID;
program: CLASS PROGRAM LCURLY field_decl* method_decl* RCURLY;
field_decl: (TYPE ID(VIRGULA decl)* | TYPE ID LSQUARE INTLITERAL RSQUARE (VIRGULA decl LSQUARE INTLITERAL RSQUARE)*) PONTOVIRGULA ;


method_decl: (TYPE | VOID) ID LPARENT (decl (VIRGULA decl)*)? RPARENT block;


block: LCURLY var_decl* statement* RCURLY;

var_decl: decl (VIRGULA ID)* PONTOVIRGULA;

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
expr|string_literal;

method_name: ID;
type: TYPE;
location: ID | ID LSQUARE expr RSQUARE;

expr:
location
| method_call
| literal
| expr (BINARYOP|UNARY) expr
| NEG expr
| LPARENT expr RPARENT
|UNARY expr;



literal:int_literal | char_literal | bool_literal;

int_literal: decimal_literal;

decimal_literal: INTLITERAL;

bool_literal: BOOLEANLITERAL;

char_literal: CHAR;

string_literal: STRING;
