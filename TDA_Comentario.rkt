#lang racket
;TDA Comentarios
;id comentario
;texto
;autor
;fecha
;hora

; ///// Constructores /////

#|
 Descripción: Constructor de un comentario
 Dominio: 
 Recorrido: list
|#
(define (set_comentario texto id_publicacion autor tiempo)
  (if (and (string? texto) (integer? id_reaccion) (string? autor) (list? tiempo))
      (list texto id_reaccion autor tiempo)
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
 Descripción: Selecciona el id de la reaccion 
 Dominio: list
 Recorrido: str
|#
(define (get_id_reaccion comentario)
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
(define (get_autor comentario)
  (if (= 4 (length comentario))
      (car (cdr (cdr comentario)))
      null
      )
  )


#|
 Descripción: Selecciona el tiempo del comentario
 Dominio: list
 Recorrido: list
 Ejemplos:
|#
(define (get_tiempo comentario)
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
  (if (and (string? (get_texto comentario)) (string? (get_id_reaccion comentario)) (string? (get_autor comentario)) (list? (get_tiempo comentario)) 
            )
      #t
      #f
      )
  )

(provide (all-defined-out)) ;exporta todas las funciones de este archivo, debe ir al final
