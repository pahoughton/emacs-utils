;;
;;  File:	customize-24.3.el
;;  Project:	emacs-utils
;;  Desc:
;;
;;	Emacs customization
;;
;;  Author(s):   Paul Houghton <paul4hough@gmail.com>
;;  Created:     2013-10-08 10:09
;;

;;
;; Customization variables
;;
(custom-set-variables
 '(cvs-display-full-path nil)
 '(cvs-edit-confirm (quote changed))
 '(debug-on-error t)
 '(dired-verify-modtimes nil)
 '(display-time-mode t)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(explicit-bash-args (quote ("-li")))
 '(js-indent-level 2)
 '(Man-notify-method (quote newframe))
 '(mode-compile-make-options "" t)
 '(perl-indent-level 2)
 '(save-place t nil (saveplace))
 '(sh-basic-offset 2)
 '(shell-file-name "/bin/bash")
 '(sh-indentation 2)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 )
(custom-set-faces
 '(default ((t (:size "8pt" :family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 80 :width normal))))
;; '(default ((t (:size "8pt" :family "Courier New"))))
;; '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 80 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
;; '(default ((t (:size "8pt" :family "Courier New"))))
 '(region ((t (:background "cyan")))))
