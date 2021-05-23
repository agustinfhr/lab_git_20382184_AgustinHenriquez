#lang racket
;TDA Comentarios
;id comentario
;texto
;autor
;fecha
;hora

#|
 Descripción: Constructor de un comentario
 Dominio: 
 Recorrido: list
|#
(define (set_comentario id_reaccion texto autor tiempo)
  (if (and (string? texto) (integer? id_reaccion) (string? autor) (list? tiempo))
      (list id_reaccion texto autor tiempo)
      null
      )
  )

