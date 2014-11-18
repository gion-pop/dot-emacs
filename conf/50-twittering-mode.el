(eval-when-compile (progn (package-initialize) (require 'use-package)))

(use-package twittering-mode
  :ensure twittering-mode
  :config
  (progn
    ;; パスワードを暗号化して保存
    (setq twittering-private-info-file "~/.twittering-mode.gpg")
    (setq twittering-use-master-password t)
    ;; OAuthを使う
    (setq twittering-auth-method 'oauth)
    ;; タイムラインの表示形式
    (setq twittering-status-format
	  (concat "%i %p%s(%S)%RT{ [RT by %s]}\n"
		  "%C{%D %H:%M:%S}\n"
		  "%t\n"
		  (make-string (- (frame-width) 10) ?-)))
    ;; アイコンを表示する
    (setq twittering-icon-mode t)
    ;; アイコンのサイズ（要 GhostScript）
    (setq twittering-convert-fix-size 40)
    ;; TL取得の間隔
    (setq twittering-timer-interval 90)
    ;; 取得するPost数
    (setq twittering-number-of-tweets-on-retrieval 50)
    ;; 起動時に読み込むタイムライン
    (setq twittering-initial-timeline-spec-string '(":replies" ":home"))))
