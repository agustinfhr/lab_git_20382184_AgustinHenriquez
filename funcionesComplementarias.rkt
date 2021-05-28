#lang racket

(require "TDA_Usuario.rkt")
(require "TDA_socialnetwork.rkt")

;Funciones complementarias

#|
 Descripción: Función que comprueba si el nombre de usuario está disponible
 Dominio: TDA Usuario x str x str
 Recorrido: bool
 Tipo de recursión: Natural
|#
(define (registrado? usuarios nombre contraseña)
  (if (and (usuarios_sn? usuarios) (string? nombre) (string? contraseña) (not (= 0 (length usuarios))))
      (if (equal? nombre (get_nombre (car usuarios))) 
          #t
          (registrado? (cdr usuarios) nombre contraseña)
          )
      #f
      )
  )


#|
 Descripción: Función que comprueba si el usuario ya se encuentra registrado
 Dominio: TDA Usuarios x str x str
 Recorrido: bool
 Tipo de recursión: Cola
|#
(define (verificar_login usuarios nombre contraseña)
  (if (and (usuarios_sn? usuarios) (string? nombre) (string? contraseña) (not (= 0 (length usuarios))))
      (if (and (equal? nombre (get_nombre (car usuarios))) (equal? contraseña (get_contraseña (car usuarios))))
          #t
          (verificar_login (cdr usuarios) nombre contraseña)
          )
      #f
      )
  )

#|
 Descripcion: Esta funcion trabaja en conjunto con la función login, eliminando un usuario de la lista que los contiene
 Dominio: list x list
 Recorrido: list
 Tipo de recursión: Natural
|#
(define (eliminar_usuario usuarios usuario_eliminado)
  (if (null? usuarios)
      null
      (if (equal? (car usuarios) usuario_eliminado)
          (eliminar_usuario (cdr usuarios) usuario_eliminado)
          (cons (car usuarios) (eliminar_usuario (cdr usuarios) usuario_eliminado))
          )
      )
  )

#|
 Descripción: Función que trabaja en conjunto con la función login, obtiene el usuario que iniciará sesión con el nombre que se ingresa
 Dominio: TDA socialnetwork x str
 Recorrido: list
 Tipo de recursión: Natural
|#
(define (buscar_usuario Socialnetwork nombre)
  (if (string? nombre)
      (if (null? (get_usuarios_sn Socialnetwork))
          (complemento_buscar_usuario Socialnetwork nombre)         
          (if (equal? nombre (get_nombre (car (get_usuarios_sn Socialnetwork))))
              (cons (car (get_usuarios_sn Socialnetwork)) (buscar_usuario (cdr (get_usuarios_sn Socialnetwork)) nombre))
              (buscar_usuario (cdr (get_usuarios_sn Socialnetwork)) nombre)
              )
          )
      null
      )
  )


#|
 Descripción: Función complementaria de la función buscar_usuario
 Dominio: list
 Recorrido: list
 Tipo de recursión: Natural
|#
(define (complemento_buscar_usuario usuarios nombre)
  (if (null? usuarios)
      usuarios
      (if (equal? nombre (get_nombre (car usuarios)))
          (cons (car usuarios) (complemento_buscar_usuario (cdr usuarios) nombre))
          (complemento_buscar_usuario (cdr usuarios) nombre)
          )
      )
  )

(provide (all-defined-out)) ;exporta todas las funciones de este archivo, debe ir al final
