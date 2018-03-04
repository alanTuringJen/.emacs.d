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
		      smartparens
		      popwin
			  hungry-delete
			  window-numbering
			  zenburn-theme
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

(load-theme 'zenburn t)

;; Smartparens configuration
(require 'smartparens-config)
(smartparens-global-mode t)

;; Popwin configuration
(require 'popwin)
(popwin-mode t)

;; Swiper configuration
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; Auto-completation configuration
(global-company-mode 1)

;; Which-key configuration
(require 'which-key)
(which-key-mode)

;; Hungry-delete configuration
(require 'hungry-delete)
(global-hungry-delete-mode)

;; Window-numbering configuration
(window-numbering-mode t)

(provide 'init-packages)
