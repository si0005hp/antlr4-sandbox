grammar AntlrTest
    ;

program
    : helloStatement* EOF
    ;

helloStatement
    : 'hello' primary
    ;

primary
    : INT
    | FLOAT
    | STRING
    | IDENTIFIER
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
