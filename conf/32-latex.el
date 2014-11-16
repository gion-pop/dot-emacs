;;;; YaTeX (野鳥)----------------------------------
;; yatex-mode を起動させる設定
(setq auto-mode-alist (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

;; 野鳥が置いてある directry の load-path 設定
;; default で load-path が通っている場合は必要ありません
;(setq load-path
;     (cons (expand-file-name
;	     "/usr/local/share/emacs/site-lisp/yatex") load-path))

;; 文章作成時の漢字コードの設定
;; 1 = Shift_JIS, 2 = ISO-2022-JP, 3 = EUC-JP, 4 = UTF-8
;; default は 2
(setq YaTeX-kanji-code 4)

;; LaTeXコマンドの設定
(setq tex-command
      (if (executable-find "ptex2pdf")
	  "ptex2pdf -l -od \"-f ptex-hiragino-pron-04.map\""
	"platex"))
;; YaTeXでのプレビューアコマンドを設定する
;(setq dvi2-command "xdvi")
;; bibtex
(setq bibtex-command "pbibtex")
;; YaTeXでのプリントコマンドをPDF変換に
(setq dviprint-command-format "dvipdfmx %s ")
;; AMS-LaTeX を使用する
(setq YaTeX-use-AMS-LaTeX t)
;; section型補完でミニバッファを使わない
(setq YaTeX-skip-default-reader t)

;; YaTeXでコメントアウト、解除を割り当てる
(add-hook 'yatex-mode-hook
	  '(lambda ()
	     (local-set-key "\C-c\C-c" 'comment-region)
	     (local-set-key "\C-c\C-u" 'uncomment-region)))

;; RefTeXをYaTeXで使えるようにする
(add-hook 'yatex-mode-hook '(lambda () (reftex-mode t)))
;; RefTeXで使うbibファイルの位置を指定する
;(setq reftex-default-bibliography '("~/Library/TeX/bib/papers.bib"))

;;RefTeXに関する設定
(setq reftex-enable-partial-scans t)
(setq reftex-save-parse-info t)
(setq reftex-use-multiple-selection-buffers t)
;;RefTeXにおいて数式の引用を\eqrefにする
(setq reftex-label-alist '((nil ?e nil "~\\eqref{%s}" nil nil)))

;;自動改行を無効
(add-hook 'yatex-mode-hook '(lambda () (setq auto-fill-function nil)))
;---------------------------------(YaTeXここまで)--------

;-----latex-math-preview-----
(autoload 'latex-math-preview-expression "latex-math-preview" nil t)
(autoload 'latex-math-preview-insert-symbol "latex-math-preview" nil t)
(autoload 'latex-math-preview-save-image-file "latex-math-preview" nil t)
(autoload 'latex-math-preview-beamer-frame "latex-math-preview" nil t)
;yatex連携
(add-hook 'yatex-mode-hook
	  '(lambda ()
	     (YaTeX-define-key "p" 'latex-math-preview-expression)
	     (YaTeX-define-key "\C-p" 'latex-math-preview-save-image-file)
	     (YaTeX-define-key "j" 'latex-math-preview-insert-symbol)
	     (YaTeX-define-key "\C-j" 'latex-math-preview-last-symbol-again)
	     (YaTeX-define-key "\C-b" 'latex-math-preview-beamer-frame)))
(setq latex-math-preview-in-math-mode-p-func 'YaTeX-in-math-mode-p)
(setq latex-math-preview-tex-to-png-for-preview '(platex dvipng))
(setq latex-math-preview-tex-to-png-for-save '(platex dvipng))
(setq latex-math-preview-tex-to-eps-for-save '(platex dvips-to-eps))
(setq latex-math-preview-tex-to-ps-for-save '(platex dvips-to-ps))
(setq latex-math-preview-beamer-to-png '(platex dvipdfmx gs-to-png))
;------------------------------

;;; bibtex extension
(setq bibtex-user-optional-fields
      '(("annote" "Personal annotation (ignored)")
	("yomi" "Yomigana")
	("location" "where it is (ignored)")
	("memo" "Memorundum (ignored)")))
