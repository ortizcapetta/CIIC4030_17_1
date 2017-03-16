# CIIC4030_17_1

A Lexical Analyzer in Racket with the following token definitions:

• identifiers: [a-zA-Z]+

• delimiters: "("|")"|”[“|”]”

• operators: "+"|"*"|”%”

• integers: -?[0-9]+

• whitespace: [ \n]+

As an example of output (your_lexer “2*[6%2]”) should yield

( (INT 2)(OP *){LB)(INT 6)(OP module)(INT 2)(RB) )
