;;; emacs-eclim-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "ac-emacs-eclim-source" "ac-emacs-eclim-source.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ac-emacs-eclim-source.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ac-emacs-eclim-source" '("ac-emacs-eclim-")))

;;;***

;;;### (autoloads nil "company-emacs-eclim" "company-emacs-eclim.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from company-emacs-eclim.el

(autoload 'company-emacs-eclim-setup "company-emacs-eclim" "\
Convenience function that adds company-emacs-eclim to the list
  of available company backends.

\(fn)" nil nil)

(autoload 'company-emacs-eclim "company-emacs-eclim" "\
`company-mode' back-end for Eclim completion

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "company-emacs-eclim" '("company-emacs-eclim-")))

;;;***

;;;### (autoloads nil "eclim" "eclim.el" (0 0 0 0))
;;; Generated autoloads from eclim.el

(autoload 'eclim/workspace-dir "eclim" "\


\(fn)" nil nil)

(defvar eclim-mode-map (let ((map (make-sparse-keymap))) (define-key map (kbd "M-TAB") 'eclim-complete) map) "\
The keymap used in `eclim-mode'.")

(autoload 'eclim-mode "eclim" "\
An interface to the Eclipse IDE.

\(fn &optional ARG)" t nil)

(defvar global-eclim-mode nil "\
Non-nil if Global Eclim mode is enabled.
See the `global-eclim-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-eclim-mode'.")

(custom-autoload 'global-eclim-mode "eclim" nil)

(autoload 'global-eclim-mode "eclim" "\
Toggle Eclim mode in all buffers.
With prefix ARG, enable Global Eclim mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Eclim mode is enabled in all buffers where
`(lambda nil (ignore-errors (if (and buffer-file-name (eclim--accepted-p buffer-file-name) (eclim--project-dir)) (eclim-mode 1))))' would do it.
See `eclim-mode' for more information on Eclim mode.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eclim" '("eclim" "revert-buffer-keep-history")))

;;;***

;;;### (autoloads nil "eclim-ant" "eclim-ant.el" (0 0 0 0))
;;; Generated autoloads from eclim-ant.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eclim-ant" '("eclim")))

;;;***

;;;### (autoloads nil "eclim-completion" "eclim-completion.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from eclim-completion.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eclim-completion" '("eclim-")))

;;;***

;;;### (autoloads nil "eclim-debug" "eclim-debug.el" (0 0 0 0))
;;; Generated autoloads from eclim-debug.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eclim-debug" '("eclim-")))

;;;***

;;;### (autoloads nil "eclim-java" "eclim-java.el" (0 0 0 0))
;;; Generated autoloads from eclim-java.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eclim-java" '("eclim")))

;;;***

;;;### (autoloads nil "eclim-java-run" "eclim-java-run.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from eclim-java-run.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eclim-java-run" '("eclim-")))

;;;***

;;;### (autoloads nil "eclim-maven" "eclim-maven.el" (0 0 0 0))
;;; Generated autoloads from eclim-maven.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eclim-maven" '("eclim-")))

;;;***

;;;### (autoloads nil "eclim-problems" "eclim-problems.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from eclim-problems.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eclim-problems" '("eclim-")))

;;;***

;;;### (autoloads nil "eclim-project" "eclim-project.el" (0 0 0 0))
;;; Generated autoloads from eclim-project.el

(autoload 'eclim-project-mode "eclim-project" "\
Manage all your eclim projects in one buffer.

\\{eclim-project-mode-map}

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eclim-project" '("eclim")))

;;;***

;;;### (autoloads nil "eclim-scala" "eclim-scala.el" (0 0 0 0))
;;; Generated autoloads from eclim-scala.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eclim-scala" '("eclim-scala-find-declaration")))

;;;***

;;;### (autoloads nil "eclimd" "eclimd.el" (0 0 0 0))
;;; Generated autoloads from eclimd.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eclimd" '("start-eclimd" "stop-eclimd" "wait-eclimd-start" "eclimd-")))

;;;***

;;;### (autoloads nil nil ("emacs-eclim-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; emacs-eclim-autoloads.el ends here
