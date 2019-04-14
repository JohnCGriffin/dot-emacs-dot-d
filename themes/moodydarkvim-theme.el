;;; moodydarkvim.el --- custom theme for faces

(deftheme moodydarkvim ; ubuntu 16:04 /usr/share/emacs/24.5/etc/themes
  "This attempts to copy the nice visuals of a vi theme 'moody' seen at
	  	  	http://vimcolors.com/663/moody/dark")

(let ((class '((class color) (min-colors 89))))
  (custom-theme-set-faces

   'moodydarkvim

   `(default ((,class (:foreground "#AEBABA" :background "#0E0E0E"))))
   `(cursor ((,class (:background "thistle"))))
   `(error ((,class (:foreground "salmon1"))))
   `(warning ((,class (:foreground "orange"))))
   `(success ((,class (:foreground "yellow green"))))

   ;; Compilation faces
   `(compilation-mode-line-fail ((,class (:foreground "dark green"))))
   `(compilation-mode-line-run  ((,class (:foreground "dark goldenrod"))))
   `(compilation-mode-line-exit ((,class (:foreground "SpringGreen4"))))

   ;; MODE
   `(mode-line ((,class (:foreground "#AEBABA" :background "gray15"))))
   `(modeline-inactive ((,class (:foreground "black" :background "gray15"))))

   ;; Highlighting faces
   `(highlight ((,class (:foreground "white" :background "dark green"))))
   `(region ((,class (:foreground "white" :background "dark green"))))
   `(secondary-selection ((,class (:background "dark slate gray"))))
   `(isearch ((,class (:foreground "white" :background "dark goldenrod"))))
   `(lazy-highlight ((,class (:background "gray25"))))

   ;; Font lock faces
   `(font-lock-builtin-face ((,class (:foreground "#759ECE"))))
   `(font-lock-comment-face ((,class (:foreground "#3D3D31"))))
   `(font-lock-constant-face ((,class (:foreground "turquoise"))))
   `(font-lock-function-name-face ((,class (:foreground "#45A174"))))
   `(font-lock-keyword-face ((,class (:foreground "#759ECE"))))
   `(font-lock-string-face ((,class (:foreground "#BBBA91"))))
   `(font-lock-type-face ((,class (:foreground "#59B394")))) ;7/8 of mediumturquoise
   `(font-lock-variable-name-face ((,class (:foreground "yellow green"))))

   ;; Button and link faces
   `(link ((,class (:underline t :foreground "cyan"))))
   `(link-visited ((,class (:underline t :foreground "dark cyan"))))

   ;; Gnus faces
   `(gnus-header-content ((,class (:weight normal :foreground "yellow green"))))
   `(gnus-header-from ((,class (:foreground "pale green"))))
   `(gnus-header-subject ((,class (:foreground "pale turquoise"))))
   `(gnus-header-name ((,class (:foreground "dark sea green"))))
   `(gnus-header-newsgroups ((,class (:foreground "dark khaki"))))

   ;; Message faces
   `(message-header-name ((,class (:foreground "dark turquoise"))))
   `(message-header-cc ((,class (:foreground "yellow green"))))
   `(message-header-other ((,class (:foreground "dark khaki"))))
   `(message-header-subject ((,class (:foreground "pale turquoise"))))
   `(message-header-to ((,class (:foreground "pale green"))))
   `(message-cited-text ((,class (:foreground "SpringGreen3"))))
   `(message-separator ((,class (:foreground "deep sky blue"))))))

(provide-theme 'moodydarkvim)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; moodydarkvim.el ends here
