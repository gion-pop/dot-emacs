(eval-when-compile (progn (package-initialize) (require 'use-package)))

;;; GCの上限を増やす
(setq gc-cons-threshold (* 100000 gc-cons-threshold))

;;; C-h を backspace に
(keyboard-translate ?\C-h ?\C-?)

;;; make backup files in backup directory
(setq backup-directory-alist
  (cons (cons ".*" (expand-file-name "~/.emacs.d/.backup"))
        backup-directory-alist))
(setq auto-save-file-name-transforms
  `((".*", (expand-file-name "~/.emacs.d/.backup/") t)))

;;; "(yes or no)" を "(y or n)" に
(defalias 'yes-or-no-p 'y-or-n-p)

;;; エコーエリアへの表示を早める
(setq echo-keystrokes 0.1)

;;; ダイアログボックスを使わない
(setq use-dialog-box nil)
(defalias 'message-box 'message)

;;; 置換のキーバインド変更
(bind-key "C-c r" 'query-replace)
(bind-key "C-c R" 'query-replace-regexp)
