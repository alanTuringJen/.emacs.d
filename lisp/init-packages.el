;; Package configuration
(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                           ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个ELPA镜像

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
		      company
		      which-key
		      swiper
		      counsel
		      zenburn-theme
			  monokai-theme
		      smartparens
		      popwin
			  hungry-delete
		      ) "Default packages")
(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
    (loop for pkg in my/packages
	  when (not (package-installed-p pkg)) do (return nil)
	  finally (return t)))

(unless (my/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg my/packages)
        (when (not (package-installed-p pkg))
	  (package-install pkg))))


;; Theme configuration
(load-theme 'zenburn t)
;; (load-theme 'monokai t)

;; Smartparens configuration
(require 'smartparens-config)
(smartparens-global-mode t)

;; Popwin configuration
(require 'popwin)
(popwin-mode t)

;; Swiper configuration
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; Auto-completation configuration
(global-company-mode 1)

;; Which-key configuration
(require 'which-key)
(which-key-mode)

;; Hungry-delete configuration
(require 'hungry-delete)
(global-hungry-delete-mode)

(provide 'init-packages)
