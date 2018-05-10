;;; ocaml-conf.el ---  OCaml configuration
;;
;; Filename: ocaml-conf.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Sun Feb 22 23:19:16 2015 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated: Thu May  5 06:57:18 2016 (-0400)
;;           By:
;;     Update #: 43
;; URL:
;; Doc URL:
;; Keywords:
;; Compatibility:
;;
;;
;;; Commentary:
;;
;;
;;; Change Log:
;;
;;
;;; Code:

(use-package tuareg
  :commands tuareg-mode
  :mode (("\\.ml[ily]?$" . tuareg-mode)
         ("\\.topml$" . tuareg-mode))
  :init
  ;; Update the emacs load path
  (add-to-list 'load-path (expand-file-name "../../share/emacs/site-lisp" (getenv "OCAML_TOPLEVEL_PATH")))
  ;; load tuareg autoloads
  (load "~/.opam/system/share/emacs/site-lisp/tuareg-site-file")
  ;; Add opam emacs directory to the load-path
  (dolist (var (car (read-from-string (shell-command-to-string "opam config env --sexp"))))
    (setenv (car var) (cadr var)))
  ;; Update the emacs path
  (setq exec-path (append (parse-colon-path (getenv "PATH"))
						              (list exec-directory)))
  :config
  (use-package utop
    :after tuareg
    :init
    (add-hook 'tuareg-mode-hook 'utop-minor-mode)
    :config
    ;; Automatically load utop.el
    (autoload 'utop "utop" "Toplevel for OCaml" t)
    (autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
    (setq utop-command "opam config exec -- utop -emacs"))

  (use-package ocp-indent
    :after tuareg
    :config
    (ocp-setup-indent))

  ;; Load merlin-mode
  (use-package merlin
    :after tuareg
    :init
    (add-hook 'tuareg-mode-hook 'merlin-mode)
    (add-hook 'caml-mode-hook 'merlin-mode)
    :config
    (load-after company
      (add-to-list 'company-backends 'merlin-company-backend)
      (setq merlin-use-auto-complete-mode 'easy)
      (add-hook 'merlin-mode-hook 'company-mode)
      (bind-key "C-<tab>" 'company-complete merlin-mode-map))

    ;; Use opam switch to lookup ocamlmerlin binary
    (setq merlin-command 'opam)
    (setq merlin-use-auto-complete-mode nil)))

(provide 'ocaml-conf)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ocaml-conf.el ends here
