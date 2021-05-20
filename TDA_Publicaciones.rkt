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
(define (set_publicacion id_publicacion autor texto reacciones fecha hora)
  (if (and (integer? id_publicacion) (string? autor) (string? texto) (list? reacciones) (integer? fecha) (integer? hora))
       (list id_publicacion autor reacciones fecha hora)
      null
      )
  )

; ///// Selector /////

#|
 Descripción: Selecciona una publicacion 
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
(define (get_autor publicacion)
  (if (= 6 (length publicacion))
      (car (cdr publicacion))
      null
      )
  )

#|
 Descripción: Selecciona el texto de la publicacion
 Dominio: list
 Recorrido: str
|#
(define (get_texto publicacion)
  (if (= 6 (length publicacion))
      (car (cdr (cdr publicacion)))
      null
      )
  )

#|
 Descripción: Selecciona las reacciones de la publicacion 
 Dominio: list
 Recorrido: list
|#
(define (get_reacciones publicacion)
  (if (= 6 (length publicacion))
      (car (cdr (cdr (cdr publicacion))))
      null
      )
  )

#|
 Descripción: Selecciona la fecha de la publicacion 
 Dominio: list
 Recorrido: int
|#
(define (get_fecha publicacion)
  (if (= 6 (length publicacion))
      (car (cdr (cdr (cdr (cdr publicacion)))))
      null
      )
  )

#|
 Descripción: Selecciona la hora de la publicacion 
 Dominio: list
 Recorrido: int
|#
(define (get_hora publicacion)
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
  (if (and (integer? get_id_publicacion) (string? get_autor) (string? get_texto) (list? get_reacciones) (integer? get_fecha) (integer? get_hora))      
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
      (string-append "   " (get_texto publicacion) "\n"                            
                     "   Autor: " (get_autor publicacion)                          
                     "  " "Fecha: (" (string-join (map number->string (get_fecha publicacion)) " ") ")"                           
                     "  " "Hora: " (number->string (get_hora publicacion)) 
                     "  " "id publicacion: " (string-join(get_id_publicacion publicacion)) "\n" "\n"
                     "   " (get_reacciones publicacion) "\n" "\n" "\n" "\n")              
      )
  )

(provide (all-defined-out)) ;exporta todas las funciones de este archivo, debe ir al final