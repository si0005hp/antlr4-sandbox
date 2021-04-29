grammar AntlrTest
    ;

program
    : statement* EOF
    ;

statement
    : expression
    ;

expression
    : assignment
    ;

assignment
    : (call '.')? IDENTIFIER '=' assignment
    | term
    ;

term
    : factor (('+' | '-') factor)*
    ;

factor
    : unary (('*' | '/') unary)*
    ;

unary
    : ('!' | '-') unary
    | call
    ;

call
    : primary ('(' arguments? ')' | '.' IDENTIFIER)*
    ;

primary
    : number
    | STRING
    | IDENTIFIER
    | '(' expression ')'
    ;

number
    : INT
    | FLOAT
    ;

arguments
    : expression (',' expression)*
    ;

WS
    : [ \t\u000C\r\n]+ -> skip
    ;

INT
    : Digit+
    ;

FLOAT
    : Digit+ '.' Digit+
    ;

STRING
    : '"' ~('\\' | '"')* '"'
    ;

IDENTIFIER
    : Alpha (Alpha | Digit)*
    ;

fragment Alpha
    : [a-zA-Z_]
    ;

fragment Digit
    : [0-9]
    ;
