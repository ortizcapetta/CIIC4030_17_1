#lang racket
(require parser-tools/lex
         (prefix-in : parser-tools/lex-sre))

(define my-lex
  (lexer

   
   [(:+ (:or (char-range #\a #\z) (char-range #\A #\Z)))  ;repetitions of characters a-z or A-Z
 
    (cons `(ID ,(string->symbol lexeme))
          (my-lex input-port))]
   
     [(:: (:? #\-) (:+ (char-range #\0 #\9)))  ;repetition of numbers 0 to 9 pos and neg
   
  
    (cons `(INT ,(string->number lexeme))
          (my-lex input-port))]
   
   
   [(:or #\+ #\* #\% )  ;operations: +, *, %
    
    (cons `(OP ,(string->symbol lexeme))
          (my-lex input-port))]
   
   [#\(   ;left parenthesis
    
    (cons `(LP)
          (my-lex input-port))]
   
   [#\)   ;right parenthesis
    
    (cons `(RP) 
          (my-lex input-port))]

    [#\[  ;left bracket
    
    (cons `(LB) 
          (my-lex input-port))]

     [#\] ;right bracket
    
    (cons `(RB) 
          (my-lex input-port))]
   
 
   
   [#\space    ;whitespace
    (cons `(WS) 
          (my-lex input-port))]
    [#\newline  ;newline
    (cons `(NL) 
          (my-lex input-port))]
   
   [(eof)
    '()]))

(my-lex (open-input-string "2*[6%2]"))