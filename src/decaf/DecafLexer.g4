lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

LCURLY : '{';
RCURLY : '}';

ID  :
  ('a'..'z' | 'A'..'Z')+;

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC| ASCII ) '\'';
STRING : '"' (ESC| ASCII )* '"';
INT: DECIMAL;
OP: ('+'|'-'|'*'|'/'|'<'|'>'|'<='|'>='|'!='|'&&');

fragment
ESC :  '\\' ( 'r' | 'n' | 't' | '\'' | '"' | '\\') ;

fragment
ASCII: [\u0020-\u0021|\u0023-\u0026|\u0028-\u005B|\u005D-\u007E];

fragment
DECIMAL: '-'?[0-9]+;

