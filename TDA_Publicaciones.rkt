#lang racket
;TDA PUBLICACIONES
;lista reacciones
;id publicacion
;autor
;fecha



; ///// Constructor /////

#|
 Descripción: contructor publicaciones
 Dominio: int x str x str x list x list 
 Recorrido: list
|#
(define (set_publicacion id_publicacion autor contenido comentarios fecha)
  (if (and (integer? id_publicacion) (string? autor) (string? contenido) (list? comentarios) (list? fecha))
       (list id_publicacion autor contenido comentarios fecha)
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
  (if (= 5 (length publicacion))
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
  (if (= 5 (length publicacion))
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
  (if (= 5 (length publicacion))
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
  (if (= 5 (length publicacion))
      (car (cdr (cdr (cdr publicacion))))
      null
      )
  )

#|
 Descripción: Selecciona la fecha de la publicacion 
 Dominio: list
 Recorrido: int
|#
(define (get_fecha_p publicacion)
  (if (= 5 (length publicacion))
      (car (cdr (cdr (cdr (cdr publicacion)))))
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
  (if (and (integer? get_id_publicacion) (string? get_autor_p) (string? get_contenido) (list? get_comentarios) (list? get_fecha_p))      
      #t
      #f
      )
  )

; ///// Funciones Extra /////


#|
 Descripción: Función que convierte una publicacion a un string 
 Dominio: list
 Recorrido: str
|#
(define (publicacion->string publicacion)
  (if (null? publicacion)
      null
      (string-append "   " (get_contenido publicacion) "\n"                            
                     "   Autor: " (get_autor_p publicacion)                          
                     "  " "Fecha: (" (string-join (map number->string (get_fecha_p publicacion)) " ") ")"                           
                     "  " "id publicacion: " (string-join(get_id_publicacion publicacion)) "\n" "\n"
                     "   " (get_comentarios publicacion) "\n" "\n" "\n" "\n")              
      )
  )

(provide (all-defined-out)) ;exporta todas las funciones de este archivo, debe ir al final