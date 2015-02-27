;;; extensions.el --- gbarta Layer extensions File for Spacemacs
;;
;; This file is not part of GNU Emacs.
;;

(defvar gbarta-pre-extensions
  '(
    )
  "List of all extensions to load before the packages.")

(defvar gbarta-post-extensions
  '(
    evil-noautochdir
    )
  "List of all extensions to load after the packages.")

(defun gbarta/init-evil-noautochdir ()
  "Initialize my extension"
  (require 'evil-noautochdir)
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
