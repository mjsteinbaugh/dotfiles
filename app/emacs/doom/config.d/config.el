;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; See also:
;; - https://github.com/hlissner/emacs-doom-themes
;; - https://github.com/haruo31/dot-emacs-d/blob/master/config/doom-modeline.el


;; Install all-the-icons fonts in ~/Library/Fonts.
;; > M-x all-the-icons-install-fonts

(setq doom-font (font-spec :family "SF Mono" :size 16))

(require 'doom-themes)

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

;; > (load-theme 'doom-one t)
;; > (load-theme 'doom-city-lights t)
;; > (load-theme 'doom-nord t)
(load-theme 'doom-dracula t)

;; Enable flashing mode-line on errors.
(doom-themes-visual-bell-config)

;; Enable custom treemacs theme.
(setq doom-themes-treemacs-theme "doom-colors")
(doom-themes-treemacs-config)

;; Enable custom neotree theme.
(doom-themes-neotree-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)
