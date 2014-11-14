;;; dabbrev-expand - 動的略語展開
(global-set-key (kbd "C-;") 'dabbrev-expand)

;;; hippie-expand - 略語展開・補完を行うコマンドをまとめる
(setq hippie-expand-try-functions-list
  '(
    ;; ファイル名の一部
    try-complete-file-name-partially
    ;; ファイル名全体
    try-complete-file-name
    ;; 静的略語展開
    try-expand-all-abbrevs
    ;; 動的略語展開(カレントバッファ)
    try-expand-dabbrev
    ;; 動的略語展開(全バッファ)
    try-expand-dabbrev-all-buffers
    ;; 動的略語展開(キルリング)
    try-expand-dabbrev-from-kill
    ;; Lispシンボル名の一部
    try-complete-lisp-symbol-partially
    ;; Lispシンボル名全体
    try-complete-lisp-symbol))
(global-set-key (kbd "C-,") 'hippie-expand)
