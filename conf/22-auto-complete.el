;;;; auto-complete
;;;; (package-install 'auto-complete)
;;; configuration
(use-package auto-complete-config
  :bind ("M-/" . ac-start)
  :config
  (progn
    (add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/ac-dict")
    (ac-config-default)
    ;;補完キー指定
    (ac-set-trigger-key "TAB")
    ;;ヘルプ画面が出るまでの時間（秒）
    (setq ac-quick-help-delay 0)
    ;; C-n/C-p で候補を選択
    (define-key ac-complete-mode-map "\C-n" 'ac-next)
    (define-key ac-complete-mode-map "\C-p" 'ac-previous)
    (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
    (add-hook 'auto-complete-mode-hook 'ac-common-setup)
    (add-to-list 'ac-modes 'objc-mode) ;objc
    (global-auto-complete-mode t)))

;;; auto-complete-clang-async 用の設定
;;; https://github.com/Golevka/emacs-clang-complete-async
(defun my-ac-cc-mode-setup ()
  ; 環境に応じて適宜書き替え
  (setq ac-clang-complete-executable
	"~/.emacs.d/site-lisp/emacs-clang-complete-async/clang-complete")
  (setenv "DYLD_FALLBACK_LIBRARY_PATH" "/usr/local/lib/llvm-3.5/lib")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process))


;;; emacs-jedi (py)
;;; http://d.hatena.ne.jp/n-channel/20131220/1387551080
;;; (package-install 'jedi)
(use-package jedi
  :config
  (progn
    (add-hook 'python-mode-hook 'jedi:setup)
    (setq jedi:complete-on-dot t)))


;;; ac-ispell
;;; (package-install 'ac-ispell)
(custom-set-variables
  '(ac-ispell-requires 3)
  '(ac-ispell-fuzzy-limit 2))
(eval-after-load "auto-complete"
  '(progn
      (ac-ispell-setup)))
(add-hook 'text-mode-hook 'ac-ispell-ac-setup)
