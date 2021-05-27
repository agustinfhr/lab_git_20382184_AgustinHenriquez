#lang racket
;TDA USUARIO
;nombre de usuario
;contraseña
;id usuario
;tipo de usuario


(require "TDA_Fecha.rkt")


; ///// Constructor /////

#|
 Descripción: contructor usuario
 Dominio: str X str X list X list X list X list X list
 Recorrido: list
 Ejemplo: (set_user "user1" "1234" '(4 3 2022) '("user2" "user3") '("user2" "user3") '(123) '(123) '(123))
|#
(define (set_user nombre contraseña fecha seguidores seguidos id_publicaciones p_compartidas_yo p_compartidas_otro)
  (if (and (string? nombre) (string? contraseña) (fecha? fecha) (list_str? seguidores) (list_str? seguidos) (list_int? id_publicaciones) (list_int? p_compartidas_yo) (list_int? p_compartidas_otro))
       (list nombre contraseña fecha seguidores seguidos id_publicaciones p_compartidas_yo p_compartidas_otro)
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
  (if (= 8 (length usuario))
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
  (if (= 8 (length usuario))
      (car (cdr usuario))
      null
      )
  )
#|
 Descripción: Selecciona la fecha del usuario
 Dominio: list
 Recorrido: list
|#
(define (get_fecha_u usuario)
  (if (= 8 (length usuario))
      (car (cdr (cdr usuario)))
      null
      )
  )
#|
 Descripción: Selecciona los seguidores del usuario
 Dominio: list
 Recorrido: list
|#
(define (get_seguidores usuario)
  (if (= 8 (length usuario))
      (car (cdr (cdr (cdr usuario))))
      null
      )
  )

#|
 Descripción: Selecciona los seguidos del usuario
 Dominio: list
 Recorrido: list
|#
(define (get_seguidos usuario)
  (if (= 8 (length usuario))
      (car (cdr (cdr (cdr (cdr usuario)))))
      null
      )
  )

#|
 Descripción: Selecciona los id de publicaciones del usuario
 Dominio: list
 Recorrido: list
|#
(define (get_id_publicaciones usuario)
  (if (= 8 (length usuario))
      (car (cdr (cdr (cdr (cdr (cdr usuario))))))
      null
      )
  )

#|
 Descripción: Selecciona las publicaciones que el usuario compartio
 Dominio: list
 Recorrido: list
|#
(define (get_p_compartidas_yo usuario)
  (if (= 8 (length usuario))
      (car (cdr (cdr (cdr (cdr (cdr (cdr usuario)))))))
      null
      )
  )

#|
 Descripción: Selecciona las publicaciones que otros usuarios le compartieron 
 Dominio: list
 Recorrido: list
|#
(define (p_compartidas_otro usuario)
  (if (= 8 (length usuario))
      (car (cdr (cdr (cdr (cdr (cdr (cdr (cdr usuario))))))))
      null
      )
  )


; ///// Pertenecia ///// 

#|
 Descripción: Verifica si corresponde a un usuario
 Dominio: list
 Recorrido: bool
|#
(define (usuario? usuario)
  (if (and (string? (get_nombre usuario)) (string? (get_contraseña usuario)) (fecha? (get_fecha_u usuario)) (list_str? (get_seguidores usuario)) (list_str? (get_seguidos usuario)) (list_int? (get_id_publicaciones usuario)) (list_int? (get_p_compartidas_yo usuario))(list_int? (get_p_compartidas_yo usuario)))
      #t
      #f
      )
  )

#|
 Descripción: Verifica si los contenidos de una lista son int
 Dominio: list
 Recorrido: bool
|#
(define (list_int? lista)
  (if (null? lista)
      #t
      (if (integer? (car lista))
          (list_int? (cdr lista))
          #f
          )
      )
  )

#|
 Descripción: Verifica si los contenidos de una lista son str
 Dominio: list
 Recorrido: bool
|#
(define (list_str? lista)
  (if (null? lista)
      #t
      (if (string? (car lista))
          (list_str? (cdr lista))
          #f
          )
      )
  )




; ///// Funcion extra /////

#|
 Descripción: Función que convierte los datos de un usuario a string, esta función muestra todos los datos menos la contraseña de los usuarios registrados, para verla debe iniciar sesión
 Dominio: list
 Recorrido: str
|#
(define (usuario->string usuario)
  (if (null? usuario)
      null
      (string-append
       "   [ Nombre de usuario: " (get_nombre usuario) " ]"           
       "   [ id publicaciones: " (string-join(map number->string (get_id_publicaciones usuario)) " ") " ]"                     
       "\n" "\n" "\n"
       )
      )      
  )

(provide (all-defined-out)) ;exporta todas las funciones de este archivo, debe ir al final