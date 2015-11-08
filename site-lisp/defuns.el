;;; defuns.el ---  Generic macros and functions.
;;
;; Filename: defuns.el
;; Description:
;; Author: Juan Fuentes
;; Maintainer:
;; Created: Tue May 24 23:32:35 2011 (-0400)
;; Version:
;; Package-Requires: ()
;; Last-Updated: Sat Apr 18 14:10:06 2015 (-0400)
;;           By:
;;     Update #: 111
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

(eval-when-compile
  (require 'cl-lib))

(defun jj/compile-config()
  (interactive)
  (byte-recompile-directory *site-lisp* 0))

(defun jj/create-scratch-buffer()
  "create a scratch buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (and (emacs-lisp-mode) (lisp-interaction-mode)))

(defun jj/immortal-scratch-buffer()
  "Don't allow the scratch buffer to be kill"
  (if (equal (buffer-name (current-buffer)) "*scratch*")
      (progn
        (delete-region (point-min) (point-max))
        nil)
    t))

(defun jj/smart-split-helper(w)
  "Helper function to split a given window into two, the first of which has
   80 columns."
  (if (> (window-width w) (* 2 81))
      (let ((w2 (split-window w 82 t)))
        (jj/smart-split-helper w2))))

(defun jj/smart-split()
  "Split the frame into 80-column sub-windows, and make sure no
   window has fewer than 80 columns."
  (interactive)
  (jj/smart-split-helper nil))

;; Insert a shebang to the beginning of buffer.
(defun jj/insert-shebang(arg)
  "Inserts the shebang you specify in it's proper location"
  (interactive "sEnter the shebang you want: ")
  (goto-char (point-min))
  (insert (concat arg "\n")))

;; Move lines a la TextMate
(defun jj/move-line(&optional n)
  "Move current line N (1) lines up/down leaving point in place."
  (interactive "p")
  (when (null n)
    (setq n 1))
  (let ((col (current-column)))
    (beginning-of-line)
    (forward-line 1)
    (transpose-lines n)
    (forward-line -1)
    (forward-char col)))

(defun jj/move-line-up(n)
  "Moves current line N (1) lines up leaving point in place."
  (interactive "p")
  (jj/move-line (if (null n) -1 (- n))))

(defun jj/move-line-down(n)
  "Moves current line N (1) lines down leaving point in place."
  (interactive "p")
  (jj/move-line (if (null n) 1 n)))


;; Help find-file-at-point understand: `file:linenumber` and do the right thing.
(defvar ffap-file-at-point-line-number nil
  "Variable to hold line number from the last `ffap-file-at-point' call.")

(defadvice ffap-file-at-point (after ffap-store-line-number activate)
  "Search `ffap-string-at-point' for a line number pattern and save it in `ffap-file-at-point-line-number' variable."
  (let* ((string (ffap-string-at-point)) ;; string/name definition copied from `ffap-string-at-point'
         (name
          (or (condition-case nil
                  (and (not (string-match "//" string)) ; foo.com://bar
                       (substitute-in-file-name string))
                (error nil))
              string))
         (line-number-string
          (and (string-match ":[0-9]+" name)
               (substring name (1+ (match-beginning 0)) (match-end 0))))
         (line-number
          (and line-number-string
               (string-to-number line-number-string))))
    (if (and line-number (> line-number 0))
        (setq ffap-file-at-point-line-number line-number)
      (setq ffap-file-at-point-line-number nil))))

(defadvice find-file-at-point (after ffap-goto-line-number activate)
  "If `ffap-file-at-point-line-number' is non-nil goto this line."
  (when ffap-file-at-point-line-number
    (forward-line (- ffap-file-at-point-line-number 1))
    (setq ffap-file-at-point-line-number nil)))

;; Open files with path:line:col format.
(defadvice find-file (around find-file-line-number (path &optional wildcards) activate)
  "Turn files like file.js:14:10 into file.js and going to line 14, col 10."
  (save-match-data
    (let* ((match (string-match "^\\(.*?\\):\\([0-9]+\\):?\\([0-9]*\\)$" path))
           (line-no (and match
                         (match-string 2 path)
                         (string-to-number (match-string 2 path))))
           (col-no (and match
                        (match-string 3 path)
                        (string-to-number (match-string 3 path))))
           (path (if match (match-string 1 path) path)))
      ad-do-it
      (when line-no
        ;; goto-line is for interactive use
        (goto-char (point-min))
        (forward-line (1- line-no))
        (when (> col-no 0)
          (forward-char (1- col-no)))))))

(defadvice server-visit-files (before parse-numbers-in-lines (files proc &optional nowait) activate)
  "Look for file names like file:line or file:line:position and parse name in such a manner that move to line:position in file."
  (ad-set-arg 0
              (mapcar (lambda (fn)
                        (let ((name (car fn)))
                          (if (string-match "^\\(.*?\\):\\([0-9]+\\)\\(?::\\([0-9]+\\)\\)?$" name)
                              (cons
                               (match-string 1 name)
                               (cons (string-to-number (match-string 2 name))
                                     (string-to-number (or (match-string 3 name) "")))
                               )
                            fn))) files)))

;; Copy or cut the line you are at without having to set the mark.
(defadvice kill-ring-save(before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(defadvice transpose-words (before jj/transpose-words activate compile)
  "Transpose las two words when at end of line."
  (if (looking-at "$")
      (backward-word 1)))

  (defadvice he-substitute-string (after he-paredit-fix)
    "remove extra paren when expanding line in paredit"
    (if (and paredit-mode (equal (substring str -1) ")"))
        (progn (backward-delete-char 1) (forward-char))))

;; Match beginning.
(defun jj/goto-match-beginning()
  "Backtracks to the match at the begining"
  (when isearch-forward (goto-char isearch-other-end)))

;; Vi does this, now emacs does too, insert a new line no matter where you are.
(defun jj/vi-open-previous-line(arg)
  "Inserts a new line above your current line."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (indent-according-to-mode))

(defun jj/vi-open-next-line(arg)
  "Move to the next line (like vi) and then opens a line."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (forward-line 1)
  (indent-according-to-mode))

;; A somewhat insanely powerful trick, evaluate a region via a shell command and replace the region
;; with the resulting output. Normally you would access this command via C-u M-| but since we're
;; trying to optimize things a bit:
(defun custom-shell-command-on-region nil
  "Replace region with ``shell-command-on-region''.
By default, this will make mark active if it is not and then
prompt you for a shell command to run and replaces region with
the results.  This is handy for doing things like getting
external program locations in scripts and running grep and not on
a region."
  (interactive)
  (save-excursion
    (if (equal mark-active nil)
        (push-mark nil nil -1))
    (setq string (read-from-minibuffer "Shell command on region: " nil nil nil
                                       'shell-command-history))
    (shell-command-on-region (region-beginning) (region-end) string -1)
    ;; Get rid of final newline cause I normally did by hand anyway.
    (delete-char -1)))

;; Matching parenthesis using % as in Vi.
(defun jj/match-paren (&optional arg)
  "Go to the matching parenthesis character if one is adjacent to point, takes an optiona ARG."
  (interactive "^p")
  (cond ((looking-at "\\s(") (forward-sexp arg))
        ((looking-back "\\s)" 1) (backward-sexp arg))
        ;; Now, try to succeed from inside of a bracket
        ((looking-at "\\s)") (forward-char) (backward-sexp arg))
        ((looking-back "\\s(" 1) (backward-char) (forward-sexp arg))))

;; Misc functions

;; insert a path into current buffer.
(defun jj/insert-path(file)
  (interactive "FPath: ")
  (insert (expand-file-name file)))

;;  Never understood why Emacs doesn't have this function.
(defun jj/rename-file-and-buffer(new-name)
  "Renames both current buffer and file it's visiting to new-name."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (cond
           ((vc-backend filename) (vc-rename-file filename new-name))
           (t
            (rename-file name new-name 1)
            (rename-buffer new-name)
            (set-visited-file-name new-name)
            (set-buffer-modified-p nil))))))))

;;  Never understood why Emacs doesn't have this function, either.
(defun jj/move-buffer-file(dir)
  "Moves both current buffer and file it's visiting to DIR."
  (interactive "DNew directory: ")
  (let* ((name (buffer-name))
         (filename (buffer-file-name))
         (dir
          (if (string-match dir "\\(?:/\\|\\\\)$")
              (substring dir 0 -1) dir))
         (newname (concat dir "/" name)))

    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (progn
        (copy-file filename newname 1)
        (delete-file filename)
        (set-visited-file-name newname)

        (set-buffer-modified-p nil)
        t))))

(defun jj/delete-buffer-file()
  "Deletes both current buffer and the file it's vistiting."
  (interactive)
  (let ((file (buffer-file-name)))
    (when file
      (if(vc-backend file)
          (vc-delete-file file)
        (progn
          (delete-file file)
          (message "Deleted file %s" file)
          (kill-buffer))))))

(defun jj/kill-other-buffers()
  "kill buried buffers, except for the special buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (or (eql buffer (current-buffer)) (not (buffer-file-name buffer)))
      (kill-buffer buffer))))

;; Copied from Miguel de Icaza's config.
(defun jj/swap-window()
  "swaps windows place"
  (interactive)
  (if (not (one-window-p))
      (let ((first-buffer  0)
            (second-buffer 0))
        (progn
          (setq first-buffer (window-buffer))
          (other-window 1)
          (setq second-buffer (window-buffer))
          (switch-to-buffer first-buffer)
          (other-window 1)
          (switch-to-buffer second-buffer)
          (other-window 1)))))

;; Disable the query when killing a buffer.
(defun jj/kill-buffer()
  "kill buffer without confirmation."
  (interactive)
  (kill-buffer nil))

(defun jj/insert-date()
  "Insert date string into current buffer."
  (interactive)
  (insert (format-time-string "%a %b %d %Y")))

(defun jj/insert-datetime ()
  "Insert time string into current buffer."
  (interactive)
  (insert (current-time-string)))

;; Insert document info
(defun insert-document-info(titleandauthor)
  "Insert title, author, date modified."
  (interactive "*sTitle and author: ")
  (if titleandauthor
      (insert titleandauthor "\nLast modified: "
              (format-time-string "%d/%m %Y (%H:%M:%S)"))))

(defun dos-unix()
  "convert file from dos to unix"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(defun unix-dos()
  "convert file from unix termination to dos"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t)
    (replace-match "\r\n")))

;; X-Specific options

;; Insert text from clipboard.
(defun x-insert-selection()
  (interactive)
  (insert(gui-get-selection 'CLIPBOARD)))

;; Get rid of that annoying prompt that requires one to type in YES and then press the enter key to
;; confirm.
(defun yes-or-no-p(PROMPT)
  (beep)
  (y-or-n-p PROMPT))

;; Auto compile .emacs
(defun compile-init-file()
  (let ((byte-compile-warnings '(unresolved)))
    (byte-compile-file user-init-file)
    (message "Emacs init file saved and compiled.")))

(defun jj/refresh-init-elc()
  (if (file-newer-than-file-p (concat user-emacs-directory "init.el")
                              (concat user-emacs-directory "init.elc"))
      (byte-compile-file (concat user-emacs-directory "init.el")))
  (byte-recompile-directory *site-lisp*) 0)

(defun jj/clear-buffers ()
  "Kill all buffers, asking permission on unmodified ones."
  (interactive)
  (let ((list (buffer-list)))
    (while list
      (let* ((buffer (car list))
             (name (buffer-name buffer)))
        (and (not (string-equal name "*shell*"))
             (not (string-equal name "*Org Agenda*"))
             (not (string-equal name "todo.org"))
             (kill-buffer buffer)))
      (setq list (cdr list))))
  (cd "~/"))

(defun jj/revert-all-buffers()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (not (buffer-modified-p)))
        (revert-buffer t t t) )))
  (message "Refreshed open files."))

(defun jj/flymake-show-help()
  "prints at point message in the minibuffer"
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))

(defun jj/swap(l)
  "Utility function used by jj/ido-jump-to-window"
  (if (cdr l)
      (cons (cadr l) (cons (car l) (cddr l)))
    l))

;; taken and modified from emacswiki.
(defun jj/ido-jump-to-window ()
  "Jump to the selected window."
  (interactive)
  ;; Swaps the current buffer name with the next one along.
  (let* ((visible-buffers
          (jj/swap (mapcar #'(lambda (window)
                               (buffer-name (window-buffer window)))
                           (window-list))))
         (buffer-name (ido-completing-read "Window: " visible-buffers))
         window-of-buffer)
    (if (not (member buffer-name visible-buffers))
        (error "'%s' does not have a visible window" buffer-name)
      (setq window-of-buffer
            (delq nil (mapcar
                       #'(lambda (window)
                           (if (equal buffer-name (buffer-name (window-buffer window)))
                               window
                             nil))
                       (window-list))))
      (select-window (car window-of-buffer)))))

(defun jj/recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(defun jj/pretty-lambdas()
  "Inserts lambda instead of the word lambda"
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))

(defun jj/local-comment-auto-fill()
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode t))

(defun jj/add-watchwords()
  (font-lock-add-keywords
   nil '(("\\<\\(FIXME\\|TODO\\|HACK\\|REFACTOR\\|NOCOMMIT\\|OPTIMIZE\\)"
          1 font-lock-warning-face t))))

(defun jj/esh()
  "Bring up a full-screen eshell or restore previous config."
  (interactive)
  (if (string= "eshell-mode" major-mode)
      (jump-to-register :eshell-fullscreen)
    (progn
      (window-configuration-to-register :eshell-fullscreen)
      (eshell)
      (delete-other-windows))))

(defun jj/term()
  "Bring up a full-screen terminal or restore previous config."
  (interactive)
  (if (string= "term-mode" major-mode)
      (jump-to-register :term-fullscreen)
    (progn
      (window-configuration-to-register :term-fullscreen)
      (if (locate-library "multi-term")
	  (multi-term)
	(term))
      (delete-other-windows))))

(defun jj/start-or-switch(func buffer-name)
  "Call func if there is no buffer with buffer-name, or switch to buffer-name.
   Don't clobber current buffer."
  (if (not (get-buffer buffer-name))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (funcall func))
    (switch-to-buffer-other-window buffer-name)))

;; indenting utility functions taken from http://bit.ly/WWwD11
(defun indent-buffer()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (indent-buffer)
        (message "Indented buffer.")))))

(defun google()
  "Google the selected region if any, display a query prompt otherwise."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (url-hexify-string (if mark-active
                           (buffer-substring (region-beginning) (region-end))
                         (read-string "Google: "))))))

(defun jj/path-from-shell()
  (interactive)
  (let ((pshell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" pshell)
    (setq exec-path (split-string pshell path-separator))))

(defmacro jj/goto(func path)
  "Macro creates func() which uses path to jump to that path in a dired buffer."
  `(defun ,func ()
     (interactive)
     (dired-x-find-file ,path)))

(defun jj/open()
  "Open the current file or dired marked files in external app."
  (interactive)
  (let(doit
       (files
        (cond
         ((string-equal major-mode "dired-mode") (dired-get-marked-files))
         (t (list (buffer-file-name))))))
    (setq doit (if (<= (length files) 5)
                   t
                 (y-or-n-p "Open more than 5 files? ")))
    (when doit
      (cond
       ((string-equal system-type "darwin")
        (mapc (lambda(path) (shell-command-to-string (format "open \"%s\"" path))) files))
       ((string-equal system-type "gnu/linux")
        (mapc (lambda(path) (let ((process-connection-type nil)) (start-process "" nil "xdg-open" path))) files))))))

(defmacro load-after (feature &rest body)
  "Macro that wraps 'eval-after-load.  Where FEATURE is a module variable and BODY is the code."
  (declare (indent 1) (debug t))
  `(eval-after-load ',feature
     '(progn ,@body)))

(defmacro require-if (feature &rest body)
  "Require if FEATURE is installed, and eval BODY if provided."
  (declare (indent t) (debug t))
  `(when (locate-library (symbol-name ,feature))
     (require ,feature nil t)
     ,@body))

(defun load-path-ls ()
  "Prints the 'load-path' variable."
  (interactive)
  (dolist (p load-path)
    (princ (format "%s\n" p))))

(defun exec-path-ls ()
  "Prints the 'exec-path' variable."
  (interactive)
  (dolist (p exec-path)
    (princ (format "%s\n" p))))

;; Automatically save buffers associated with files on buffer switch and on windows switch. Taken
;; from prelude.
(defun jj/auto-save ()
  "Save the current buffer."
  (when (and buffer-file-name
             (buffer-modified-p (current-buffer))
             (file-writable-p buffer-file-name))
    (save-buffer)))

(defmacro advise-commands (advice-name commands &rest body)
  "Generate defadvice for ADVICE-NAME COMMANDS and BODY."
  `(progn
     ,@(mapcar (lambda (command)
                 `(defadvice ,command (before ,(intern (concat (symbol-name command) "-" advice-name)) activate)
                    ,@body))
               commands)))

(defun jj/prev-buffer()
  "Jumps to previous buffer"
  (interactive)
  (previous-buffer))

(defun jj/next-buffer()
  "Jumps to next buffer"
  (interactive)
  (next-buffer))

(defun endless/comment-line-or-region (n)
  "Comment or uncomment current line and leave point after it.
With positive prefix, apply to N lines including current one.
With negative prefix, apply to -N lines above.  If region is
active, apply to active region instead."
  (interactive "p")
  (if (use-region-p)
      (comment-or-uncomment-region
       (region-beginning) (region-end))
    (let ((range
           (list (line-beginning-position)
                 (goto-char (line-end-position n)))))
      (comment-or-uncomment-region
       (apply #'min range)
       (apply #'max range)))
    (forward-line 1)
    (back-to-indentation)))

(defun replace-in-region(from-string to-string)
  "Replaces FROM-STRING with TO-STRING if found in region."
  (interactive "sReplace: \nsReplace: %s With: ")
  (save-excursion (save-restriction
                    (narrow-to-region (mark) (point))
                    (goto-char (point-min))
                    (while (search-forward from-string nil t)
                      (replace-match to-string nil t)))))

  (defun jj/fullscreen (&optional f)
    "make emacs fullscreen"
    (interactive)
    (if (fboundp 'ns-toggle-fullscreen)
        (ns-toggle-fullscreen)
      (set-frame-parameter f 'fullscreen
                           (if (frame-parameter f 'fullscreen)
                               nil
                             'fullboth))))

(defmacro jj/codesearcher (name index)
  "Create a codesearch function of NAME that use INDEX."
  (declare (indent t) (debug t))
  `(defun ,name (pattern file-pattern)
     (interactive
      (list
       (read-string "Pattern: " (thing-at-point 'symbol))
       (read-string "File pattern: " ".*")))
     (and
      (setq codesearch-csearchindex ,index)
      (codesearch-update-index)
      (codesearch-search pattern file-pattern))
     (setq codesearch-csearchindex "~/.csearchindex")))

;; FIXME: Not tested.
;; Projectile + pyenv utility functions.
(defun projectile-pyenv-mode-set ()
  "Set the pyenv based on  the project."
  (pyenv-mode-set (projectile-project-name))
  (unless (eq python-shell-virtualenv-path nil)
    (setenv "PATH" (concat (concat python-shell-virtualenv-path ":") (getenv "PATH")))))

(defun projectile-pyenv-mode-unset ()
  "Unset the pyenv."
  (unless (eq python-shell-virtualenv-path nil)
    (setenv "PATH" (mapconcat 'identity (delete python-shell-virtualenv-path (split-string (getenv "PATH") path-separator)) ":")))
  (pyenv-mode-unset))

(defun init-maxframe()
  "maximize frame on start."
  (let ((px (display-pixel-width))
      (py (display-pixel-height))
      (fx (frame-char-width))
      (fy (frame-char-height))
      tx ty)
  (setq tx (- (/ px fx) 7))
  (setq ty (- (/ py fy) 2))
  (setq initial-frame-alist '((top . 2) (left . 2)))
  (add-to-list 'default-frame-alist (cons 'width tx))
  (add-to-list 'default-frame-alist (cons 'height ty))))

(provide 'defuns)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; defuns.el ends here
