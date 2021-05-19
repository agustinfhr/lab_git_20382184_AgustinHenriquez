#lang racket
;TDA USUARIO
;Representación => '(nombre, contraseña, id_usuario, tipo)
;nombre de usuario
;contraseña
;id usuario
;tipo de usuario

; ///// Constructor /////

#|
 Descripción: contructor usuario
 Dominio: str X str X int X str
 Recorrido: list
|#
(define (set_user nombre contraseña id_usuario tipo)
  (if (and (string? nombre) (string? contraseña) (integer? id_usuario) (string? tipo))
       (list nombre contraseña id_usuario tipo)
      null
      )
  )

; ////// Selectores /////

#|
 Descripción: Selecciona el nombre de usuario
 Dominio: list
 Recorrido: str
|#
(define (get_nombre usuario)
  (if (= 4 (length usuario))
      (car usuario)
      null
      )
  )
#|
 Descripción: Selecciona la contraseña del usuario
 Dominio: list
 Recorrido: str
|#
(define (get_contraseña usuario)
  (if (= 4 (length usuario))
      (car (cdr usuario))
      null
      )
  )
#|
 Descripción: Selecciona la contraseña del usuario
 Dominio: list
 Recorrido: int
|#
(define (get_id_usuario usuario)
  (if (= 4 (length usuario))
      (car (cdr (cdr usuario)))
      null
      )
  )
#|
 Descripción: Selecciona el tipo de usuario
 Dominio: list
 Recorrido: str
|#
(define (get_tipo usuario)
  (if (= 4 (length usuario))
      (car (cdr (cdr (cdr usuario))))
      null
      )
  )


(provide (all-defined-out)) ;exporta todas las funciones de este archivo, debe ir al final
; ///// Pertenecia /////

#|
 Descripción: Verifica si corresponde a un usuario
 Dominio: list
 Recorrido: bool
|#
(define (usuario? usuario)
  (if (and (string? (get_nombre usuario)) (string? (get_contraseña usuario)) (integer? (get_id_usuario usuario)) (string? (get_tipo usuario)) )
      #t
      #f
      )
  )

; ///// Funcion extra /////

#|
 Descripción: Función que convierte los datos de un usuario a string, esta función muestra todos los datos menos la contraseña de los usuarios registrados, para verla debe iniciar sesión
 Dominio: list
 Recorrido: str
 Ejemplos:
(usuario->string '("Torre" "1111" 10 (15) (45)))
(usuario->string '("Anri" "1234" 10 (301) (105)))
(usuario->string '("e-girl" "1920" 25 (29) (54)))
|#
(define (usuario->string usuario)
  (if (null? usuario)
      null
      (string-append
       "   [ Nombre de usuario: " (get_nombre usuario) " ]"
       "   [ tipo: " (number->string (get_tipo usuario)) " ]"                 
       "   [ id usuario: " (string-join(map number->string (get_id_usuario usuario)) " ") " ]"                     
       "\n" "\n" "\n"
       )
      )      
  )

