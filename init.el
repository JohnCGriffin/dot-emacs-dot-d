
;; GLOBALS

(setq make-backup-files nil
      auto-save-default nil
      inhibit-startup-screen t
      ring-bell-function 'ignore
      tab-width 4
      c-base-indent 4
      c-basic-offset 4
      indent-tabs-mode nil)

(menu-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; PACKAGE Setup should be run only when needed

(defun package-JCGs-init ()
  (interactive)
  (require 'package)
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.org/packages/"))
  (package-initialize)
  (message "melpa added and package-initialize called"))



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

(load-theme 'misterioso t)
