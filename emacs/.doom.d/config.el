;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Moritz Klein"
      user-mail-address "moritz.klein@pm.me")

(setq org-directory "~/org")
(setq org-roam-directory "~/roam")
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
(use-package! nano-modeline   :hook (after-init . nano-modeline-mode))
;; (use-package! nano-minibuffer :hook (after-init . nano-minibuffer-mode))

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

;; Svg-Tag-Mode
(use-package! svg-tag-mode
  :commands svg-tag-mode
  :config
  (defconst date-re "[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}")
  (defconst time-re "[0-9]\\{2\\}:[0-9]\\{2\\}")
  (defconst day-re "[A-Za-z]\\{3\\}")

  (defun svg-progress-percent (value)
    (svg-image (svg-lib-concat
                (svg-lib-progress-bar (/ (string-to-number value) 100.0)
                                      nil :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
                (svg-lib-tag (concat value "%")
                             nil :stroke 0 :margin 0)) :ascent 'center))

  (defun svg-progress-count (value)
    (let* ((seq (mapcar #'string-to-number (split-string value "/")))
           (count (float (car seq)))
           (total (float (cadr seq))))
      (svg-image (svg-lib-concat
                  (svg-lib-progress-bar (/ count total) nil
                                        :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
                  (svg-lib-tag value nil
                               :stroke 0 :margin 0)) :ascent 'center)))

  (setq svg-tag-tags
        `((":\\([A-Za-z0-9]+\\)" . ((lambda (tag) (svg-tag-make tag))))
          (":\\([A-Za-z0-9]+[ \-]\\)" . ((lambda (tag) tag)))

          ;; Task priority
          ("\\[#[A-Z]\\]" . ( (lambda (tag)
                                (svg-tag-make tag :face 'org-priority
                                              :beg 2 :end -1 :margin 0))))

          ;; Progress
          ("\\(\\[[0-9]\\{1,3\\}%\\]\\)" . ((lambda (tag)
                                              (svg-progress-percent (substring tag 1 -2)))))
          ("\\(\\[[0-9]+/[0-9]+\\]\\)" . ((lambda (tag)
                                            (svg-progress-count (substring tag 1 -1)))))

          ;; TODO / DONE, etc.
          ("XXX" . ((lambda (tag) (svg-tag-make "XXX" :face 'org-done :margin 0))))
          ("NOTE" . ((lambda (tag) (svg-tag-make "NOTE" :face 'org-done :margin 0))))
          ("DONE" . ((lambda (tag) (svg-tag-make "DONE" :face 'org-done :margin 0))))
          ("TODO" . ((lambda (tag) (svg-tag-make "TODO" :face 'org-todo :inverse t :margin 0))))
          ("HACK" . ((lambda (tag) (svg-tag-make "HACK" :face 'org-todo :inverse t :margin 0))))
          ("OPTIMIZE" . ((lambda (tag) (svg-tag-make "OPTIMIZE" :face 'org-todo :inverse t :margin 0))))
          ("DEPRECATED" . ((lambda (tag) (svg-tag-make "DEPRECATED" :face 'org-todo :inverse t :margin 0))))

          ("\([0-9a-zA-Z]\)" . ((lambda (tag)
                                  (svg-tag-make tag :beg 1 :end -1 :radius 12))))


          ;;citations
          ("\\(\\[cite:@[A-Za-z]+:\\)" . ((lambda (tag)
                                            (svg-tag-make tag
                                                          :inverse t
                                                          :beg 7 :end -1
                                                          :crop-right t))))
          ("\\[cite:@[A-Za-z]+:\\([0-9]+\\]\\)" . ((lambda (tag)
                                                     (svg-tag-make tag
                                                                   :end -1
                                                                   :crop-left t))))


          ;; Active date (without day name, with or without time)
          (,(format "\\(<%s>\\)" date-re) .
           ((lambda (tag)
              (svg-tag-make tag :beg 1 :end -1 :margin 0))))
          (,(format "\\(<%s *\\)%s>" date-re time-re) .
           ((lambda (tag)
              (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0))))
          (,(format "<%s *\\(%s>\\)" date-re time-re) .
           ((lambda (tag)
              (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0))))

          ;; Inactive date  (without day name, with or without time)
          (,(format "\\(\\[%s\\]\\)" date-re) .
           ((lambda (tag)
              (svg-tag-make tag :beg 1 :end -1 :margin 0 :face 'org-date))))
          (,(format "\\(\\[%s *\\)%s\\]" date-re time-re) .
           ((lambda (tag)
              (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0 :face 'org-date))))
          (,(format "\\[%s *\\(%s\\]\\)" date-re time-re) .
           ((lambda (tag)
              (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0 :face 'org-date))))))); SVG-Tag

;; font
(setq doom-font (font-spec :family "Cascadia Code" :size 20)
      doom-big-font (font-spec :family "Cascadia Code" :size 25)
      doom-variable-pitch-font (font-spec :family "SF Pro Text")
      doom-unicode-font (font-spec :family "DejaVu Math TeX Gyre"))

;; (setq doom-font (font-spec :family "Liga SFMono Nerd Font" :size 22)
;;       doom-big-font (font-spec :family "Liga SFMono Nerd Font" :size 25)
;;       doom-variable-pitch-font (font-spec :family "Fira Sans" :size 20)
;;       doom-unicode-font (font-spec :family "Liga SFMono Nerd Font")
;;       doom-serif-font (font-spec :family "Fira Sans" :size 20))


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
  ;; (plist-put org-format-latex-options :foreground (nth 1 (nth 11 doom-themes--colors))) ;; HACK: really dirty way to get fg
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

;; roam-ui
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))
