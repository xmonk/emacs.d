(setq inhibit-startup-message t)
(setq default-directory (expand-file-name "~/"))

(face-spec-set 'default
               '((((type x)) :family "PragmataPro Mono" :pixelsize 100 :foundry "FSD" :slant normal :weight normal :spacing 100 :height 105 :width normal :scalable t)
                 (((type ns)) :family "PragmataPro Mono" :pixelsize 200 :foundry "FSD" :slant normal :weight normal :spacing 100 :height 135 :width normal :scalable t)
                 (t :family :height 100)))

(face-spec-set 'fix-pitch
               '((((type x)) :family "Lucida Grande Mono" :pixelsize 100 :foundry "B&H" :slant normal :weight normal :spacing 100 :height 100 :width normal :scalable t)
                 (((type ns)) :family "Lucida Grande Mono" :pixelsize 200 :foundry "B&H" :slant normal :weight normal :spacing 100 :height 135 :width normal :scalable t)
                 (t :family :height 100)))

(face-spec-set 'variable-pitch
               '((((type x)) :family "Lucida Grande" :pixelsize 100 :foundry "B&H" :slant normal :weight normal :spacing 100 :height 100 :width normal :scalable t)
                 (((type ns)) :family "Lucida Grande" :pixelsize 200 :foundry "B&H" :slant normal :weight normal :spacing 100 :height 135 :width normal :scalable t)
                 (t :family :height 100)))

(setq default-frame-alist '((user-size t)
                            (background "#1d1f21")
                            (foreground "#c5c8c6")))
