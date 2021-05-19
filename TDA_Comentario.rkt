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
(define (set_comentario texto autor fecha hora)
  (if (and (string? texto) (string? autor) (list_int? fecha) (list_int? hora))
      (list texto autor fecha hora)
      null
      )
  )

