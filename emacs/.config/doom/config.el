;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Moritz Klein"
      user-mail-address "moritz.klein@pm.me")

;; font
(setq doom-font (font-spec :family "Liga SFMonoNerdFont" :size 22)
      doom-big-font (font-spec :family "Liga SFMonoNerdFont" :size 25)
      doom-unicode-font (font-spec :family "Liga SFMonoNerdFont")
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 20)
      doom-serif-font (font-spec :family "Fira Sans" :size 20))

(setq display-line-numbers-type 'visual)
(setq org-directory "~/org/")

;; nano emacs
(after! doom-themes
  (load-theme 'doom-nano-light t))

(use-package! doom-nano-modeline
  :config
  (doom-nano-modeline-mode 1)
  (global-hide-mode-line-mode 1))


(setq org-image-actual-width 400)

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
