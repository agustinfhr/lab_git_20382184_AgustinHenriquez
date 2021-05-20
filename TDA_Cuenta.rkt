#lang racket
;TDA CUENTA
;lista usuarios
;fecha
;hora
;lista id publicaciones
;lista id comentarios
;lista id reacciones
;lista seguidores
;lista mensajes
;lista compartidos

; ///// Constructor /////

#|
 Descripción: contructor cuenta
 Dominio: 
 Recorrido: list
|#
(define (set_cuenta usuario publicaciones)
  (if (and (string? nombre) (publicacion? publicaciones))
       (list cuenta usuario publicaciones)
      null
      )
  )
