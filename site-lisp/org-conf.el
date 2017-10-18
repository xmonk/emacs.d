;;; org-conf.el --- Org configuration
;;
;; Filename: org-conf.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Wed Oct 10 15:11:21 2007 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated: Thu May  5 19:10:43 2016 (-0400)
;;           By:
;;     Update #: 120
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

(use-package org
  :ensure t
  :commands org-mode
  :functions jj/find-org-markers
  :init
  (add-hook 'org-mode-hook 'jj/org-mode-hook)
  :config
  (use-package ox-md)

  (defun jj/org-mode-hook()
    (auto-fill-mode 1)
    (flyspell-mode 1)
    (local-set-key "\C-ca" 'org-agenda))

  (setq org-directory "~/.org")
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  (setq org-mobile-directory "~/Dropbox/MobileOrg")
  (setq org-mobile-inbox-for-pull "~/Dropbox/MobileOrg/inbox.org")
  (setq org-mobile-force-id-on-agenda-items nil)
  (setq org-todo-keywords
        '((type "TODO(t)" "STARTED(s)" "WAITING(w)" "APPT(a)" "PENDING(p)" "|"
                "CANCELLED(c)"  "DEFERRED(e)" "DONE(d)")
          (sequence "PROJECT(j)" "|" "FINISHED(f)")
          (sequence "BILLED(b)" "INVOICED(i)" "SENT(n)" "|"
                    "RCVD(r)")))

  (setq org-level-color-stars-only nil)
  (setq org-fontify-emphasized-text t)
  (setq org-hide-leading-stars t)
  (setq org-completion-use-ido t)
  (setq org-log-done 'time)
  (setq org-agenda-start-on-weekday nil)
  (setq org-agenda-ndays 7)
  (setq org-agenda-skip-scheduled-if-done t)
  (setq org-agenda-skip-deadline-if-done t)
  (setq org-agenda-skip-timestamp-if-done t)
  (setq org-agenda-todo-ignore-scheduled t)
  (setq org-agenda-todo-ignore-deadlines t)
  (setq org-agenda-todo-ignore-timestamp t)
  (setq org-agenda-todo-ignore-with-date t)
  (setq org-agenda-start-on-weekday nil) ;; start on current day
  (setq org-upcoming-deadline '(:foreground "blue" :weight bold))

  (setq org-deadline-warning-days 0)
  (setq org-fontify-done-headline t)

  (setq org-agenda-files '("~/.org/personal.org"
                           "~/.org/work.org"))

  ;; org-capture
  (define-key global-map "\C-cr" 'org-capture)
  (setq org-capture-templates
        `(("t" "Tasks" entry (file+headline "~/.org/work.org" "Tasks") "* TODO %^{Task}    %^g\nSCHEDULED: %^t %? \n")
          ("f" "Future Todo" entry (file+headline "~/.org/future-work.org" "Inbox") "* TODO %?\n %i\n %^T\n %a" :prepend t)
          ("j" "Journal" entry (file+datetree "~/.org/journal.org") "* %u %?\n\n" :prepend t)
          ("i" "Idea" entry (file+headline "~/.org/notes.org" "New Ideas") "* %^{Title}\n %i\n %a" :prepend t)
          ("x" "org-capture" entry (file+headline "~/.org/archive/www.org" "Archived Content") "* %^{Title}p: %:description\n\n Source: %U %c\n\n %i")))


  ;; org-babel configuration based on emacs-starter-kit-org.org

  ;; Set default header arguments for the Org-mode blocks used to
  ;; showcase example Org-mode syntax.
  (setq-default org-babel-default-header-args:org '((:results . "raw silent")
                                                    (:exports . "code")))

  (setq-default org-babel-default-header-args:python '((:exports . "code")
                                                       (:tangle  . "yes")))
  (use-package ob-go
    :ensure t
    :defer t)

  ;; load languages.
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((org . t)
     (python . t)
     (perl . t)
     (ruby . t)
     (lisp . t)
     (shell . t)
     (C . t)
     (go . t)
     (emacs-lisp . t)
     (sqlite . t)))

  ;; do not evaluate code on export by default
  (setq org-export-babel-evaluate nil)
  ;; enable prompt-free code running
  (setq org-confirm-babel-evaluate nil)
  (setq org-confirm-elisp-link-function nil)
  (setq org-confirm-shell-link-function nil)
  ;; no extra indentation
  (setq org-src-preserve-indentation nil)
  (setq org-edit-src-content-indentation 0)
  (setq org-startup-with-inline-images "inlineimages")

  ;; set default :results to output
  (setq org-babel-default-header-args
        (cons '(:results . "replace output")
              (assq-delete-all :results org-babel-default-header-args)))

  ;; set default exports to both code and results
  (setq org-babel-default-header-args
        (cons '(:exports . "both")
              (assq-delete-all :exports org-babel-default-header-args)))

  ;; get pydoc in a link [[pydoc:os]], and go [[godoc:os]]
  (setq org-link-abbrev-alist
        '(("pydoc" . "shell:pydoc %s")
          ("godoc" . "shell:godoc %s")))

  ;; The following displays the contents of code blocks in Org-mode files
  ;; using the major-mode of the code.  It also changes the behavior of
  ;; =TAB= to as if it were used in the appropriate major mode.

  (setq org-src-fontify-natively t)
  (setq org-src-tab-acts-natively t)

  ;; add a few more keywords to org easy template
  (setq org-structure-template-alist
        (append org-structure-template-alist
                '(("sh" "#+NAME: ?\n#+BEGIN_SRC sh\n\n#+END_SRC")
                  ("sc" "#+NAME: ?\n#+BEGIN_SRC  :exports code :tangle yes\n\n#+END_SRC")
                  ("py" "#+NAME: ?\n#+BEGIN_SRC python\n\n#+END_SRC")
                  ("go" "#+NAME: ?\n#+BEGIN_SRC go\n\n#+END_SRC")
                  ("n" "#+BEGIN_COMMENT\n?\n#+END_COMMENT" "<comment>\n?\n</comment>")
                  ("nref" "#+NAME: ?\n#+BEGIN_SRC :noweb-ref <name> :tangle no\n\n#+END_SRC")
                  ("ntan" "#+NAME: ?\n#+BEGIN_SRC :noweb tangle :tangle yes\n\n#+END_SRC"))))

  ;; Encrypt all entries before saving
  (use-package org-crypt
    :config
    (org-crypt-use-before-save-magic)
    (setq org-tags-exclude-from-inheritance (quote ("crypt")))
    (setq org-crypt-disable-auto-save nil))

;;; Usefull functions for org-mode.
;;; Taken from irreal.org. Thanks to jcs from  http://irreal.org/blog

  (defun jj/find-org-markers(regexp)
    (occur regexp)
    (pop-to-buffer "*Occur*"))

  (defun jj/find-top-org-headers()
    (interactive)
    (jj/find-org-markers "^\\*[^*]"))

  (defun jj/find-all-org-headers()
    (interactive)
    (jj/find-org-markers "^\\*+"))

  (defun jj/find-org-links()
    (interactive)
    (jj/find-org-markers "\\[\\["))

  (defun jj/find-an-org-header(term)
    (interactive "sSearch Term: ")
    (jj/find-org-markers(concat "^\\*+ .*" term)))

  (defun jj/header-org-mode()
    "Insert header at the top of org file"
    (interactive)
    (save-excursion
      (goto-char (point-min))
      (insert "#+TITLE: " (file-name-nondirectory
                           (file-name-sans-extension(buffer-file-name))) "\n")
      (insert "#+AUTHOR: " (user-full-name) "\n\n")))

  (defun jj/new-org()
    (interactive)
    (let ((name (concat "~/.org/" (read-string "New org file: " "tmp.org"))))
      (find-file "~/.org/_template.org")
      (write-file name)))

  ;; Sort todo-list
  (defun jj/org-sort-todo-list()
    "Sort buffer in todo order."
    (interactive)
    (save-excursion
      (mark-whole-buffer)
      (org-sort-entries nil ?o))
    (org-overview))

  (setq org-refile-use-outline-path "Finished")

  (defun jj/journal-entry()
    " add a new journal entry "
    (interactive)
    (defvar journal-file "~/.org/journal.org")
    (find-file journal-file)
    (goto-char (point-min))
    (org-insert-heading)
    (org-insert-time-stamp (current-time) nil t)
    (open-line 2)
    (insert " "))

  (defun jj/org-refile-done()
    (interactive)
    (goto-char (point-min))
    (re-search-forward "DONE")
    (if (match-beginning 0)
        (let ((org-refile-targets '((nil :maxlevel . 5))))
          (org-refile nil (current-buffer))))))

(provide 'org-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; org-conf.el ends here
