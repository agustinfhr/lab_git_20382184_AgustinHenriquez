#lang racket
;Funciones encryptFunction decryptFunction


; ///// Constructor /////

#|
 Descripción: Función que encripta el contenido
 Dominio: str
 Recorrido: str
|#
(define (encryptFunction String)
  (if(null? String)
     null
     (string-append "*" String)))

#|
 Descripción: Función que desencripta el contenido
 Dominio: list
 Recorrido: bool
|#
(define (decryptFunction String)
  (if (null? String)
      null
      (substring String 1)))


(provide (all-defined-out)) ;exporta todas las funciones de este archivo, debe ir al final