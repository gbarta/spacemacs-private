;;; extensions.el --- gbarta Layer extensions File for Spacemacs
;;
;; This file is not part of GNU Emacs.
;;

;; List of all extensions to load before the packages.
(setq gbarta-pre-extensions
      '())

;; List of all extensions to load after the packages.
(setq gbarta-post-extensions
  '(evil-noautochdir))

(defun gbarta/init-evil-noautochdir ()
  "Initialize my extension"
  (require 'evil-noautochdir)
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
