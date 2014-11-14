;;;; package.el
(when (require 'package nil t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (package-initialize)
;;; use-package.el
;;; http://rubikitch.com/2014/09/09/use-package/
;;; (package-install use-package)
  (require 'use-package))

;;;; auto-install
(use-package auto-install
  :config
  (progn
    ;; set install directory
    (setq auto-install-directory "~/.emacs.d/site-lisp/")
    ;; get elisp name for EmacsWiki
    (auto-install-update-emacswiki-package-name t)
    ;; enable function "install-elisp"
    (auto-install-compatibility-setup)))

;;;; exec-path-from-shell.el
;;;; https://github.com/purcell/exec-path-from-shell
(exec-path-from-shell-initialize)
