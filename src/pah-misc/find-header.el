;; Title:            find-header.el
;; 
;; Description:
;; 
;; 	
;; 
;; Notes:
;; 
;; Programmer:	    Paul Houghton <paul4hough@gmail.com
;; Start Date:	    10/24/96 19:54
;; 

(require 'find-file)

(defvar header-name nil)

;;###autoload
(defun find-header()
  "Find a header file"
  (interactive)
  (setq header-name
	(read-from-minibuffer "Enter Filename: " header-name ))
  (ff-get-file cc-search-directories header-name) )


;; 
;; $Log :$
;; 

