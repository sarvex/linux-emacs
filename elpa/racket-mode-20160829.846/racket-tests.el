;;; racket-tests.el --- Major mode for Racket language.

;; Copyright (c) 2013-2016 by Greg Hendershott.

;; License:
;; This is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version. This is distributed in the hope that it will be
;; useful, but without any warranty; without even the implied warranty
;; of merchantability or fitness for a particular purpose. See the GNU
;; General Public License for more details. See
;; http://www.gnu.org/licenses/ for details.

(require 'ert)
(require 'racket-mode)
(require 'edmacro)
(require 'faceup)
(require 'racket-common)

(defconst racket-tests/here-dir (faceup-this-file-directory)
  "The directory this file is located in.")

;;; Utility functions for "integration" testing

(defun racket-tests/type (typing)
  (let ((blink-matching-paren nil)) ;suppress "Matches " messages
    (execute-kbd-macro (string-to-vector typing))
    (redisplay)))

(defun racket-tests/press (binding)
  (racket-tests/type (edmacro-parse-keys binding)))

(defun racket-tests/type&press (typing binding)
  (racket-tests/type typing)
  (racket-tests/press binding))

(defun racket-tests/see-rx (rx)
  (let ((one-second-attempts (if (getenv "TRAVIS_CI")
                                 (* 15 60)
                               30)))
    ;; Although using cl-some like this is weird, cl-loop is weirder IMHO
    (cl-some (lambda (_x)
               (accept-process-output (racket--get-repl-buffer-process) 1)
               (sit-for 0.1)
               (looking-back rx (point-min)))
             (make-list one-second-attempts nil))))

(defun racket-tests/see (str)
  (racket-tests/see-rx (regexp-quote str)))

(defun racket-tests/explain-see (str)
  `(actual . ,(buffer-substring-no-properties
               (max (point-min) (- (point) (length str)))
               (point))))
(put 'racket-tests/see-rx 'ert-explainer #'racket-tests/explain-see)
(put 'racket-tests/see    'ert-explainer #'racket-tests/explain-see)

;;; REPL

(ert-deftest racket-tests/repl ()
  "Start REPL. Confirm we get Welcome message and prompt. Exit REPL."
  (racket-repl)
  (with-current-buffer (get-buffer "*Racket REPL*")
    (let ((tab-always-indent 'complete))
      ;; Welcome
      (should (racket-tests/see-rx (concat "Welcome to Racket v[0-9.]+\n"
                                           (regexp-quote "\uFEFF> "))))
      ;; Completion
      (racket-tests/type&press "with-inp" "TAB")
      (should (racket-tests/see "with-input-from-file"))
      (racket-tests/press "RET")
      (should (racket-tests/see "#<procedure:with-input-from-file>\n\uFEFF> "))
      ;; Multiline expression indent
      (racket-tests/type&press "(if 1" "RET")
      (should (racket-tests/see "(if 1\n      "))
      (racket-tests/type&press "2" "RET")
      (should (racket-tests/see "2\n      "))
      (racket-tests/type&press "3)" "RET")
      (should (racket-tests/see "3)\n2\n\uFEFF> "))
      ;; Exit
      (racket-tests/type&press "(exit)" "RET")
      (should (racket-tests/see "Process Racket REPL finished\n")))))

;;; Indentation

(defun racket-tests/same-indent (file)
  (with-current-buffer (find-file (concat racket-tests/here-dir file))
    (indent-region (point-min) (point-max))
    (let ((ok (not (buffer-modified-p))))
      (revert-buffer t t t)  ;revert in case running ERT interactively
      ok)))

(ert-deftest racket-tests/indent-rkt ()
  "Indentation of example/*.rkt shouldn't change."
  (should (racket-tests/same-indent "example/example.rkt"))
  (should (racket-tests/same-indent "example/indent.rkt")))

;;; Font-lock

(defun racket-tests/same-faceup (file)
  "Test that FILE is fontified as the .faceup file describes.
FILE is interpreted as relative to this source directory."
  (let ((font-lock-maximum-decoration t))
    (faceup-test-font-lock-file 'racket-mode
                                (concat racket-tests/here-dir file))))

(faceup-defexplainer racket-tests/same-faceup)

(ert-deftest racket-tests/font-lock ()
  "Font-lock of example/*.rkt shouldn't change."
  (should (racket-tests/same-faceup "example/indent.rkt"))
  (should (racket-tests/same-faceup "example/example.rkt")))

;;; Smart open bracket

(defun racket-tests/brackets (smartp input expected)
  (with-temp-buffer
    (racket-mode)
    (let ((racket-smart-open-bracket-enable smartp)
          (blink-matching-paren nil)) ;suppress "Matches " messages
      (mapc (lambda (x)
              (cond ((eq x ?\[) (racket-smart-open-bracket))
                    ((eq x ?\]) (racket-insert-closing))
                    (t          (racket--self-insert x))))
            input)
      (equal (buffer-substring-no-properties (point-min) (point-max))
             expected))))

(ert-deftest racket-tests/smart-open-bracket ()
  "Type a `cond` form with `racket-smart-open-bracket-enable' both t and nil.
Also try with `electric-pair-mode' both on and off.

Currently this is really just a regression test for bug #81. This
could be expanded into a series of exhaustive tests of all the
special forms it handles."
  (let ((before "[cond [[f x] #t][else #f]]")
        (after  "(cond [(f x) #t][else #f])")
        (orig-electricp electric-pair-mode))
    (electric-pair-mode -1)
    (should (racket-tests/brackets nil before before))
    (should (racket-tests/brackets t   before after))
    (electric-pair-mode 1)
    (should (racket-tests/brackets nil before before))
    (should (racket-tests/brackets t   before after))
    ;; Restore in case running interactively with ERT
    (electric-pair-mode (if orig-electricp 1 -1))))

(provide 'racket-tests)

;;; racket-tests.el ends here
