;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-5) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))

; A program to display a spruce in the interactions area.

(define SCALE 1)

(define TRUNK-SIDE (* 90 SCALE))
(define TRUNK-ANGLE 6)
(define BOTTOM-TRIANGLE-SIDE (* 50 SCALE))
(define BOTTOM-TRIANGLE-ANGLE 100)
(define MID-TRIANGLE-SIDE (* 40 SCALE))
(define MID-TRIANGLE-ANGLE 85)
(define TOP-TRIANGLE-SIDE (* 40 SCALE))
(define TOP-TRIANGLE-ANGLE 50)
(define VERTICAL-OFFSET-BOTTOM (* 20 SCALE))
(define VERTICAL-OFFSET-MID (* 37 SCALE))
(define VERTICAL-OFFSET-TOP (* 54 SCALE))

#| This is how the spruce gets built (each new part overlays the previous):
1. trunk
2. trunk + bottom
3. trunk + bottom + mid
4. trunk + bottom + mid + top |#

(define TRUNK
  (overlay (isosceles-triangle TRUNK-SIDE
                               TRUNK-ANGLE
                               "outline"
                               "black")
           (isosceles-triangle TRUNK-SIDE
                               TRUNK-ANGLE
                               "solid"
                               "peru")))

(define BOTTOM-TRIANGLE-ADDED
  (overlay/align/offset "middle"
                        "bottom"
                        ; triangle + outline
                        (overlay (isosceles-triangle BOTTOM-TRIANGLE-SIDE
                                                     BOTTOM-TRIANGLE-ANGLE
                                                     "outline"
                                                     "black")
                                 (isosceles-triangle BOTTOM-TRIANGLE-SIDE
                                                     BOTTOM-TRIANGLE-ANGLE
                                                     "solid"
                                                     "dark turquoise"))
                        0
                        ; The offset is relative to the anchor point.
                        ; (overlay/align/offset function's second argument)
                        VERTICAL-OFFSET-BOTTOM
                        TRUNK))

(define MID-TRIANGLE-ADDED
  (overlay/align/offset "middle"
                        "bottom"
                        (overlay (isosceles-triangle MID-TRIANGLE-SIDE
                                                     MID-TRIANGLE-ANGLE
                                                     "outline"
                                                     "black")
                                 (isosceles-triangle MID-TRIANGLE-SIDE
                                                     MID-TRIANGLE-ANGLE
                                                     "solid"
                                                     "dark turquoise"))
                        0
                        VERTICAL-OFFSET-MID
                        BOTTOM-TRIANGLE-ADDED))

(define TOP-TRIANGLE-ADDED
  (overlay/align/offset "middle"
                        "bottom"
                        (overlay (isosceles-triangle TOP-TRIANGLE-SIDE
                                                     TOP-TRIANGLE-ANGLE
                                                     "outline"
                                                     "black")
                                 (isosceles-triangle TOP-TRIANGLE-SIDE
                                                     TOP-TRIANGLE-ANGLE
                                                     "solid"
                                                     "dark turquoise"))
                        0
                        VERTICAL-OFFSET-TOP
                        MID-TRIANGLE-ADDED))

(define SPRUCE TOP-TRIANGLE-ADDED)

SPRUCE
