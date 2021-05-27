#lang racket

(require "TDA_socialnetwork_edit.rkt")
(require "TDA_Usuario.rkt")
(require "TDA_Publicaciones.rkt")
(require "TDA_Comentario.rkt")
(require "TDA_Fecha.rkt")
(require "encryptDecryptFunction.rkt")
(require "funcionesComplementarias.rkt")



;; ///// Funcion register /////  

#|
 Descripción: Función que crea un nuevo usuario en socialnetwork
 Dominio: TDA socialnetwork x str x str x fecha
 Recorrido: TDA socialnetwork
|#

(define (register Socialnetwork nombre contraseña fecha)
  
  
  (if (and (socialnetwork? Socialnetwork) (string? nombre) (string? contraseña) (fecha? fecha))
      
     
      (if (ya_registrado? (get_usuarios_sn Socialnetwork) nombre contraseña)        
          
          Socialnetwork
          
          (socialnetwork (get_name Socialnetwork) (get_date Socialnetwork) (cons (set_user nombre contraseña fecha '() '() '() '()) (get_usuarios_sn Socialnetwork)) (get_publicaciones_sn Socialnetwork))      
          )
      
      
      Socialnetwork
      
      )
  )

; (register '("Racketgram" '(4 4 2044) encryptFunction decryptFunction '() '()) "user1" "con" '(4 4 2044))

; ///// Función login /////

#|
 Descripción: Función que permite iniciar sesión a un usuario registrado 
 Dominio: TDA Racketgram x str x str x function
 Recorrido: function ->
|#
    


; ///// Función post /////

; ///// Función follow /////  

; ///// Función share /////

; ///// Función socialnetwork->string /////

; otras

; ///// Función comment /////

; ///// Función like /////