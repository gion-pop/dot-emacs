(eval-when-compile (progn (package-initialize) (require 'use-package)))

;;;; yasnippet
;;;; (package-install yasnippet)
(use-package yasnippet
  :config
  (progn
    (yas-global-mode 1)))


;;;; uniquify - 同名ファイルのバッファ名をわかりやすく
(use-package uniquify
  :config
  (progn
    (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
    (setq uniquify-ignore-buffers-re "*[^*]+*")))


;;;; auto-async-byte-compile
;;;; (package-install 'auto-async-byte-compile)
(use-package auto-async-byte-compile
  :ensure auto-async-byte-compile
  :config
  (progn
    (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)))


;;;; bm - マークをつける
;;;; (package-install 'bm)
(use-package bm
  :ensure bm
  ;; OS X では 既定で M-SPC がシステムにとられるので注意
  :bind (("M-SPC" . bm-toggle)
	 ("M-[" . bm-previous)
	 ("M-]" . bm-next))
  :config
  (progn
    (setq-default bm-buffer-persistence nil)
    (setq-default bm-restore-repository-on-load t)
    (add-hook 'find-file-hooks 'bm-buffer-restore)
    (add-hook 'kill-buffer-hook 'bm-buffer-save)
    (add-hook 'after-save-hook 'bm-buffer-save)
    (add-hook 'after-revert-hook 'bm-buffer-restore)
    (add-hook 'vc-before-checkin-hook 'bm-buffer-save)))


;;;; redo+ - Redo
;;;; (package-install 'redo+)
(use-package redo+
  :bind ("C-\." . redo)
  :config
  (progn
    (setq undo-no-redo t)
    (setq undo-limit 600000)
    (setq undo-strong-limit 900000)))


;;;; col-highlight - 現在桁のハイライト
;;;; (package-install 'col-highlight)
(use-package col-highlight
  :bind ("M-s M-h" . column-highlight-mode)
  :config
  (progn
    ;;  (column-highlight-mode 0)
    ;;  (toggle-highlight-column-when-idle 1)
    ;;  (col-highlight-set-interval 1)
    ))


;;;; hideshow - コードのブロックを折り畳む
;;;; hs-minor-mode を有効にして C-c h(ide)
(use-package hideshow
  :config
  (progn
    (define-key hs-minor-mode-map (kbd "C-c h") 'hs-toggle-hiding)
    (add-hook 'c-mode-common-hook 'hs-minor-mode)
    (add-hook 'emacs-lisp-mode-common-hook 'hs-minor-mode)
    (add-hook 'yatex-mode-hook 'hs-minor-mode)))


;;;; tramp
(use-package tramp
  :config
  (progn
    (setq tramp-default-method "ssh")
    (add-to-list 'tramp-default-proxies-alist
		 '("\\'" "\\`root\\'" "/ssh:%h:"))
    (add-to-list 'tramp-default-proxies-alist
		 '("localhost\\'" "\\`root\\'" nil))
    (add-to-list 'tramp-default-proxies-alist
		 '((concat hostname "\\'") "\\`root\\'" nil))))


;;;; open-junk-file - 使い捨てのファイルを開く
;;;; (package-install 'open-junk-file)
(use-package open-junk-file
  :ensure open-junk-file
  :config
  (progn
    (setq open-junk-file-format "~/tmp/%Y%m%d-%H%M%S_")))


;;;; smartparens - 括弧の補完
;;; http://d.hatena.ne.jp/kiririmode/20131231/p1
(use-package smartparens-config
  :ensure smartparens
  :config
  (progn
    (smartparens-global-mode t)))
