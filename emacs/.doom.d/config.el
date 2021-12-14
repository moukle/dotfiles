;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Moritz Klein"
      user-mail-address "moritz.klein@pm.me")

(setq org-directory "~/org/")
(setq display-line-numbers-type 'visual)

;;
;;; UI
;; nano theme
(use-package! nano-theme
  :hook (
         (after-init . nano-light)
         (after-init . doom/reload-font))
  :config
  (setq default-frame-alist
        (append (list
                 '(min-height . 1)  '(height . 45)
                 '(min-width  . 1)  '(width  . 81)
                 '(vertical-scroll-bars . nil)
                 '(internal-border-width . 24)
                 '(left-fringe . 0)
                 '(right-fringe . 0)
                 '(tool-bar-lines . 0)
                 '(menu-bar-lines . 0)))))
(use-package! nano-modeline :hook (after-init . nano-modeline-mode))

;; Dim inactive windows
(use-package dimmer
  :hook (after-init . dimmer-mode)
  :config
  (setq dimmer-fraction 0.5)
  (setq dimmer-adjustment-mode :foreground)
  (setq dimmer-use-colorspace :rgb)
  (setq dimmer-watch-frame-focus-events nil)
  (dimmer-configure-which-key)
  (dimmer-configure-magit)
  (dimmer-configure-posframe))

;; font
;; (setq doom-font (font-spec :family "Cascadia Code" :size 20)
;;       doom-big-font (font-spec :family "Cascadia Code" :size 25)
;;       doom-variable-pitch-font (font-spec :family "SF Pro Text")
;;       doom-unicode-font (font-spec :family "DejaVu Math TeX Gyre"))

(setq doom-font (font-spec :family "Liga SFMono Nerd Font" :size 20)
      doom-big-font (font-spec :family "Liga SFMono Nerd Font" :size 25)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 20)
      doom-unicode-font (font-spec :family "Liga SFMono Nerd Font")
      doom-serif-font (font-spec :family "Fira Sans" :size 20))


;; dashboard
(setq fancy-splash-image (concat doom-private-dir "splash.png"))
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

;;
;;; Mail
(set-email-account! "Klein.TU"
  '((mu4e-sent-folder       . "/Tumail/Sent Mail")
    (mu4e-drafts-folder     . "/Tumail/Drafts")
    (mu4e-trash-folder      . "/Tumail/Trash")
    (mu4e-refile-folder     . "/Tumail/All Mail")
    (user-mail-address . "moritz.klein@stud.tu-darmstadt.de")
    (mu4e-compose-signature . "---\nMoritz Klein"))
  t)


;;
;;; Modules

;; Quickrun
(setq quickrun-timeout-seconds nil)

;; Switch to the new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;;
;;; org
;;;

(use-package! mixed-pitch
  :hook (org-mode . mixed-pitch-mode)
  :config
  (setq mixed-pitch-set-heigth t)
  (set-face-attribute 'variable-pitch nil :height 1.3))

(use-package! org-fragtog
  :hook (org-mode . org-fragtog-mode)
  :config
  (setq org-download-image-dir "./images")
  (plist-put org-format-latex-options :foreground (nth 1 (nth 11 doom-themes--colors))) ;; HACK: really dirty way to get fg
  )

(after! org
  ;; fix color handling in org-preview-latex-fragment
  (let ((dvipng--plist (alist-get 'dvipng org-preview-latex-process-alist)))
    (plist-put dvipng--plist :use-xcolor t)
    (plist-put dvipng--plist :image-converter '("dvipng -D %D -T tight -o %O %f"))))

; (use-package! ob-julia)

;; (setq org-image-actual-width (/ (display-pixel-width) 4))
(setq org-image-actual-width 400)

;; uses the minted package instead of the listings one
(setq org-latex-listings 'minted)

;; defines how to generate the pdf file using lualatex + biber
(setq org-latex-pdf-process
      '("lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "biber %b"
        "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "lualatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("tuda"
                 "\\documentclass[
                        ngerman,
                        accentcolor=9c,% Farbe für Hervorhebungen auf Basis der Deklarationen in den
                        type=intern,
                        marginpar=false
                        ]{tudapub}
                \\usepackage[ngerman]{babel}
                \\usepackage[utf8]{luainputenc}
                \\usepackage{fontspec}
                \\usepackage{polyglossia}
                \\usepackage{dsfont}
                \\setmonofont{DejaVu Sans Mono}[Scale=MatchLowercase]
                \\usepackage{framed}
                \\usepackage[strict]{changepage}
                \\usepackage{minted}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes
               '("tudav"
                 "\\documentclass[
                        vietnamese,
                        accentcolor=9c,% Farbe für Hervorhebungen auf Basis der Deklarationen in den
                        type=intern,
                        marginpar=false
                        ]{tudapub}
                \\usepackage[vietnamese,ngerman]{babel}
                \\usepackage[utf8]{luainputenc}
                \\usepackage{fontspec}
                \\usepackage{polyglossia}
                \\usepackage{lmodern}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  )
