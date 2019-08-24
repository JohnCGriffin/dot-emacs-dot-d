# dot-emacs-dot-d
Personal .emacs.d configuration

-------- Elisp ------------

read-only-mode toggle (C-x C-q)

C-u 0 M-x byte-recompile-directory

-------- General Programming -----

comment M-;
paren matching C-M-n and p like % in vi

vc-diff or vc-ediff for git diff

flycheck-verify-setup

"C-x g" -> magit-status (q to quit)
--------- GO --------

	M-> jump in
	M-< jump out

NOTE that go-mode is a mess with "go-vet" in GO 1.12.
	 Stay with 1.11 until go-mode / go-vet catch up.



--------- HTML ------------

C-c r|l-arrow tag matching like % in vi

