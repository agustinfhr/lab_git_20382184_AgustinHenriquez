#lang racket


(require "TDA_Usuario.rkt")
(require "TDA_Publicaciones.rkt")
(require "TDA_Fecha.rkt")
(require "encryptDecryptFunction.rkt")



;TDA socialnetwork


; Representación TDA socialnetwork => (name, date, encryptFunction, decryptFunction, usuarios, publicaciones, sesionActiva)

; Representación TDA Usuario => (nombre, contraseña, fecha, seguidores, seguidos, id_publicaciones, p_compartidas_yo, p_compartidas_otro)

; Representación TDA Publicaciones => (id_publicacion, autor, contenido, comentarios, fecha, usuarios_etiquetados)

; Representación TDA Comentario => (texto, c_id_publicacion, autor, fecha)

; Representación TDA Fecha => (dia, mes, año)


; ///// Constructor /////

#|
 Descripción: Constructor TDA socialnetwork
 Dominio: str x date(TDA Fecha) x function(encryptFunction) x function(decryptFunction) x TDA usuario x TDA publicaciones x list
 Recorrido: TDA socialnetwork
 Ejemplo: (socialnetwork "Racketgram" '(1 2 2023) '(("user1" "1234" (4 3 2022) ("user2" "user3") ("user2" "user3") (123) (123) (123))) '() '())
|#
(define (socialnetwork name date encryptFunction decryptFunction usuarios publicaciones sesionActiva)
  (if (and (string? name)(fecha? date)(usuarios_sn? usuarios) (publicaciones_sn? publicaciones) (usuarios_sn? sesionActiva))
      (list name date encryptFunction decryptFunction usuarios publicaciones sesionActiva)
      null
      )
  )


; ///// Selector /////

#|
 Descripción: Selecciona el name del TDA socialnetwork
 Dominio: str x date(TDA Fecha) x function(encryptFunction) x function(decryptFunction) x TDA usuario x TDA publicaciones x list
 Recorrido: str
|#
(define (get_name Socialnetwork)
  (if (= 7 (length Socialnetwork))
      (car Socialnetwork)
      null
      )
  )

#|
 Descripción: Selecciona el date(la fecha) del TDA socialnetwork
 Dominio: str x date(TDA Fecha) x function(encryptFunction) x function(decryptFunction) x TDA usuario x TDA publicaciones x list
 Recorrido: list
|#
(define (get_date Socialnetwork)
  (if (= 7 (length Socialnetwork))
      (car (cdr Socialnetwork))
      null
      )
  )

#|
 Descripción: Selecciona a usuarios del TDA socialnetwork
 Dominio: str x date(TDA Fecha) x function(encryptFunction) x function(decryptFunction) x TDA usuario x TDA publicaciones x list
 Recorrido: list
|#
(define (get_usuarios_sn Socialnetwork)
  (if (= 7 (length Socialnetwork))
      (car (cdr (cdr (cdr (cdr Socialnetwork)))))
      null
      )
  )

#|
 Descripción: Selecciona publicaciones del TDA socialnetwork
 Dominio: str x date(TDA Fecha) x function(encryptFunction) x function(decryptFunction) x TDA usuario x TDA publicaciones x list
 Recorrido: list
|#
(define (get_publicaciones_sn Socialnetwork)
  (if (= 7 (length Socialnetwork))
      (car (cdr (cdr (cdr (cdr (cdr Socialnetwork))))))
      null
      )
  )

#|
 Descripción: Selecciona la sesion activa del TDA socialnetwork
 Dominio: str x date(TDA Fecha) x function(encryptFunction) x function(decryptFunction) x TDA usuario x TDA publicaciones x list
 Recorrido: list
|#
(define (get_sesionActiva Socialnetwork)
  (if (= 7 (length Socialnetwork))
      (car (cdr (cdr (cdr (cdr (cdr (cdr Socialnetwork)))))))
      null
      )
  )



; ///// Pertenencia /////

#|
 Descripción: Verifica si los elementos de la lista de socialnetwork corresponden a un usuario
 Dominio: list
 Recorrido: bool
|#
(define (usuarios_sn? usuarios)
  (if (null? usuarios)
      #t
      (if (usuario? (car usuarios))
          (usuarios_sn? (cdr usuarios))
          #f
          )
      )
  )
     

#|
 Descripción: Verifica si los elementos de la lista de socialnetwork corresponden a una publicaciones
 Dominio: list
 Recorrido: bool
|#
(define (publicaciones_sn? publicaciones)
  (if (null? publicaciones)
      #t
      (if (publicacion? (car publicaciones))
          (publicaciones_sn? (cdr publicaciones))
          #f
          )
      )
  )

#|
 Descripción: Función que verifica si corresponde a socialnetwork
 Dominio: str x date(TDA Fecha) x function(encryptFunction) x function(decryptFunction) x TDA usuario x TDA publicaciones x list
 Recorrido: bool
|#
(define (socialnetwork? Socialnetwork)
  (if (and (string? (get_name Socialnetwork)) (fecha? (get_date Socialnetwork)) (usuarios_sn? (get_usuarios_sn Socialnetwork)) (publicaciones_sn? (get_publicaciones_sn Socialnetwork)) (usuarios_sn? (get_sesionActiva Socialnetwork)))
      #t
      #f
      )
  )


(provide (all-defined-out)) ;exporta todas las funciones de este archivo, debe ir al final