;;; flycheck-dmd-dub-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "flycheck-dmd-dub" "flycheck-dmd-dub.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from flycheck-dmd-dub.el

(defvar flycheck-dmd-dub-use-cache-p nil "\
Non-nil means that `flycheck-dmd-dub-set-variables' reuses the result of dub describe by using cache file.")

(custom-autoload 'flycheck-dmd-dub-use-cache-p "flycheck-dmd-dub" t)

(autoload 'flycheck-dmd-dub-set-include-path "flycheck-dmd-dub" "\
Set `flycheck-dmd-include-path' from dub info if available.

\(fn)" nil nil)

(autoload 'flycheck-dmd-dub-set-variables "flycheck-dmd-dub" "\
Set all flycheck-dmd variables.
It also outputs the values of `import-paths' and `string-import-paths'
to `fldd--cache-file' to reuse the result of dub describe.

\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "flycheck-dmd-dub" '("fldd--")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; flycheck-dmd-dub-autoloads.el ends here
