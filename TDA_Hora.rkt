#lang racket

;TDA Hora
;hora minuto


; ///// Constructor /////

#|
 Descripción: Constructor hora
 Dominio: int x int 
 Recorrido: list
|#
(define (set_hora horas minutos año)
  (if (and (integer? horas) (integer? minutos))
      (if (and (< horas 24) (>= horas 0))
          (if (and (< minutos 60) (>= minutos 0))
              (list horas minutos)
              null
              )
          null
          )
      null
      )
  )


; ///// Selector /////

#|
 Descripción: Selecciona las horas de la hora
 Dominio: list
 Recorrido: int
|#
(define (get_horas hora)
  (if (= 2 (length hora))
      (car hora)
      null
      )
  )


#|
 Descripción: Selecciona los minutos de la hora
 Dominio: list
 Recorrido: int
|#
(define (get_minutos hora)
  (if (= 2 (length hora))
      (car (cdr hora))
      null
      )
  )


; ///// Pertenencia /////


#|
 Descripción: Función que verifica si corresponde a horas
 Dominio: list
 Recorrido: bool
|#
(define (horas? hora)
  (if (and (integer? (get_horas hora)) (>= (get_horas hora) 0) (< (get_horas hora) 24))
      #t
      #f
      )
  )


#|
 Descripción: Función que verifica si corresponde a minutos
 Dominio: list
 Recorrido: bool
|#
(define (minutos? hora)
  (if (and (integer? (get_minutos hora)) (>= (get_minutos hora) 0) (< (get_minutos hora) 60))
      #t
      #f
      )
  )

#|
 Descripción: Función que verifica si corresponde a una hora
 Dominio: list
 Recorrido: bool
|#
(define (hora? hora)
  (if (null? hora)
      #t
      (if (and (horas? hora) (minutos? hora))
          #t
          #f
          )
      )
  )
