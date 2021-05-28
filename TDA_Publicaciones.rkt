#lang racket

(require "TDA_Fecha.rkt")
(require "TDA_Usuario.rkt")
(require "TDA_Comentario.rkt")

;TDA PUBLICACIONES

; ///// Constructor /////

#|
 Descripción: contructor publicaciones
 Dominio: int x str x str x list x list x list 
 Recorrido: list
 ejemplo: (set_publicacion 10 "user1" "primer post" '() '(4 5 2045) '()) 
|#
(define (set_publicacion id_publicacion autor contenido comentarios fecha usuarios_etiquetados)
  (if (and (integer? id_publicacion) (string? autor) (string? contenido) (list? comentarios) (fecha? fecha) (list_str? usuarios_etiquetados))
       (list id_publicacion autor contenido comentarios fecha usuarios_etiquetados)
      null
      )
  )

; ///// Selector /////

#|
 Descripción: Selecciona la id de la publicacion 
 Dominio: list
 Recorrido: int
|#
(define (get_id_publicacion publicacion)
  (if (= 6 (length publicacion))
      (car publicacion)
      null
      )
  )

#|
 Descripción: Selecciona el autor de la publicacion 
 Dominio: list
 Recorrido: str
|#
(define (get_autor_p publicacion)
  (if (= 6 (length publicacion))
      (car (cdr publicacion))
      null
      )
  )

#|
 Descripción: Selecciona el contenido de la publicacion
 Dominio: list
 Recorrido: str
|#
(define (get_contenido publicacion)
  (if (= 6 (length publicacion))
      (car (cdr (cdr publicacion)))
      null
      )
  )

#|
 Descripción: Selecciona los comentarios de la publicacion 
 Dominio: list
 Recorrido: list
|#
(define (get_comentarios publicacion)
  (if (= 6 (length publicacion))
      (car (cdr (cdr (cdr publicacion))))
      null
      )
  )

#|
 Descripción: Selecciona la fecha de la publicacion 
 Dominio: list
 Recorrido: list
|#
(define (get_fecha_p publicacion)
  (if (= 6 (length publicacion))
      (car (cdr (cdr (cdr (cdr publicacion)))))
      null
      )
  )

#|
 Descripción: Selecciona los usuarios etiquetados de la publicacion 
 Dominio: list
 Recorrido: list
|#
(define (get_usuarios_etiquetados publicacion)
  (if (= 6 (length publicacion))
      (car (cdr (cdr (cdr (cdr (cdr publicacion))))))
      null
      )
  )

; ///// Pertenencia /////

#|
 Descripción: Verifica si corresponde a una publicacion 
 Dominio: list
 Recorrido: bool
|#
(define (publicacion? publicacion)
  (if (and (integer? get_id_publicacion) (string? get_autor_p) (string? get_contenido) (list_comment? get_comentarios) (fecha? get_fecha_p) (list_str? get_usuarios_etiquetados))      
      #t
      #f
      )
  )
 
(provide (all-defined-out)) ;exporta todas las funciones de este archivo, debe ir al final