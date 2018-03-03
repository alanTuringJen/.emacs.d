(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(require 'org)
(setq org-src-fontify-natively t)

(provide 'init-org-mode)
