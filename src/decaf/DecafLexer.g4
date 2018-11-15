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
BOOLEAN: 'boolean';
INT: 'int';
CALLOUT: 'callout';
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

VIRGULA     : ',' ;
PONTOVIRGULA : ';';



NEG : '!';
EQUAL : '='; 
ASSIGNOPMAIS : '+=';
ASSIGNOPMENOS: '-=';
MENOS : '-';
OPCALC : '+' | '-' | '*' | '/' | '%';
OPCOMP : '>' | '<' | '<=' | '>=';
OPEQUI: '!=' | '==' ;
OPCOND: '&&' | '||';

ID  :  ('_'| LETRA ) ('_'|DIGITO|LETRA)*;
fragment LETRA: ('a'..'z' | 'A'..'Z');


COMENTARIO : '//' (~'\n')* '\n' -> skip;




HEXLITERAL : '0x'(DIGITO | 'a'..'f' | 'A'..'F')+ ;
DECLITERAL: DIGITO+;
DIGITO: ('0'..'9');

HEXERROR: '0x';


CHAR : '\'' (ESC| ASCII ) '\'';
STRING : '"' (ESC| ASCII )* '"';

fragment ESC :  '\\' ( 'r' | 'n' | 't' | '\'' | '"' | '\\') ;
fragment ASCII: [\u0020-\u0021|\u0023-\u0026|\u0028-\u005B|\u005D-\u007E];



