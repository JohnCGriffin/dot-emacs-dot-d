# dot-emacs-dot-d
Personal .emacs.d configuration

-------- Elisp ------------

read-only-mode toggle (C-x C-q)

C-u 0 M-x byte-recompile-directory

-------- General Programming -----

comment M-;

--------- GO --------

	M-. jump to definition
	M-* pop backwards
	M-p compile

	go-guru 

	C-c C-o 

	j==>Jump to Definition   C-c C-o j     r==>Show Referrers       C-c C-o r
	f==>Show Free Names      C-c C-o f     d==>Describe Expression  C-c C-o d
	i==>Show Implements      C-c C-o i     0==>Show Callers         C-c C-o <
	C==>Show Callees         C-c C-o >     c==>Show Callstack       C-c C-o s
	p==>Show Points-To       C-c C-o p     w==>Show Which Errors    C-c C-o e
	S==>Show Channel Peers   C-c C-o c     s==>Set pointer analysis scope...

	M-g p previous compiler output
	M-g n next compiler output

	vc-diff or vc-ediff for git diff

paren matching C-M-n and p like % in vi


--------- HTML ------------

C-c r|l-arrow tag matching like % in vi

