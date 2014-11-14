;;;; flyspell
(when (executable-find "aspell")
  (use-package flyspell
    :bind ("C-\\" . flyspell-auto-correct-word)
    :config
    (progn
      (setq-default ispell-program-name "aspell")
      (add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))))


;;;; ginger
;;;; (package-install 'request)
;;; ginger-api.el
;; (auto-install-from-gist "https://gist.github.com/syohex/5457732")
(load-library "ginger-api")
;;; ginger-rephrase-api.el
;; (auto-install-from-gist "https://gist.github.com/ShingoFukuyama/7349439")
(load-library "ginger-rephrase-api")
