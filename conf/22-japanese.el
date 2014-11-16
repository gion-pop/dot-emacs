(eval-when-compile (progn (package-initialize) (require 'use-package)))

;;;; 日本語環境
(set-language-environment "japanese")
(prefer-coding-system 'utf-8)

;;; ddskk
(use-package skk-autoloads
	     :bind ("C-'" . skk-mode)
	     :config
	     (progn
	       (setq skk-user-directory "~/.emacs.d/ddskk/")
	       (require 'skk-setup)))
