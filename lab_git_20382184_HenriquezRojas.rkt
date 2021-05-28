#lang racket

(require "TDA_socialnetwork.rkt")
(require "TDA_Usuario.rkt")
(require "TDA_Publicaciones.rkt")
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
  
  ; Si los argumentos entregados corresponden a lo que pide la función
  (if (and (socialnetwork? Socialnetwork) (string? nombre) (string? contraseña) (fecha? fecha))
      
      ; Si el nombre de usuario ya se encuentra registrado
      (if (registrado? (get_usuarios_sn Socialnetwork) nombre contraseña)       
           ; Se retorna Socialnetwork intacto
          Socialnetwork
          ; Sino, se define un nuevo socialnetwork con el usuario registrado
          (socialnetwork (get_name Socialnetwork) (get_date Socialnetwork) encryptFunction decryptFunction (cons (set_user nombre contraseña fecha '() '() '() '() '()) (get_usuarios_sn Socialnetwork)) (get_publicaciones_sn Socialnetwork) (get_sesionActiva Socialnetwork))      
          )
      
      ; Si los argumentos entregados a la función no corresponden, entonces se entrega el socialnetwork intacto
      Socialnetwork
      
      )
  )

; ///// Función login /////

#|
 Descripción: Función que permite iniciar sesión a un usuario registrado 
 Dominio: TDA socialnetwork x str x str x function
 Recorrido: function -> TDA socialnetwork
|#

(define (login Socialnetwork nombre contraseña function)

  ; Si los argumentos entregados corresponden con lo que pide la función
  (if (and (socialnetwork? Socialnetwork) (string? nombre) (string? contraseña))

      ; Si la lista de usuarios está vacía
      (if (null? (get_usuarios_sn Socialnetwork))
          Socialnetwork

          ; Si el usuario se encuentra registrado
          (if (verificar_login (get_usuarios_sn Socialnetwork) nombre contraseña) 

              ; Se define un nuevo Socialnetwork para ser operado por "function", y con el usuario que inició sesión en el espacio de "usuarioActivo", 
              (function (socialnetwork (get_name Socialnetwork) (get_date Socialnetwork) encryptFunction decryptFunction (eliminar_usuario (get_usuarios_sn Socialnetwork) (car (buscar_usuario Socialnetwork nombre))) (get_publicaciones_sn Socialnetwork) (buscar_usuario Socialnetwork nombre)))

              ; Si el usuario no se encuentra registrado o escribió mal algún dato
              (error "* Error: Usuario o contraseña no encontrados")
              )
          )
      
      ; Si los argumentos no corresponden a lo que pide la función, se entrega el Socialnetwork intacto
      Socialnetwork
      )
  )

    


; ///// Función post /////


#|
 Descripción: Función que permite a un usuario con sesión iniciada realizar un post
 Dominio: TDA Socialnetwork
 Recorrido: function -> TDA Socialnetwork x fecha x str x list 
|#
(define (post Socialnetwork) (λ (fecha) (λ (publicacion . users)

   ; Si los argumentos entregados corresponden a lo que se pide                              
  (if (and (socialnetwork? Socialnetwork) (fecha? fecha) (publicacion? publicacion))
      
      ; Añadimos la fecha al principio del Socialnetwork que se va a formar
      (socialnetwork
       (get_name Socialnetwork)
       (get_date Socialnetwork)
       encryptFunction
       decryptFunction
       ; Actualizamos la lista de ID's publicaciones del usuario, añadiendo el ID de la publicacion realizada
       
       (append (eliminar_usuario (get_usuarios_sn Socialnetwork) (car (get_sesionActiva Socialnetwork)))
               (list (set_user                  
                      (get_nombre (car (get_sesionActiva Socialnetwork)))
                      (get_contraseña (car (get_sesionActiva Socialnetwork)))
                      (get_fecha_u (car (get_sesionActiva Socialnetwork)))
                      (get_seguidores (car (get_sesionActiva Socialnetwork)))
                      (get_seguidos (car (get_sesionActiva Socialnetwork)))
                      (append (get_id_publicaciones (car (get_sesionActiva Socialnetwork))) (list (get_id_publicacion publicacion)))
                      (get_p_compartidas_yo (car (get_sesionActiva Socialnetwork)))
                      (get_p_compartidas_otro (car (get_sesionActiva Socialnetwork))))))
             
       ; Actualizamos la lista de publicaciones de Socialnetwork, añadiendo la publicacion nueva 
       (append  (list (set_publicacion
                       (get_id_publicacion publicacion)
                       (get_autor_p publicacion)
                       (get_contenido publicacion)
                       (get_comentarios publicacion)
                       fecha                   
                       (get_usuarios_etiquetados publicacion)))
                               
                (get_publicaciones_sn Socialnetwork))
          
       ; Finalmente, se desconecta el usuario activo
       null)

      ; Si algún argumento no corresponde a una entrada de la función, se retorna el Socialnetwork intacto y se desconecta el usuario que estaba activo
      (socialnetwork (get_name Socialnetwork) (get_date Socialnetwork) encryptFunction decryptFunction (append (get_usuarios_sn Socialnetwork) (get_sesionActiva Socialnetwork)) (get_publicaciones_sn Socialnetwork) null)
      )))                                 
)

#|
//////// Ejemplos Funciones Obligatorias ///////


///// Función register //////

(register '("Racketgram" (4 3 2040) encryptFunction decryptFunction () () ()) "user1" "con" '(4 4 2044))
(register '("Racketgram" (4 3 2040) encryptFunction decryptFunction (("user1" "con" (4 4 2044) () () () () ())) () ()) "user2" "con2" '(4 4 2044))
(register '("Racketgram" (4 3 2040) encryptFunction decryptFunction (("user2" "con2" (4 4 2044) () () () () ()) ("user1" "con" (4 4 2044) () () () () ())) () ()) "user3" "con3" '(4 4 2044))

///// Función login //////

Funcion login requiere de "function" para ser ejecutada
ejemplo referencial
(login '("Racketgram" (4 4 2044) encryptFunction decryptFunction (("user1" "con" (4 4 2044) () () () () ())) () ()) "user1" "con" function)
**saldria un error por "function"

///// Función post //////

(((login '("Racketgram" (4 4 2044) encryptFunction decryptFunction (("user1" "con" (4 4 2044) () () () () ())) () ()) "user1" "con" post)(set_fecha 2 4 2045)) (set_publicacion 10 "user1" "primer post" '() '(4 5 2045) '()))
(((login '("Racketgram" (4 4 2044) encryptFunction decryptFunction (("user1" "con" (4 4 2044) () () () () ())) () ()) "user1" "con" post)(set_fecha 2 4 2045)) (set_publicacion 10 "user1" "hola" '() '(4 5 2045) '()))
(((login '("Racketgram" (4 4 2044) encryptFunction decryptFunction (("user1" "con" (4 4 2044) () () () () ())) () ()) "user1" "con" post)(set_fecha 2 4 2045)) (set_publicacion 10 "user1" "foto" '() '(4 5 2045) '()))










|#