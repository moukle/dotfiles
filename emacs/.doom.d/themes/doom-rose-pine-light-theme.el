;;; doom-rose-pine-light-theme.el --- inspired by Rose Pine Theme -*- no-byte-compile: t; -*-
(require 'doom-themes)

;;
(defgroup doom-rose-pine-light-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-rose-pine-light-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-rose-pine-light-theme
  :type 'boolean)

(defcustom doom-rose-pine-light-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-rose-pine-light-theme
  :type 'boolean)

(defcustom doom-rose-pine-light-comment-bg doom-rose-pine-light-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-rose-pine-light-theme
  :type 'boolean)

(defcustom doom-rose-pine-light-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-rose-pine-light-theme
  :type '(choice integer boolean))

;;
(def-doom-theme doom-rose-pine-light
  "A light theme inspired by Rose Pine Theme"

  ;; (load-file "~/dotfiles/emacs/.doom.d/themes/colors.el")

  ;; name        default   256       16
  ((load-file "~/dotfiles/emacs/.doom.d/themes/colors.el")
   (bg         '("#fefefe" nil       nil            ))
   (bg-alt     '("#eeedea" nil       nil            ))
   (base0      '("#eeedea" "#eeedea" "white"        ))
   (base1      '("#eeedea" "#f2e9de" "brightblack"  ))
   (base2      '("#ece0d0" "#ece0d0" "brightblack"  ))
   (base3      '("#E8DFD4" "#E8DFD4" "brightblack"  ))
   (base4      '("#9893a5" "#9893a5" "brightblack"  ))
   (base5      '("#575279" "#575279" "brightblack"  ))
   (base6      '("#6e6a86" "#6e6a86" "brightblack"  ))
   (base7      '("#393552" "#393552" "brightblack"  ))
   (base8      '("#232136" "black"   "black"        ))
   (fg         '("#575279" "#575279" "black"        ))
   (fg-alt     '("#f2e9de" "#ece0d0" "brightblack"  ))

   (grey       base4)
   (red        '("#b4637a" "#b4637a" "red"          ))
   (orange     '("#d7827e" "#d7827e" "brightred"    ))
   (green      '("#56949f" "#56949f" "green"        ))
   (teal       '("#286983" "#286983" "brightgreen"  ))
   (yellow     '("#ea9d34" "#ea9d34" "yellow"       ))
   (blue       '("#56949f" "#56949f" "brightblue"   ))
   (dark-blue  '("#286983" "#286983" "blue"         ))
   (magenta    '("#907aa9" "#907aa9" "magenta"      ))
   (violet     '("#907aa9" "#907aa9" "brightmagenta"))
   (cyan       '("#56949f" "#56949f" "brightcyan"   ))
   (dark-cyan  '("#31748f" "#31748f" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken base2 0.1))
   (selection      (doom-darken base3 0.1))
   (builtin        magenta)
   (comments       (if doom-rose-pine-light-brighter-comments cyan base4))
   (doc-comments   (doom-darken comments 0.15))
   (constants      violet)
   (functions      magenta)
   (keywords       red)
   (methods        cyan)
   (operators      blue)
   (type           yellow)
   (strings        green)
   (variables      (doom-darken magenta 0.36))
   (numbers        orange)
   (region         `(,(doom-darken (car bg-alt) 0.1) ,@(doom-darken (cdr base0) 0.3)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (-modeline-bright doom-rose-pine-light-brighter-modeline)
   (-modeline-pad
    (when doom-rose-pine-light-padded-modeline
      (if (integerp doom-rose-pine-light-padded-modeline) doom-rose-pine-light-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt (doom-blend violet base4 (if -modeline-bright 0.5 0.2)))

   (modeline-bg
    (if -modeline-bright
        (doom-darken base2 0.05)
      base1))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken base2 0.1)
      base2))
   (modeline-bg-inactive (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(doom-darken (car bg-alt) 0.05) ,@(cdr base1))))

  ;; --- extra faces ------------------------
  ((centaur-tabs-unselected :background bg-alt :foreground base4)
   (font-lock-comment-face
    :foreground comments
    :background (if doom-rose-pine-light-comment-bg base0))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments
    :slant 'italic)

   ((line-number &override) :foreground (doom-lighten base4 0.15))
   ((line-number-current-line &override) :foreground base8)

   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; magit
   (magit-blame-heading     :foreground orange :background bg-alt)
   (magit-diff-removed :foreground (doom-darken red 0.2) :background (doom-blend red bg 0.1))
   (magit-diff-removed-highlight :foreground red :background (doom-blend red bg 0.2) :bold bold)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face     :foreground base5)
   (markdown-header-face     :inherit 'bold :foreground red)
   ((markdown-code-face &override)       :background base1)
   (mmm-default-submode-face :background base1)

   ;; org-mode
   ((outline-1 &override) :foreground red)
   ((outline-2 &override) :foreground orange)
   ((org-block &override) :background base1)
   ((org-block-begin-line &override) :foreground fg :slant 'italic)
   (org-ellipsis :underline nil :background bg     :foreground red)
   ((org-quote &override) :background base1)

   ;; helm
   (helm-candidate-number :background blue :foreground bg)

   ;; selectrum
   (selectrum-current-candidate :background base1)

   ;; web-mode
   (web-mode-current-element-highlight-face :background dark-blue :foreground bg)

   ;; wgrep
   (wgrep-face :background base1)

   ;; ediff
   (ediff-current-diff-A        :foreground red   :background (doom-lighten red 0.8))
   (ediff-current-diff-B        :foreground green :background (doom-lighten green 0.8))
   (ediff-current-diff-C        :foreground blue  :background (doom-lighten blue 0.8))
   (ediff-current-diff-Ancestor :foreground teal  :background (doom-lighten teal 0.8))

   ;; tooltip
   (tooltip :background base1 :foreground fg)

   ;; posframe
   (ivy-posframe               :background base0)

   ;; lsp
   (lsp-ui-doc-background      :background base0)
   (lsp-face-highlight-read    :background (doom-blend red bg 0.3))
   (lsp-face-highlight-textual :inherit 'lsp-face-highlight-read)
   (lsp-face-highlight-write   :inherit 'lsp-face-highlight-read)
   )

  ;; --- extra variables ---------------------
  ()
  )

;;; doom-rose-pine-light-theme.el ends here
