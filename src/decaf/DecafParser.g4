parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CLASS PROGRAM LCURLY field_block* method_decl* RCURLY;

field_block: field_decl (COMMA field_decl)* SEMICOLON;
field_decl: TYPE ID | TYPE ID LSQUARE INTLITERAL RSQUARE ;

method_decl: (TYPE | VOID) ID LPARENT|(TYPE ID (COMMA TYPE ID)*)?| RPARENT block;

block: LCURLY var_decl* statement* RCURLY;
var_decl: TYPE ID (COMMA TYPE ID)*;

statement: 


