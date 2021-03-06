;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-9) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))

(define (interpret-as-number in)
  (cond [(string? in) (string-length in)]
        [(image? in) (* (image-width in) (image-height in))]
        [(number? in) (if (> in 0) (- in 1) in)]
        [(boolean? in) (if (boolean=? in #true) 10 20)]
        [else "The provided expression can't be interpreted as a number."]))
