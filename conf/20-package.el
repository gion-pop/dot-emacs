;;;; package.el
(when (require 'package nil t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (package-initialize)
;;; use-package.el
;;; http://rubikitch.com/2014/09/09/use-package/
;;; (package-install use-package)
  (require 'use-package))
