;;;
;;; Title:	emacs
;;; Project:	Emacs
;;; Desc:
;;; 
;;;	Xemacs Initialization file. 
;;; 
;;; Notes:
;;; 
;;; Author:	Paul A. Houghton - (houghton@cshore.wcom.com)
;;; Created:	12/26/96 10:47
;;; 
;;; Revision History: (See end of file for Revision Log)
;;;
;;;	Last Mod By:    $Author$
;;;	Last Mod:	$Date$
;;;	Version:	$Revision$
;;;
;;;	$Id$

(if (string-match "XEmacs\\|Lucid" emacs-version)
    (load (concat (getenv "HOME")
		  "/.xemacs/init"))
  (message "Load .emacs  (XEmacs) done")
  (
;; Swiped from Red Hat Linux default .emacs initialization file  ; -*- mode: emacs-lisp -*-

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
;; (global-set-key [delete] 'delete-char)
;; (global-set-key [kp-delete] 'delete-char)

;; turn on font-lock mode
;; (global-font-lock-mode t)
;; enable visual feedback on selections
;; (setq-default transient-mark-mode t)

;; always end a file with a newline
;; (setq require-final-newline t)

;; stop at the end of the file, not just add lines
;; (setq next-line-add-newlines nil)

;;(when window-system
  ;; enable wheelmouse support by default
;;  (mwheel-install)
  ;; use extended compound-text coding for X clipboard
;;  (set-selection-coding-system 'compound-text-with-extensions))

;; (custom-set-variables
;; '(load-home-init-file t t))
;; (custom-set-faces)


;; (message "Load .emacs  (emacs) done")
))

;;; 
;;; $Log$
;;; Revision 1.1  2008/04/24 15:15:03  Paul
;;; *** empty log message ***
;;;
;;; Revision 1.6  2003/06/02 07:10:30  houghton
;;; Changed for cport init errors
;;;
;;; Revision 1.5  2003/05/18 10:28:40  houghton
;;; Changed to work w/ both Xemacs and GNU Emacs
;;;
;;; Revision 1.4  2003/05/16 09:38:44  houghton
;;; Changed to load ~/.xemacs/init.el
;;;
;;; Revision 1.3  1999/06/22 12:27:49  houghton
;;; Complete rework to use ~/.xemacs/* files.
;;;
;;; Revision 1.2  1999/04/28 09:12:59  houghton
;;; Merge with cmore changes.
;;;
;;; 

;;; Local Variables:
;;; mode:emacs-lisp
;;; End: