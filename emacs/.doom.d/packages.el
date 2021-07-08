;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! org-fragtog)

(package! ob-julia
  :recipe (:host github :repo "nico202/ob-julia"
           :files ("*")))
