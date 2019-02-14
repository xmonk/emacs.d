(use-package ycmd
  :ensure t
  :commands ycmd-mode
  :diminish (ycmd-mode eldoc-mode)
  :init
  ; Remember to customize this variable for your environment
  (set-variable 'ycmd-server-command `("python3" ,(file-truename "~/.emacs.d/ycmd/ycmd/")))
  (set-variable 'ycmd-gocode-binary-path (file-truename "~/.emacs.d/ycmd/third_party/go/src/github.com/mdempsky/gocode/"))
  (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup))

(use-package company-ycmd
  :ensure t
  :commands company-ycmd
  :config
  (company-ycmd-setup))

(use-package flycheck-ycmd
  :ensure t
  :defer 0.6
  :init
  ;; Make sure the flycheck cache sees the parse results
  (add-hook 'ycmd-file-parse-result-hook 'flycheck-ycmd--cache-parse-results)
  ;; Add the ycmd checker to the list of available checkers
  (add-to-list 'flycheck-checkers 'ycmd)
  (flycheck-ycmd-setup))

(defvar *ycmd-build-command* "python3 build.py --go-completer")

(defun ycmd-build-server ()
  "Build ycmd"
  (interactive)
  (let ((*pwd* (jj/pwd)))
    (and
     (cd (concat user-emacs-directory "/ycmd"))
     (async-shell-command *ycmd-build-command*))
    (cd *pwd*)))

(provide 'ycmd-conf)
