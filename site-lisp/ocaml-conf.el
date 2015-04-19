;;; ocaml-conf.el ---  OCaml configuration
;;
;; Filename: ocaml-conf.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Sun Feb 22 23:19:16 2015 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated: Sat Apr 18 14:13:13 2015 (-0400)
;;           By:
;;     Update #: 42
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
  :ensure t
  :commands tuareg-mode
  :init
  ;; Add opam emacs directory to the load-path
  (dolist (var (car (read-from-string (shell-command-to-string "opam config env --sexp"))))
    (setenv (car var) (cadr var)))
  ;; Update the emacs path
  (setq exec-path (append (parse-colon-path (getenv "PATH"))
                          (list exec-directory)))
  ;; Update the emacs load path
  (add-to-list 'load-path (expand-file-name "../../share/emacs/site-lisp"
                                            (getenv "OCAML_TOPLEVEL_PATH")))
  :config
  (use-package utop
    :ensure t
    :init
    ;; Automatically load utop.el
    (autoload 'utop "utop" "Toplevel for OCaml" t))

  (use-package ocp-indent
    :ensure t
    :config
    (ocp-setup-indent))

  ;; Load merlin-mode
  (use-package merlin
    :ensure t
    :config
    ;; Start merlin on ocaml files
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
    (add-hook 'caml-mode-hook 'merlin-mode t)
    ;; Use opam switch to lookup ocamlmerlin binary
    (setq merlin-command 'opam)
    (setq merlin-use-auto-complete-mode nil)
    (setq merlin-error-after-save t)
    (add-hook 'tuareg-mode-hook 'merlin-mode))

  (setq auto-mode-alist
        (append '(("\\.ml[ily]?$" . tuareg-mode)
                  ("\\.topml$" . tuareg-mode))
                auto-mode-alist))
  (autoload 'utop "utop" "Toplevel for OCaml" t)
  (autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
  (add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer))

(provide 'ocaml-conf)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ocaml-conf.el ends here
