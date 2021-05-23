#lang racket
;TDA Tiempo
;Fecha
;hora

; ///// Constructor /////

#|
 Descripción: Constructor fecha
 Dominio: int x int x int
 Recorrido: list
|#
(define (set_fecha dia mes ano)
  (if (and (integer? dia) (integer? mes) (integer? ano))
      (if (and (<= dia 31) (> dia 0))
          (if (and (<= mes 12) (> mes 0))
              (if (and (>= ano 2021) (< ano 2050))
                  (list dia mes ano)
                  null
                  )
              null
              )
          null
          )
      null
      )
  )

#|
 Descripción: Constructor hora
 Dominio: int x int 
 Recorrido: list
|#
(define (set_hora horas minutos ano)
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
 Descripción: Selecciona el dia de la fecha
 Dominio: list
 Recorrido: int
|#
(define (get_dia fecha)
  (if (= 3 (length fecha))
      (car fecha)
      null
      )
  )


#|
 Descripción: Selecciona el mes de la fecha
 Dominio: list
 Recorrido: int
|#
(define (get_mes fecha)
  (if (= 3 (length fecha))
      (car (cdr fecha))
      null
      )
  )


#|
 Descripción: Selecciona el año de la fecha
 Dominio: list
 Recorrido: int
|#
(define (get_ano fecha)
  (if (= 3 (length fecha))
      (car (cdr (cdr fecha)))
      null
      )
  )

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
 Descripción: Función que verifica si corresponde a un dia
 Dominio: list
 Recorrido: bool
|#
(define (dia? fecha)
  (if (and (integer? (get_dia fecha)) (> (get_dia fecha) 0) (<= (get_dia fecha) 31))
      #t
      #f
      )
  )


#|
 Descripción: Función que verifica si corresponde a un mes
 Dominio: list
 Recorrido: bool
|#
(define (mes? fecha)
  (if (and (integer? (get_mes fecha)) (> (get_mes fecha) 0) (<= (get_mes fecha) 12))
      #t
      #f
      )
  )


#|
 Descripción: Función que verifica si corresponde a un año
 Dominio: list
 Recorrido: bool
|#
(define (ano? fecha)
  (if (and (integer? (get_ano fecha)) (>= (get_ano fecha) 2021) (< (get_ano fecha) 2050))
      #t
      #f
      )
  )


#|
 Descripción: Función que verifica si corresponde a una fecha 
 Dominio: list
 Recorrido: bool
|#
(define (fecha? fecha)
  (if (null? fecha)
      #t
      (if (and (dia? fecha) (mes? fecha) (ano? fecha))
          #t
          #f
          )
      )
  )


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
  (if (and (integer? (get_mes hora)) (>= (get_mes hora) 0) (< (get_mes hora) 60))
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


(provide (all-defined-out)) ;exporta todas las funciones de este archivo, debe ir al final