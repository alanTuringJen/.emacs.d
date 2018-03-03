(setq auto-save-default nil)
(global-auto-revert-mode t)
(global-linum-mode t)
(setq make-backup-files nil)
(delete-selection-mode t)
(setq ring-bell-function 'ignore) ;; 关闭提示音
(fset 'yes-or-no-p 'y-or-n-p)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(provide 'init-better-default)
