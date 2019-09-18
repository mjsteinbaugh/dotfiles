;; -*- mode: emacs-lisp -*-
;; This file is loaded by Emacs at startup.
;; It must be stored in your home directory.
;; Updated 2019-09-18.
;;
;; This configuration is intended for a minimal ESS installation.
;; Consider using spacemacs instead when managing multiple plugins.
;;
;; Packages ====================================================================
;;
;; Install packages (e.g. from MELPA):
;; > M-x list-packages
;;
;; Press `i' to mark for installation, `u' to unmark, and `x' to perform the
;; installation. Press `RET' to read more about installing and using each
;; package.
;;
;; Refresh and list:
;; > M-x package-refresh-contents
;; > M-x package-list-packages
;;
;; See also:
;; - https://melpa.org/#/getting-started
;;
;; ESS / R =====================================================================
;;
;; Launch R:
;; > M-x R
;;
;; Check ESS version:
;; > M-x ess-version
;;
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(custom-enabled-themes (quote (adwaita)))
 '(diff-switches "-u")
 '(package-selected-packages (quote (ess))))
;; ESS =========================================================================
;; Manual: https://ess.r-project.org/Manual/ess.html
(setq-default
 ;; inferior-R-program-name "/usr/local/bin/R"
 ess-ask-for-ess-directory nil
 ess-eval-visibly-p nil
 ess-language "R"
 inferior-R-args "--no-restore --no-save"
 )
;; See matching pairs of parentheses and other characters.
(setq-default show-paren-delay 0)
(show-paren-mode 1)
;; =============================================================================
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
