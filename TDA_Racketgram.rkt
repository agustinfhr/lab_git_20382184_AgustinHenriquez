#lang racket
;TDA RACKETGRAM
;lista usuarios
;lista publicaciones


; Representación TDA Racketgram => (usuarios, publicaciones)

; Representación TDA Usuario => (nombre, contraseña, tipo, fecha, hora, seguidores, id_publicacion, compartidos)

; Representación TDA Publicaciones => (id_publicacion, autor, contenido, likes, comentarios, fecha, hora)

; Representación TDA Comentario => (texto, id_publicacion, autor, fecha, hora)

; Representación TDA Fecha => (dia mes año)

; Representación TDA Hora => (hora minuto)


; ///// Constructor /////

#|
 Descripción: Constructor TDA Racketgram
 Dominio: TDA usuario x TDA publicaciones
 Recorrido: TDA Racketgram
|#
(define (set_Racketgram usuarios publicaciones)
  (if (and (usuarios_Racketgram? usuarios) (publicaciones_Racketgram? publicaciones))
      (list usuarios publicaciones)
      null
      )
  )


; ///// Selector /////

#|
 Descripción: Selecciona el TDA usuario
 Dominio: TDA usuario x TDA publicaciones
 Recorrido: TDA Usuario
|#
(define (get_usuarios Racketgram)
  (if (= 2 (length Racketgram))
      (car Racketgram)
      null
      )
  )

#|
 Descripción: Selecciona el TDA publicaciones
 Dominio: TDA usuario x TDA publicaciones
 Recorrido: TDA publicaciones
|#
(define (get_preguntas Racketgram)
  (if (= 2 (length Racketgram))
      (car (cdr Racketgram))
      null
      )
  )

; ///////////// Pertenencia /////////////