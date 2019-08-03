
;; GLOBALS

(setq MY-FAVORITE-THEME 'moodydarkvim)

(setq make-backup-files nil
      auto-save-default nil
      inhibit-startup-screen t
      ring-bell-function 'ignore
      tab-width 4
      c-base-indent 4
      indent-tabs-mode nil)

(menu-bar-mode -1)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(load-theme MY-FAVORITE-THEME t)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; PACKAGE Setup should be run only when needed

(defun package-JCGs-init ()
  (interactive)
  (require 'package)
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.org/packages/"))
  (package-initialize)
  (message "melpa added and package-initialize called"))

(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist))
(autoload 'utop-minor-mode "utop" "Toplevel for OCaml" t)
(add-hook 'tuareg-mode-hook 'utop-minor-mode)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(setq merlin-use-auto-complete-mode t)
(setq merlin-error-after-save nil)


;; Markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))



;; Google protobuf looks somewhat like C code
(add-to-list 'auto-mode-alist '("\\.proto" . c-mode))


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
	    (flycheck-mode 1)))

;; EDIFF  does not work well with these colors.
;; ediff is good for side-by-side
(add-hook 'ediff-before-setup-hook
	  (lambda ()
	    (disable-theme MY-FAVORITE-THEME)
	    (load-theme 'leuven t)))

(add-hook 'ediff-quit-hook
	  (lambda ()
	    (kill-buffer (format "%s.~master~" (buffer-name (current-buffer))))
	    (delete-other-windows)
	    (enable-theme MY-FAVORITE-THEME)))


;; Ctrl-H z is my personal self-help
(global-set-key (kbd "C-H z") 
		(lambda ()
		  (interactive)
		  (find-file-read-only "~/.emacs.d/NOTES.txt")))

(add-hook 'change-major-mode-hook
   (lambda () (message "")))

(global-set-key (kbd "C-x 8 l") (lambda () (interactive) (insert "λ")))
(global-set-key (kbd "C-x 8 p") (lambda () (interactive) (insert "∝")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b273cc6a1d492660fff886a3cae1f00d5fd2d53b55fb374a21a14afd74fdec92" 
     "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" 
     "346830cc18f4ff0c60553370158e66ade15833cf13b05ae5aa8e84c3138c7880" 
     "a1e99cb36d6235abbe426a0a96fc26c006306f6b9d2a64c2435363350a987b4c" 
     default)))
 '(package-selected-packages
   (quote
    (rust-mode flycheck-rust rjsx-mode yasnippet yasnippet-classic-snippets 
	       simplezen web-mode utop merlin merlin-eldoc elm-mode paredit 
	       yaml-mode tuareg sml-mode slime racket-mode neotree magit 
	       flycheck exec-path-from-shell cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
