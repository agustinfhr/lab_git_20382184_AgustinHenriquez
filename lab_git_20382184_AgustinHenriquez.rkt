#lang racket

(require "TDA_Racketgram.rkt")
(require "TDA_Usuario.rkt")
(require "TDA_Publicaciones.rkt")
(require "TDA_Comentario.rkt")


;; ///// Funcion register /////

#|
 Descripción: Función que crea un nuevo usuario en Racketgram
 Dominio: TDA Racketgram x str x str
 Recorrido: TDA Racketgram
|#
;EN DESARROLLO
(define (register Racketgram nombre contraseña)
  (if (and (Racketgram? Racketgram) (string? nombre) (string? contraseña))
      (if (registrado? (get_usuarios Racketgram) nombre contraseña) 
          cuenta           
          (set_Racketgram (cons (set_usuario nombre contraseña) (get_usuario Racketgram)))      
          )
      Racketgram
      )
  )

; ///// Función login /////

#|
 Descripción: Función que permite iniciar sesión a un usuario registrado 
 Dominio: TDA Racketgram x str x str x function
 Recorrido: function -> Racketgram
|#
(define (login Racketgram nombre contraseña function)

  (if (and (Racketgram? Racketgram) (string? nombre) (string? contraseña))

      


; ///// Función post /////

; ///// Función follow /////

; ///// Función share /////

; ///// Función socialnetwork->string /////

; otras

; ///// Función comment /////

; ///// Función like /////