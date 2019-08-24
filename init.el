
(require 'package)

(setq package-enable-at-startup nil)
(setq package-archives '(("melpa" . "http://stable.melpa.org/packages/")))
(package-initialize)


;; Conditional installations

(progn

  (defmacro conditional-install (name)
    `(unless (package-installed-p (quote ,name))
       (package-refresh-contents)
       (package-install (quote ,name))))

  (conditional-install markdown-mode)
  (conditional-install flycheck)
  (conditional-install go-mode)
  (conditional-install company)
  (conditional-install company-go))



;; Major mode hooks

(progn
  
  (add-hook 'go-mode-hook
	    (lambda ()
	      (setq-local gofmt-command "goimports")
	      (setq-local company-backends '(company-go))
	      (add-hook 'before-save-hook 'gofmt-before-save nil t)
	      (company-mode)
	      (flycheck-mode 1)
	      (local-set-key (kbd "M->") 'godef-jump)
	      (local-set-key (kbd "M-<") 'pop-tag-mark)))
  ;; C++
  (add-hook 'c++-mode-hook
	    (lambda () 
	      (setq flycheck-clang-language-standard "c++17")
	      (setq flycheck-gcc-language-standard "c++17")
	      (flycheck-mode 1)))

  ;; C
  (add-hook 'c-mode-hook
	    (lambda ()
	      (setq flycheck-clang-language-standard "c11")
	      (setq flycheck-gcc-language-standard "c11")
	      (flycheck-mode 1))))


;; Basics

(progn
  
  (menu-bar-mode -1)
  (add-to-list 'load-path "~/.emacs.d/lisp/")
  (load-theme 'misterioso t)

  (setq make-backup-files nil
	auto-save-default nil
	inhibit-startup-screen t
	ring-bell-function 'ignore
	tab-width 4
	c-base-indent 4
	c-basic-offset 4
	indent-tabs-mode nil))




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (markdown-mode company-go flycheck go-mode use-package))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
