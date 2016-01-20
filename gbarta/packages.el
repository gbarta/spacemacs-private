;;; packages.el --- gbarta Layer packages File for Spacemacs

(defvar gbarta-packages
  '(
    ob-ipython
    (evil-noautochdir :location (recipe :fetcher github :repo "gbarta/evil-noautochdir"))
    ))

(defvar gbarta-excluded-packages '()
  "List of packages to exclude.")

(defun gbarta/init-evil-noautochdir ()
    (use-package evil-noautochdir))

(defun gbarta/init-ob-ipython ()
  (use-package ob-ipython))
