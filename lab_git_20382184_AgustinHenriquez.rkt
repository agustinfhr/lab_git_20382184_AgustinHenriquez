#lang racket

(require "TDA_Racketgram.rkt")
(require "TDA_Cuenta.rkt")
(require "TDA_Usuario.rkt")
(require "TDA_Publicaciones.rkt")
(require "TDA_Reacciones.rkt")
(require "TDA_Comentario.rkt")


;; ///// Funcion register /////

#|
 Descripción: Función que crea un nuevo usuario en 
 Dominio: TDA Cuenta x str x str
 Recorrido: TDA Cuenta
|#
;EN DESARROLLO
(define (register cuenta nombre contraseña)
  (if (and (cuenta? cuenta) (string? nombre) (string? contraseña))
      (if (registrado? (get_usuarios cuenta) nombre contraseña) 
          cuenta           
          (set_cuenta (cons (set_usuario nombre contraseña) (get_usuario cuenta))  ))      
          )
      cuenta
      )
  )