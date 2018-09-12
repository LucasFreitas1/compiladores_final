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

field_decl: ((TYPE ID | TYPE ID '[' INT ']')* ',')* ;
method_decl: ;
