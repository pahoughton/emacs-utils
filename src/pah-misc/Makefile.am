#
# File:		Makefile.am
# Project:	emacs-utils
# Desc:
#
#   automake source for Makefile.in
#
# Author(s):   Paul Houghton <paul4hough@gmail.com>
# Created:     07/05/2003 07:49
#
# svn checkout http://svn.code.sf.net/p/php-mode/code/trunk php-mode-code
# git clone https://github.com/puppetlabs/puppet-syntax-emacs

hide = @

elisp_sources	=				\
        ascii-table.el				\
        cobol-mode.el				\
	dockerfile-mode.el			\
        find-executable.el			\
        find-header.el				\
        find-up-dir.el				\
        go-mode.el				\
        insert-classname.el			\
        timestamp.el				\
        php-mode.el				\
        puppet-mode.el				\
	mediawiki.el				\
	markdown-mode.el			\
	s.el					\
        todo-mode.el				\
	xrdb-mode.el				\
	yaml-mode.el

Emacs_elisp_sources	=			\
	$(elisp_sources)			\
	$(clone_elisp_sources)

EXTRA_DIST	= $(elisp_sources) subdirs.el

INSTALL_LISP_DIR = $(lispdir)/pah-misc

SUFFIXES 	= .elc .el
ELCS		= $(Emacs_elisp_sources:.el=.elc)
CLEANFILES	= $(ELCS) $(clone_elisp_sources)




.el.elc:
	$(hide)$(EMACS) -batch -q				     \
		-eval "(setq load-path (append '(\".\") load-path))" \
		-f batch-byte-compile $^

loaddefs.el: $(elisp_sources)
	$(hide)$(EMACS) $(VANILLA) -batch	\
		--no-site-file 			\
		-l autoload			\
		 --eval '(setq generated-autoload-file (concat (file-name-directory (file-truename "Makefile.am")) "loaddefs.el"))' \
		-f batch-update-autoloads .

cus-load.el: $(elisp_sources)
	$(hide)$(EMACS) $(VANILLA) -batch -l cus-dep 	\
		-f custom-make-dependencies .

Emacs_install: $(ELCS) loaddefs.el
	$(hide) $(mkinstalldirs) "$(INSTALL_LISP_DIR)"
	$(hide) for f in $(Emacs_elisp_sources) $(ELCS) ; do		\
	  $(INSTALL) -p -m 644 "$$f" "$(INSTALL_LISP_DIR)" || exit 1 ;	\
	  echo "Installed $(INSTALL_LISP_DIR)/$$f";			\
	done
	$(hide) $(INSTALL) subdirs.el "$(lispdir)"
	@echo "Installed $(lispdir)/subdirs.el"
	$(hide)if [ -f "$(lispdir)/loaddefs.el" ] ; then	\
	  mv "$(lispdir)/loaddefs.el" 				\
	     "$(lispdir)/loaddefs.el.bak" &&     		\
	  cat "$(lispdir)/loaddefs.el.bak" 			\
	      loaddefs.el					\
	      > "$(lispdir)/loaddefs.el" || exit 1;		\
	else							\
	  $(INSTALL) -p -m 644 loaddefs.el "$(lispdir)";	\
	fi
	[ -f "$(lispdir)/loaddefs.el" ] || exit 2


all: $(ELCS) cus-load.el loaddefs.el
check: all
install-data-hook: all Emacs_install

%:
	$(MAKE) -C .. $@
