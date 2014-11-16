;; Mac 用のフォント設定
(let* ((size 12)
       (jpfont "Hiragino Maru Gothic ProN")
       (asciifont "Monaco")
       (h (* size 10)))
  (set-face-attribute 'default nil :family asciifont :height h)
  (set-fontset-font t 'katakana-jisx0201 jpfont)
  (set-fontset-font t 'japanese-jisx0208 jpfont)
  (set-fontset-font t 'japanese-jisx0212 jpfont)
  (set-fontset-font t 'japanese-jisx0213-1 jpfont)
  (set-fontset-font t 'japanese-jisx0213-2 jpfont)
  (set-fontset-font t '(#x0080 . #x024F) asciifont))
(setq face-font-rescale-alist
      '(("^-apple-hiragino.*" . 1.2)
	(".*-Hiragino Maru Gothic ProN-.*" . 1.2)
	(".*osaka-bold.*" . 1.2)
	(".*osaka-medium.*" . 1.2)
	(".*courier-bold-.*-mac-roman" . 1.0)
	(".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
	(".*monaco-bold-.*-mac-roman" . 0.9)
	("-cdac$" . 1.3)))
;; C-x 5 2 で新しいフレームを作ったときに同じフォントを使う
(setq frame-inherited-parameters '(font tool-bar-lines))
