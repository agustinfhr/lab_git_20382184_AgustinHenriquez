#lang racket
;TDA USUARIO
;nombre de usuario
;contraseña
;id usuario
;tipo de usuario

; ///// Constructor /////

#|
 Descripción: contructor usuario
 Dominio: (str x str x int x (int x int x int x ...) x (int x int x int x int x int x ...))
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



; ///// Pertenecia /////

#|
 Descripción: Verifica si corresponde a un usuario
 Dominio: list
 Recorrido: bool
|#
(define (usuario? usuario)
  (if (and (string? (get_nombre usuario)) (string? (get_contraseña usuario)) (integer? (get_id usuario)) (string? (get_tipo usuario)) )
      #t
      #f
      )
  )


