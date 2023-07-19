;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Personal
(setq user-full-name "Moritz Klein"
      user-mail-address "moritz.klein@pm.me")

;; Theming
(setq doom-font (font-spec :family "Liga SFMonoNerdFont" :size 20) ;; :weight 'semi-bold)
      doom-variable-pitch-font (font-spec :family "Liga SFMonoNerdFont" :size 20 :weight 'semi-bold))

;; Nano
(setq doom-theme 'doom-nano-light)

(use-package! doom-nano-modeline
  :config
  (doom-nano-modeline-mode 1)
  (global-hide-mode-line-mode 1))

;; Line numbers
(setq display-line-numbers-type 'visual)

(setq org-directory "~/org/")


;; Quickrun
(setq quickrun-timeout-seconds nil)

;; Switch to the new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)
