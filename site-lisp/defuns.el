;;; defuns.el ---  Generic macros and functions. -*- lexical-binding: t; -*-
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

(require 'dired)

(eval-when-compile
  (require 'cl-lib))

(defun jj/compile-config()
  "Compile `.el` file in `SITE-LISP`."
  (interactive)
  (byte-recompile-directory (concat user-emacs-directory "/site-lisp") 0))

(defun jj/create-scratch-buffer()
  "Create a scratch buffer."
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (and (emacs-lisp-mode) (lisp-interaction-mode)))

(defun new-vbuffer (name)
  "Create a new virtual buffer with `NAME`."
  (interactive "sBuffer name: ")
  (switch-to-buffer (get-buffer-create name)))

(defun buffer-abspath ()
  "Print the absolute path of the current buffer."
  (interactive)
  (princ (format "%s" (buffer-file-name))))

(defun buffer-dirpath ()
  "Print the directory path of the current buffer."
  (interactive)
  (princ (format "%s" (file-name-directory (expand-file-name (buffer-name))))))

(defun jj/immortal-scratch-buffer()
  "Don't allow the scratch buffer to be kill."
  (if (equal (buffer-name (current-buffer)) "*scratch*")
      (progn
        (delete-region (point-min) (point-max))
        nil)
    t))

(defun jj/smart-split-helper(w)
  "Helper function to split a given window `W` into two, the first of which has 80 columns."
  (if (> (window-width w) (* 2 81))
      (let ((w2 (split-window w 82 t)))
        (jj/smart-split-helper w2))))

(defun jj/smart-split()
  "Split the frame into 80-column sub-windows, and make sure no window has fewer than 80 columns."
  (interactive)
  (jj/smart-split-helper nil))

;; Insert a shebang to the beginning of buffer.
(defun jj/insert-shebang(arg)
  "Insert the `ARG` you specify in it's proper location."
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
  "Move current line N (1) lines up leaving point in place."
  (interactive "p")
  (jj/move-line (if (null n) -1 (- n))))

(defun jj/move-line-down(n)
  "Move current line N (1) lines down leaving point in place."
  (interactive "p")
  (jj/move-line (if (null n) 1 n)))

(defadvice load-theme (before clear-previous-themes activate)
  "Clear existing theme settings instead of layering them"
  (mapc #'disable-theme custom-enabled-themes))

;; Help find-file-at-point understand: `file:linenumber` and do the right thing.
(defvar ffap-file-at-point-line-number nil
  "Variable to hold line number from the last `ffap-file-at-point' call.")

(defadvice ffap-file-at-point (after ffap-store-line-number activate)
  "Search function `ffap-string-at-point' for a line number pattern and save it in `ffap-file-at-point-line-number' variable."
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
(defun find-file--line-number (orig-fun filename &optional wildcards)
  "Turn files like file.cpp:14 into file.cpp and going to the 14-th line."
  (save-match-data
    (let* ((matched (string-match "^\\(.*\\):\\([0-9]+\\):?$" filename))
           (line-number (and matched
                             (match-string 2 filename)
                             (string-to-number (match-string 2 filename))))
           (filename (if matched (match-string 1 filename) filename)))
      (apply orig-fun (list filename wildcards))
      (when line-number
        ;; goto-line is for interactive use
        (goto-char (point-min))
        (forward-line (1- line-number))))))
(advice-add 'find-file :around #'find-file--line-number)

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

(defadvice transpose-words (before jj/transpose-words activate compile)
  "Transpose last two words when at end of line."
  (if (looking-at "$")
      (backward-word 1)))

(defadvice he-substitute-string (after he-paredit-fix)
  "Remove extra paren when expanding line in paredit."
  (if (and paredit-mode (equal (substring str -1) ")"))
      (progn (backward-delete-char 1) (forward-char))))

;; Match beginning.
(defun jj/goto-match-beginning()
  "Backtrack to the match at the beginning."
  (when isearch-forward (goto-char isearch-other-end)))

;; Vi does this, now emacs does too, insert a new line no matter where you are.
(defun jj/vi-open-previous-line(n)
  "Insert a new line above the current line.  With argument N insert N new lines."
  (interactive "p")
  (save-excursion
    (beginning-of-line)
    (open-line n)
    (indent-according-to-mode)))

(defun jj/vi-open-next-line(n)
  "Move to the next line (like vi) and open a line.  With argument N insert N new lines."
  (interactive "p")
  (save-excursion
    (end-of-line)
    (open-line n)
    (forward-line 1)
    (indent-according-to-mode)))

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
    (let ((string (read-from-minibuffer "Shell command on region: " nil nil nil
										'shell-command-history)))
      (shell-command-on-region (region-beginning) (region-end) string -1)
      ;; Get rid of final newline cause I normally did by hand anyway.
      (delete-char -1))))

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
(defun jj/insert-path(path)
  "Insert the specified PATH to the current buffer."
  (interactive "FPath: ")
  (insert (expand-file-name path)))

;;  Never understood why Emacs doesn't have this function.
(defun jj/rename-file-and-buffer(new-name)
  "Rename both the current buffer and file it's visiting to NEW-NAME."
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
  "Move both the current buffer and file it's visiting to DIR."
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
  "Kill buried buffers, except special buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (or (eql buffer (current-buffer)) (not (buffer-file-name buffer)))
      (kill-buffer buffer))))

;; Copied from Miguel de Icaza's config.
(defun jj/swap-window()
  "Swap windows place."
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
  "Kill buffer without confirmation."
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
(defun insert-document-info(info)
  "Insert title, author INFO, and date modified."
  (interactive "*sTitle and author: ")
  (if info
      (insert info "\nLast modified: "
              (format-time-string "%d/%m %Y (%H:%M:%S)"))))

(defun dos-unix()
  "Convert file from dos to unix."
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

(defun unix-dos()
  "Convert file from unix termination to dos."
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t)
    (replace-match "\r\n")))

;; X-Specific options

;; Insert text from clipboard.
(defun x-insert-selection()
  "Insert text from clipboard to current buffer."
  (interactive)
  (insert(gui-get-selection 'CLIPBOARD)))

;; Get rid of that annoying prompt that requires one to type in YES and then press the enter key to
;; confirm.
(defun yes-or-no-p(PROMPT)
  "Modify default PROMPT."
  (beep)
  (y-or-n-p PROMPT))

;; Auto compile .emacs
(defun compile-init-file()
  "Compile init file."
  (let ((byte-compile-warnings '(unresolved)))
    (byte-compile-file user-init-file)
    (message "Emacs init file saved and compiled.")))

(defun jj/refresh-init-elc()
  "Recompile init file."
  (if (file-newer-than-file-p (concat user-emacs-directory "init.el")
                              (concat user-emacs-directory "init.elc"))
      (byte-compile-file (concat user-emacs-directory "init.el")))
  (byte-recompile-directory (concat user-emacs-directory "/site-lisp")) 0)

(defun jj/clear-buffers ()
  "Kill all buffers, asking permission on unmodified ones."
  (interactive)
  (let ((list (buffer-list)))
    (while list
      (let* ((buffer (car list))
             (name (buffer-name buffer)))
        (and (not (string-equal name "*shell*"))
             (not (string-equal name "*Org Agenda*"))
             (not (string-match "\.org" name))
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
  "Print message at point in the minibuffer."
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))

(defun jj/swap(win)
  "Swap WIN used by jj/ido-jump-to-window."
  (if (cdr win)
      (cons (cadr win) (cons (car win) (cddr win)))
    win))

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

(defun jj/pretty-lambdas()
  "Insert lambda instead of the word LAMBDA."
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))

(defun jj/local-comment-auto-fill()
  "Make 'comment-auto-fill-only-comments' file local."
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode t))

(defun jj/add-watchwords()
  "Set watch words."
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
      (shell)
      (delete-other-windows))))

(defun jj/start-or-switch(func buffer-name)
  "Call FUNC if there is no buffer with `BUFFER-NAME` or switch to `BUFFER-NAME`.  Don't clobber current buffer."
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
  "Set EMACS path from the shell."
  (interactive)
  (let ((pshell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" pshell)
    (setq exec-path (split-string pshell path-separator))))

(defmacro jj/goto(func path)
  "Macro to create FUNC which use PATH to jump to that PATH in a dired buffer."
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
  "Jump to previous buffer."
  (interactive)
  (save-excursion
    (previous-buffer)))

(defun jj/next-buffer()
  "Jump to next buffer."
  (interactive)
  (save-excursion
    (next-buffer)))

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
  "Replace FROM-STRING with TO-STRING if found in region."
  (interactive "sReplace: \nsReplace: %s With: ")
  (save-excursion (save-restriction
                    (narrow-to-region (mark) (point))
                    (goto-char (point-min))
                    (while (search-forward from-string nil t)
                      (replace-match to-string nil t)))))

(defun jj/fullscreen (&optional f)
  "Make EMACS frame `F` full screen."
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

(defun init-maxframe()
  "Resize frame on init."
  (let ((px (display-pixel-width))
        (py (display-pixel-height))
		(fx (frame-char-width))
		(fy (frame-char-height))
		tx ty)
    (setq tx (- (/ px fx) 11))
    (setq ty (- (/ py fy) 4))
    (setq initial-frame-alist '((top . 2) (right . 2)))
    (add-to-list 'default-frame-alist (cons 'width tx))
    (add-to-list 'default-frame-alist (cons 'height ty))))

(defun endless/ispell-word-then-abbrev (p)
  "Create an abbrev for it with prefix `P` create local abbrev.
Otherwise it will be global if there's nothing wrong with the
word at point, keep looking for a typo until the beginning of
buffer.  You can skip typos you don't want to fix with `SPC', and
you can abort completely with `C-g'."
  (interactive "P")
  (let (bef aft)
    (save-excursion
      (while (if (setq bef (thing-at-point 'word))
                 ;; Word was corrected or used quit.
                 (if (ispell-word nil 'quiet)
                     nil                ; End the loop.
                   ;; Also end if we reach `bob'.
                   (not (bobp)))
               ;; If there's no word at point, keep looking
               ;; until `bob'.
               (not (bobp)))
        (backward-word))
      (setq aft (thing-at-point 'word)))
    (if (and aft bef (not (equal aft bef)))
        (let ((aft (downcase aft))
              (bef (downcase bef)))
          (define-abbrev
            (if p local-abbrev-table global-abbrev-table)
            bef aft)
          (message "\"%s\" now expands to \"%s\" %sally"
                   bef aft (if p "loc" "glob")))
      (user-error "No typo at or before point"))))

(defun jj/background-mode (arg)
  "Utility function to set the correct background mode.
ARG should be one of: `dark' `light' 'nil'."
  (setq frame-background-mode arg)
  (mapc 'frame-set-background-mode (frame-list)))

(defun jj/pwd ()
  "Prints the current working directory."
  (cadr (split-string (pwd) " ")))

(defun jj/ls_selected_packages ()
  "List of all user selected packages."
  (dolist (p package-selected-packages)
    (princ (format "%s\n" p))))

(defun jj/ls_activated_packages ()
  "List all activated packages."
  (dolist (a (seq-uniq package-activated-list))
    (princ (format "%s\n" a))))

(defun jj/ls_installed_packages ()
  "List all installed packages."
  (dolist (a package-selected-packages)
    (and (package-installed-p a)
         (princ (format "%s\n" a)))))

(defun jj/create-file (file)
  "Create the specified FILE."
  (if (file-exists-p file)
      (user-error "File: %s already exists" file)
    (write-region "" "" file)))

(defun jj/copy-filename ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(defun jj/copy-filename-at-point ()
  "Copy the current buffer file name and line to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (format "%s::%d" (buffer-file-name) (point)))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

;; from http://www.wilfred.me.uk/.emacs.d/init.html#orgb130ee0
(defun beginning-of-line-dwim ()
  "Toggle between moving point to the first non-whitespace character, and the start of the line."
  (interactive)
  (let ((start-position (point)))
    ;; Move to the first non-whitespace character.
    (back-to-indentation)
    ;; If we haven't moved position, go to start of the line.
    (when (= (point) start-position)
      (move-beginning-of-line nil))))

(defun up_emacs ()
  "Update EMACS source tree."
  (interactive)
  (unless (fboundp 'vc-git-pull)
    (require 'vc-git nil t))
  (if (file-directory-p "~/t/emacs")
      (let ((cwd (jj/pwd)))
        (and (cd "~/t/emacs")
             (vc-git-pull nil))
        (cd cwd))))

(provide 'defuns)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; defuns.el ends here
