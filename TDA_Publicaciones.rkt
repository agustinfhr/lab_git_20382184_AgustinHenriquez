#lang racket
;TDA PUBLICACIONES
;lista reacciones
;id publicacion
;autor
;fecha
;hora


; ///// Constructor /////

#|
 Descripción: contructor publicaciones
 Dominio: 
 Recorrido: list
|#
(define (set_publicacion id_publicacion autor reacciones fecha hora)
  (if (and (integer? id_publicacion) (string? autor) (list? reacciones) (integer? fecha) (integer? hora))
       (list id_publicacion autor reacciones fecha hora)
      null
      )
  )
