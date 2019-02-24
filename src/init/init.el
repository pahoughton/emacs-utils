;; 2001-08-17 (cc)  Paul Houghton <paul4hough@gmail.com>
;;


;; load custom before initialization

(defvar init-dotedir (concat (getenv "HOME") "/.emacs.d"))

(setq inhibit-startup-message t)

(setq custom-file (concat init-dotedir
                          "/customize-"
                          (number-to-string emacs-major-version)
                          ".el"))

(load-file custom-file)

(add-to-list 'load-path (concat init-dotedir "/lisp"))

(setq cwd default-directory)
(setq default-directory (concat init-dotedir "/lisp"))
(add-to-list 'load-path (normal-top-level-add-subdirs-to-load-path))
(setq default-directory cwd)
(load (concat init-dotedir "/lisp/loaddefs"))

; ugg system-type is gnu/linux on fedora
(defvar init-sys-type (format "%s" system-type))
(if (string-match-p "linux" init-sys-type)
    (setq init-sys-type "linux"))
(load (concat init-dotedir "/init-" init-sys-type))

(require 'dired)
(require 'font-lock)
(mwheel-install)

;; messes w/ frame-title
; show me what time it is
(display-time)

; Frame & Icon title - and a bit taller
(setq-default frame-title-format (concat system-short-name ":E:%b" ))
(setq-default frame-icon-title-format frame-title-format )
(setq default-frame-alist '((width . 80) (height . 45) (menu-bar-lines . 1)))

; My Email Address
(setq user-mail-address (or (getenv "REPLYTO")
                            "paul4hough@gmail.com"))

(defalias 'ksh-mode 'sh-mode)
;; minibuffer history
(savehist-mode 1)

;;
;; func-menu Auto loads
;;
(autoload 'fume-add-menubar-entry                       "func-menu"
  "Add `Function' menu to the menu bar" )
(autoload 'mouse-function-menu                          "func-menu"
  "Popup function menu" t)
(autoload 'fume-mouse-function-goto                     "func-menu"
  "Goto function clicked on or prompt in minibuffer" t )
(autoload 'fume-prompt-function-goto                    "func-menu"
  "Goto function prompted for in minibuffer" t )

;;
;; Misc auto loads
;;
(autoload 'insert-classname             "insert-classname"
  "Insert current classname" t )
(autoload 'insert-classname-inline      "insert-classname"
  "Insert inline funct for class" t)
(autoload 'insert-classname-template	"insert-classname"
  "Insert template funct for class" t )
(autoload 'find-header                  "find-header"
  "find header file" t)
(autoload 'goto-matching-paren		"goto-matching-paren"
  "Goto the matching paren")

; find other file

(autoload 'ff-find-other-file                           "find-file"
  "find other file .C - .hh or include file" t )
(autoload 'ff-mouse-find-other-file                     "find-file"
  "Visit the file you click on." t )

(setq-default cc-search-directories
              (append (list "."
                            "../lib*/"
                            (concat
                             (getenv (concat (getenv "PROJECT")
                                             "_PRJ_TOPDIR"))
                             "/include")
                            (concat (getenv "TOOL_DIR") "/include/*"))
                      system-cc-search-directories))

; turn on auto fill for text mode
(setq text-mode-hook 'turn-on-auto-fill)

; tab stops
(setq tab-stop-list '(  4   8  12  16  20  24  28  32  36  40
                       44  48  52  56  60  64  68  72  76  80
                       84  88  92  96 100 104 108 112 116 120
                      124 128 132 136 140 144 148 152 156 160 ) )

;(load "package")
; add marmalade package repo
;(add-to-list 'package-archives
;             '("marmalade" . "http://marmalade-repo.org/packages/") t)


;; (global-ede-mode t)
;;
;; Keyboard customizations
;;
(if (string-match "XEmacs" (emacs-version))
    (progn (define-key global-map '(return)     'newline-and-indent)
           (define-key global-map 'f10          'compile)
           (define-key global-map 'f1           'info)
           (define-key global-map '(meta f5)    'template-insert)
	   (define-key global-map 'f12          'find-header)
           (define-key global-map '(meta c)     'kill-ring-save)
           (define-key global-map '(meta v)     'yank)
           (global-unset-key '(control z)))
  (progn  (global-set-key (kbd "<RET>")  'newline-and-indent)
	  (global-set-key (kbd "<f5>")   'insert-timestamp)
          (global-set-key (kbd "<f10>")  'compile)
          (global-set-key (kbd "<f12>")  'find-header)
          (global-set-key (kbd "<M-f5>") 'template-insert)
          (global-set-key (kbd "M-c")    'kill-ring-save)
          (global-set-key (kbd "M-v")    'yank)
          (global-set-key (kbd "M-a")    'mark-whole-buffer)
          (global-unset-key (kbd "C-z"))
	  )
  )
;;
;; c, c++ & objc customizations
;;
(defun site-c-mode-common-hook ()
  (font-lock-mode)
  (setq c-basic-offset 2)
  (c-set-offset 'arglist-intro '+ )

  (if (string-match "XEmacs" (emacs-version))
      (progn
	(local-set-key    'f8                 'fume-add-menubar-entry)
	(local-set-key    '(shift f8)         'fume-prompt-function-goto)
	(local-set-key    '[(control c) (o)]  'ff-find-other-file)
	(local-set-key    '(control button3)  'ff-mouse-find-other-file ))
    (progn
      (local-set-key    (kbd "<f8>")	'fume-add-menubar-entry)
      (local-set-key    (kbd "<S-f8>")  'fume-prompt-function-goto)
      (local-set-key    (kbd "C-c o")   'ff-find-other-file)
      (local-set-key    [C-mouse-3]     'ff-mouse-find-other-file))))

(add-hook 'c-mode-common-hook 'site-c-mode-common-hook)

(defun site-c++-mode-hook ()
  (if (string-match "XEmacs" (emacs-version))
      (progn
	(local-set-key 'f2            'insert-classname)
	(local-set-key '(shift f2)    'insert-classname-inline)
	(local-set-key '(control f2)  'insert-classname-template))
    (progn
      	(local-set-key (kbd "<f2>")	'insert-classname)
	(local-set-key (kbd "<S-f2>")   'insert-classname-inline)
	(local-set-key (kbd "<C-f2>")   'insert-classname-template))))

(add-hook 'c++-mode-hook 'site-c++-mode-hook)

;;
;; CPerl
;;

(defun my-cperl-hook ()
  (if (string-match "XEmacs" (emacs-version))
      (progn
	(local-set-key    '[(control h) (f)]  'cperl-perldoc-at-point)
	(local-set-key    'f8                 'fume-add-menubar-entry)
	(local-set-key    '(shift f8)         'fume-prompt-function-goto)
	(local-set-key    '(%)                'goto-matching-paren))
    (progn
	(local-set-key    (kbd "C-h f")	    'cperl-perldoc-at-point)
	(local-set-key    (kbd "<f8>")	    'fume-add-menubar-entry)
	(local-set-key    (kbd "<S-f8>")    'fume-prompt-function-goto))))


;;
;; auto remove trailing white
;;
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;;
;; Dired
;;

(defun site-dired-load-hook ()
  ;; (require 'dired-x)
  (require 'crypt)
  )

(defun site-dired-mode-hook ()
  (setq truncate-lines t)
  )

(add-hook 'dired-mode-hook 'site-dired-mode-hook)
(setq dired-load-hook 'site-dired-load-hook)


(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(defun query-really-exit ()
  "ask the user if they really want to exit XEmacs"
  (y-or-n-p "Really exit XEmacs? ")
  )

(add-hook 'kill-emacs-query-functions 'query-really-exit)
; go mode
(defun pah-tab-width ()
  (setq tab-width 4)
  )
(add-hook 'go-mode-hook 'pah-tab-width)

;
; Psgml
;
(setq-default sgml-indent-data t)

; Auto-mode-alist - The mode to use for specific file names

(setq auto-mode-alist
      (append
       (list
        '("\\.ii$"      . c++-mode)
        '("\\.mk$"      . makefile-mode)
        '("\\.mak$"     . makefile-mode)
        '("\\.sql$"     . sql-mode)
        '("\\.ddl$"     . sql-mode)
	'("\\.php$"     . php-mode)
        '("\\.pp$"      . puppet-mode)
	'("\\.xml$"     . xml-mode)
	'("\\.yml$"     . yaml-mode)
	'("\\.3[A-Za-z]" . nroff-mode)
	'("Rakefile"    . ruby-mode)
	'("Puppetfile"  . ruby-mode)
;       '("status" . text-mode)
;       '("^log" . text-mode)
;       '("\\.dcl$" . dtd-mode)
;       '("\\.dec$" . dtd-mode)
;       '("\\.dtd$" . dtd-mode)
;       '("\\.ele$" . dtd-mode)
;       '("\\.ent$" . dtd-mode)
;       '("\\.mod$" . dtd-mode)

        )
       auto-mode-alist))
; No mouse on mode-line
(global-set-key [mode-line mouse-1] 'ignore)
(global-set-key [mode-line mouse-2] 'ignore)
(global-set-key [mode-line mouse-3] 'ignore)

(defun pah-after-init-hook ()
  "Set the bloody title"
  (setq frame-title-format (concat system-short-name ":E:%b" ))
  )

(add-hook 'after-init-hook 'pah-after-init-hook)
