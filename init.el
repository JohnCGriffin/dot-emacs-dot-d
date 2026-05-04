
;;(progn ;for vterm installation
;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (package-initialize))



;; Show full backtraces during init
(setq debug-on-error t)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq debug-on-error nil)))

(setq use-package-always-ensure t)
(setq use-package-verbose t)

;(prefer-coding-system 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8-unix)


					; general editing
(progn

  (menu-bar-mode -1)

  (unless (or (display-graphic-p)
	      (getenv "TMUX"))
    (when (string-match "xterm" (tty-type))
      (set-display-table-slot standard-display-table 'vertical-border (make-glyph-code ?│))
      (mouse-wheel-mode 1)
      (xterm-mouse-mode 1)))

  (load-theme 'wombat)

  (fset 'yes-or-no-p 'y-or-n-p)

  (setq make-backup-files nil
	auto-save-default nil
	inhibit-startup-screen t
	visible-bell t
	tab-width 4
	indent-tabs-mode nil)

  (global-set-key [remap list-buffers] 'ibuffer)
  (put 'upcase-region 'disabled nil)
  (put 'downcase-region 'disabled nil))


					; programming
(progn 

  (setq c-base-indent 4
	c-basic-offset 4
	python-indent-offset 4
	python-indent-guess-indent-offset t
	python-indent-guess-indent-offset-verbose nil)

  (setq eglot-hooks
	'(c-mode-hook
	  go-mode-hook
	  c++-mode-hook
	  python-mode-hook
	  rust-mode-hook
	  c-or-c++-mode-hook
	  racket-mode
	  ))

  (dolist (sym eglot-hooks)
    (add-hook sym 'eglot-ensure)
    (add-hook sym 'company-mode))

  (add-hook 'eglot-managed-mode-hook
	    (lambda () (eglot-inlay-hints-mode -1))))




;; (defun my/indent-or-format-region (beg end)
;;   "Use eglot-format or eglot-format-buffer if available, else indent-region."
;;   (interactive "r")
;;   (if (and (bound-and-true-p eglot--managed-mode)
;;            (eglot-current-server))
;;       (if (use-region-p)
;;           (eglot-format beg end)       ;; format just the region
;;         (eglot-format-buffer))         ;; or whole buffer if no region
;;     (indent-region beg end)))

;; ;; Replace the default binding of C-M-\
;; (global-set-key [remap indent-region] #'my/indent-or-format-region)

					;(xterm-mouse-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company eglot eldoc geiser-chicken go-mode haskell-mode racket-mode
	     rust-mode vterm yasnippet-classic-snippets
	     yasnippet-snippets)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
