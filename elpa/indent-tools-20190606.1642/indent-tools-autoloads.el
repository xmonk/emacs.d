;;; indent-tools-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "indent-tools" "indent-tools.el" (0 0 0 0))
;;; Generated autoloads from indent-tools.el

(autoload 'indent-tools-minor-mode "indent-tools" "\
Navigate, indent and act on blocks delemited by their indentation level.

If called interactively, enable Indent-Tools minor mode if ARG is positive, and
disable it if ARG is zero or negative.  If called from Lisp,
also enable the mode if ARG is omitted or nil, and toggle it
if ARG is `toggle'; disable the mode otherwise.

\\{indent-tools-mode-map}

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "indent-tools" '("hydra-indent-tools" "indent-tools-")))

;;;***

;;;### (autoloads nil "indent-tools-indentation-of" "indent-tools-indentation-of.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from indent-tools-indentation-of.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "indent-tools-indentation-of" '("indent-tools-indentation-of")))

;;;***

;;;### (autoloads nil nil ("indent-tools-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; indent-tools-autoloads.el ends here
