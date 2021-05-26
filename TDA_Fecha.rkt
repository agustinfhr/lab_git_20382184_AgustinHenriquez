#lang racket
;TDA Fecha
;dia mes año

; ///// Constructor /////



#|
 Descripción: Constructor fecha
 Dominio: int x int x int
 Recorrido: list
|#


(define (set_fecha dia mes año)
  (if (and (integer? dia) (integer? mes) (integer? año))
      (if (and (<= dia 31) (> dia 0))
          (if (and (<= mes 12) (> mes 0))
              (if (and (>= año 2021) (< año 2050))
                  (list dia mes año)
                  null
                  )
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
(define (get_año fecha)
  (if (= 3 (length fecha))
      (car (cdr (cdr fecha)))
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
(define (año? fecha)
  (if (and (integer? (get_año fecha)) (>= (get_año fecha) 2021) (< (get_año fecha) 2050))
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
      (if (and (dia? fecha) (mes? fecha) (año? fecha))
          #t
          #f
          )
      )
  )



(provide (all-defined-out)) ;exporta todas las funciones de este archivo, debe ir al final