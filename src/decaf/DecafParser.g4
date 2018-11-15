parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CLASS PROGRAM LCURLY (field_decl)* (method_decl)* RCURLY;

field_decl: (decl| decl LSQUARE (int_literal)+ RSQUARE (VIRGULA (decl LSQUARE int_literal RSQUARE | decl))*) PONTOVIRGULA ;
method_decl: (type | VOID) ID LPARENT (decl (VIRGULA decl)*)* RPARENT block;


block: LCURLY (var_decl)* (statement)* RCURLY;

var_decl: decl (VIRGULA ID)* PONTOVIRGULA;

statement:
(location assign_op expr PONTOVIRGULA 
| method_call PONTOVIRGULA
| IF expr block (ELSE block)*
| FOR ID EQUAL expr VIRGULA expr block 
| return_coisa PONTOVIRGULA
| BREAK PONTOVIRGULA
| block
);

assign_op: EQUAL | ASSIGNOPMAIS | ASSIGNOPMENOS;

method_call:
(method_name LPARENT (expr (VIRGULA expr)*)* RPARENT
| CALLOUT LPARENT STRING (VIRGULA callout_arg (VIRGULA callout_arg)*)* RPARENT);

method_name: ID;

location: (ID | ID LSQUARE expr RSQUARE);

expr:
location (expr)*
| method_call
| literal
| expr operadores expr
| MENOS expr
| NEG expr
| LPARENT expr RPARENT;


decl: type ID;
type: (BOOLEAN | INT);


callout_arg: (expr|STRING);

return_coisa: RETURN(expr)*;
operadores: (OPCALC | OPCOMP | OPEQUI | OPCOND);

bool_literal: BOOLEANLITERAL;
char_literal: CHAR;
int_literal: (DECLITERAL | HEXLITERAL);

literal:int_literal | char_literal | bool_literal;
