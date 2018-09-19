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

WS_ : (' ' | '\n' | '\r'| '\t') -> skip;

PROGRAM: 'Program' ;
CLASS: 'class' ;
TYPE : 'boolean' | 'int' ;
CALLOUT: 'callout' ;
IF: 'if' ;
ELSE: 'else' ;
FOR: 'for' ;
VOID: 'void' ;
RETURN: 'return' ;
BREAK: 'break' ;
CONTINUE: 'continue' ;
BOOLEANLITERAL: 'true' | 'false';

LCURLY : '{';
RCURLY : '}';
LSQUARE   : '[' ;
RSQUARE   : ']' ;
LPARENT   : '(' ; 
RPARENT   : ')' ;
COMMA     : ',' ;
SEMICOLON : ';';



NEG : '!';
EQUAL : '='; 
ASSIGNOP : '+=' | '-=' | '*=' | '/=';
UNARY : '-';
BINARYOP : '+' | '*' | '/' | '%' | '<' | '>' | '>=' | '<=' | '!=' | '==' | '&&' | '||';

ID  :  ('_'| LETRA ) ('_'|DIGITO|LETRA)*;
fragment LETRA: ('a'..'z' | 'A'..'Z');


COMENTARIO : '//' (~'\n')* '\n' -> skip;



INTLITERAL : HEXLITERAL | DECLITERAL ;
fragment HEXLITERAL : '0x'(DIGITO | 'a'..'f' | 'A'..'F')+ ;
fragment DECLITERAL: DIGITO+;
fragment DIGITO: ('0'..'9');

HEXERROR: '0x';


CHAR : '\'' (ESC| ASCII ) '\'';
STRING : '"' (ESC| ASCII )* '"';

fragment ESC :  '\\' ( 'r' | 'n' | 't' | '\'' | '"' | '\\') ;
fragment ASCII: [\u0020-\u0021|\u0023-\u0026|\u0028-\u005B|\u005D-\u007E];



