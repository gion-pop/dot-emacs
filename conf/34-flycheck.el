(eval-when-compile (progn (package-initialize) (require 'use-package)))

(use-package flycheck
  :ensure flycheck
  :ensure flycheck-pos-tip
  :bind (("M-n" . flycheck-next-error)
	 ("M-p" . flycheck-previous-error))
  :config
  (progn
    (add-hook 'after-init-hook #'global-flycheck-mode)
    (custom-set-variables
     '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))
