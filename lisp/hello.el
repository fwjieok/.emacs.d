#!/usr/local/bin/emacs --script
;; find your emacs with : "which emacs" and set to the first line
(princ "This is message to stdout\n")
(message "This is err message to stderr")
(setq args command-line-args)
(princ (format "\nread command line with variable : %s\n" args))

(princ "\nenum arguments with car\n")
(setq i 0)
(while (setq arg (car args))
  (princ (format "arg[%d] = %s\n" i arg))
  (setq args (cdr args))
  (setq i (1+ i)))

(princ "\nenum arguments with nth\n")
(setq args command-line-args)
(setq i 0)
(while (setq arg (nth i args))
  (princ (format "arg[%d] = %s\n" i arg))
  (setq i (1+ i)))


(princ "\nrun shell command with shell-command-to-string\n")
(setq ret (shell-command-to-string "date"))
(princ (format "shell execute result = %s" ret))


(princ "\nstart speed test\n")

(setq num 0)
(setq total 0)
(setq start (current-time))
(while (<= num 10000000)
  (setq total (+ total num))
  (setq num (+ num 1))
  )
(setq end (current-time))
(princ (shell-command-to-string "date"))
(setq cost (- (nth 1 end) (nth 1 start)))
(princ (format "loop for %d times cost %d s\n" num cost))
(princ (format "speed = %d loops/s\n" (/ num cost)))

