;; 透過
(add-to-list 'default-frame-alist '(alpha . (0.7 0.7)))

;; 行番号/列番号を表示
(line-number-mode t)
(column-number-mode t)
;; 起動時の画面を表示しない
(setq inhibit-startup-screen t)
;; 対応する括弧を強調
(show-paren-mode t)
;; ツールバーを消す
(tool-bar-mode 0)
;;; スクロールバーを表示しない
(scroll-bar-mode -1)

;; タイトルにホスト名を表示
(setq hostname (system-name))
(when (null hostname) (setq hostname "(Unknown Host)"))
(setq hostname (car (split-string hostname "\\.")))
(setq frame-title-format (concat "%b - Emacs @ " hostname))

;;; 行末のスペースを強調表示
(when (boundp 'show-trailing-whitespace)
  (setq-default show-trailing-whitespace t))

;; 文字と背景の色
(set-face-foreground 'default "white")
(set-face-background 'default "black")
(setq frame-background-mode 'dark)
(set-face-foreground 'font-lock-comment-face "OliveDrab2")
(set-face-foreground 'font-lock-variable-name-face "magenta")
(set-face-foreground 'font-lock-keyword-face "violet")
