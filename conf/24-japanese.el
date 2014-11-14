;;; 日本語環境
(set-language-environment "japanese")
(prefer-coding-system 'utf-8)

(use-package skk-autoloads
	     :bind ("C-'" . skk-mode)
	     :config
	     (progn
	       (setq skk-user-directory "~/.emacs.d/ddskk/")
	       (require 'skk-setup)))
