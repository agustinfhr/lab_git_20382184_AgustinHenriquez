#lang racket

(require "TDA_Usuario.rkt")
(require "TDA_socialnetwork_edit.rkt")

;Funciones complementarias


#|
 Descripción: Función que comprueba si el nombre de usuario está disponible
 Dominio: TDA Usuario x str x str
 Recorrido: bool
 Tipo de recursión: Natural
|#
(define (ya_registrado? usuarios nombre contraseña)
  (if (and (usuarios_sn? usuarios) (string? nombre) (string? contraseña) (not (= 0 (length usuarios))))
      (if (equal? nombre (get_nombre (car usuarios))) 
          #t
          (ya_registrado? (cdr usuarios) nombre contraseña)
          )
      #f
      )
  )

(provide (all-defined-out)) ;exporta todas las funciones de este archivo, debe ir al final