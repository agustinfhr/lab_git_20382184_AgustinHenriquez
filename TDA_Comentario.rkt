#lang racket

(require "TDA_Fecha.rkt")

;TDA Comentarios

; ///// Constructores /////

#|
 Descripción: Constructor de un comentario
 Dominio: str x int x str x list
 Recorrido: list
|#
(define (set_comentario texto c_id_publicacion autor fecha)
  (if (and (string? texto) (integer? c_id_publicacion) (string? autor) (fecha? fecha))
      (list texto c_id_publicacion autor fecha)
      null
      )
  )


; ///// Selector /////

#|
 Descripción: Selecciona el texto del comentario
 Dominio: list
 Recorrido: str
|#
(define (get_texto comentario)
  (if (= 4 (length comentario))
      (car comentario)
      null
      )
  )


#|
 Descripción: Selecciona el id de la publicacion del comentario 
 Dominio: list
 Recorrido: int
|#
(define (get_c_id_publicacion comentario)
  (if (= 4 (length comentario))
      (car (cdr comentario))
      null
      )
  )


#|
 Descripción: Selecciona el autor del comentario
 Dominio: list
 Recorrido: str
|#
(define (get_autor_c comentario)
  (if (= 4 (length comentario))
      (car (cdr (cdr comentario)))
      null
      )
  )


#|
 Descripción: Selecciona la fecha del comentario
 Dominio: list
 Recorrido: list
|#
(define (get_fecha_c comentario)
  (if (= 4 (length comentario))
      (car (cdr (cdr (cdr comentario))))
      null
      )
  )


; ///// Pertenencia /////

#|
 Descripción: Verifica si corresponde a un comentario
 Dominio: list
 Recorrido: bool
|#
(define (comentario? comentario)
  (if (and (string? (get_texto comentario)) (integer? (get_c_id_publicacion comentario)) (string? (get_autor_c comentario)) (list? (get_fecha_c comentario))
           )
      #t
      #f
      )
  )

#|
 Descripción: Verifica si los contenidos son de un comentario
 Dominio: list
 Recorrido: bool
|#
(define (list_comment? lista)
  (if (null? lista)
      #t
      (if (comentario? (car lista))
          (list_comment? (cdr lista))
          #f
          )
      )
  )

(provide (all-defined-out)) ;exporta todas las funciones de este archivo, debe ir al final
