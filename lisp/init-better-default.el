(global-auto-revert-mode t)
(global-linum-mode 1)
(setq make-backup-files nil) ;; 关闭自动备份文件
(delete-selection-mode 1)
(setq auto-save-default nil) ;; 关闭自动保存文件
(setq ring-bell-function 'ignore) ;;关闭警告音
(fset 'yes-or-no-p 'y-or-n-p)
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

;; 将光标移动到新创建的窗口中
(require 'popwin)
(popwin-mode 1)

(provide 'init-better-default)
