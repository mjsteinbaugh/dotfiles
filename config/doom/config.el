;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Dracula colors.
(require 'doom-themes)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
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
