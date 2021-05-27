#lang racket


(require "TDA_Usuario.rkt")
(require "TDA_Publicaciones.rkt")
(require "TDA_Fecha.rkt")



;TDA socialnetwork
;lista usuarios
;lista publicaciones


; Representación TDA socialnetwork => (name, date, encryptFunction, decryptFunction, usuarios, publicaciones)

; Representación TDA Usuario => (nombre, contraseña, fecha, seguidores, seguidos, id_publicaciones, p_compartidas)

; Representación TDA Publicaciones => (id_publicacion, autor, contenido, comentarios, fecha)

; Representación TDA Comentario => (texto, c_id_publicacion, autor, fecha)

; Representación TDA Fecha => (dia, mes, año)


; ///// Constructor /////

#|
 Descripción: Constructor TDA socialnetwork
 Dominio: str x date(TDA Fecha) x function(encryptFunction) x function(decryptFunction) x TDA usuario x TDA publicaciones
 Recorrido: TDA socialnetwork
|#
(define (socialnetwork name date usuarios publicaciones)
  (if (and (string? name)(fecha? date)(usuarios_sn? usuarios) (publicaciones_sn? publicaciones))
      (list name date usuarios publicaciones)
      null
      )
  )


; ///// Selector /////

#|
 Descripción: Selecciona el name del TDA socialnetwork
 Dominio: str x date(TDA Fecha) x function(encryptFunction) x function(decryptFunction) x TDA usuario x TDA publicaciones
 Recorrido: str
|#
(define (get_name Socialnetwork)
  (if (= 4 (length Socialnetwork))
      (car Socialnetwork)
      null
      )
  )

#|
 Descripción: Selecciona el date del TDA socialnetwork
 Dominio: str x date(TDA Fecha) x function(encryptFunction) x function(decryptFunction) x TDA usuario x TDA publicaciones
 Recorrido: list
|#
(define (get_date Socialnetwork)
  (if (= 4 (length Socialnetwork))
      (car (cdr Socialnetwork))
      null
      )
  )

#|
 Descripción: Selecciona a usuarios del TDA socialnetwork
 Dominio: str x date(TDA Fecha) x function(encryptFunction) x function(decryptFunction) x TDA usuario x TDA publicaciones
 Recorrido: list
|#
(define (get_usuarios_sn Socialnetwork)
  (if (= 4 (length Socialnetwork))
      (car (cdr (cdr Socialnetwork)))
      null
      )
  )

#|
 Descripción: Selecciona publicaciones del TDA socialnetwork
 Dominio: str x date(TDA Fecha) x function(encryptFunction) x function(decryptFunction) x TDA usuario x TDA publicaciones
 Recorrido: list
|#
(define (get_publicaciones_sn Socialnetwork)
  (if (= 4 (length Socialnetwork))
      (car (cdr (cdr (cdr Socialnetwork))))
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
 Dominio: str x date(TDA Fecha) x function(encryptFunction) x function(decryptFunction) x TDA usuario x TDA publicaciones
 Recorrido: bool
|#
(define (socialnetwork? Socialnetwork)
  (if (and (string? (get_name Socialnetwork)) (fecha? (get_date Socialnetwork)) (usuarios_sn? (get_usuarios_sn Socialnetwork)) (publicaciones_sn? (get_publicaciones_sn Socialnetwork)))
      #t
      #f
      )
  )


(provide (all-defined-out)) ;exporta todas las funciones de este archivo, debe ir al final