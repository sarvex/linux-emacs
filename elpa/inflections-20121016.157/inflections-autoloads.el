;;; inflections-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "inflections" "inflections.el" (0 0 0 0))
;;; Generated autoloads from inflections.el

(autoload 'singularize-string "inflections" "\


\(fn STR)" nil nil)

(autoload 'pluralize-string "inflections" "\


\(fn STR)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "inflections" '("string=~" "define-inflectors" "inflection-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; inflections-autoloads.el ends here
