;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Moritz Klein"
      user-mail-address "moritz.klein@pm.me")

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(setq display-line-numbers-type 'visual)


;;
;;; UI

(setq doom-font (font-spec :family "SauceCodePro Nerd Font" :size 22 :weight 'semi-bold)
      doom-variable-pitch-font (font-spec :family "Roboto Slab")
      doom-unicode-font (font-spec :family "DejaVu Math TeX Gyre"))

;; (setq doom-theme 'doom-one
;;       doom-one-padded-modeline t)
;; (setq doom-theme 'doom-flatwhite)
;; (setq doom-theme 'doom-solarized-light)
(setq doom-theme 'doom-rose-pine-light
      doom-rose-pine-light-padded-modeline t)

;;; :ui doom-dashboard
(setq fancy-splash-image (concat doom-private-dir "splash.png"))
;; Hide the menu for as minimalistic a startup screen as possible.
;; (remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

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

;; Switch to the new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)

(use-package! ibus
  :config
  (setq ibus-agent-file-name "~/.emacs.d/.local/straight/repos/ibus/ibus-el-agent"))

;; (with-eval-after-load "ispell"
;;   (setq ispell-program-name "hunspell")
;;   (setq ispell-dictionary "en_GB,de_DE,vi_VN")
;;   ;; ispell-set-spellchecker-params has to be called
;;   ;; before ispell-hunspell-add-multi-dic will work
;;   (ispell-set-spellchecker-params)
;;   (ispell-hunspell-add-multi-dic "en_GB,de_DE,vi_VN"))


;;
;;; org
(use-package! org-fragtog
  :hook (org-mode . org-fragtog-mode)
  :config
  (setq org-download-image-dir "./images")
  (plist-put org-format-latex-options :foreground (nth 1 (nth 11 doom-themes--colors))) ;; HACK: really dirty way to get fg
  )

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
                \\setmonofont{DejaVu Sans Mono}[Scale=MatchLowercase]
                \\usepackage{physics}
                \\usepackage{braket}
                \\usepackage{minted}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  )
