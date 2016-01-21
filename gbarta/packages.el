;;; packages.el --- gbarta Layer packages File for Spacemacs

(defvar gbarta-packages
  '(
    (evil-noautochdir :location (recipe :fetcher github :repo "gbarta/evil-noautochdir"))
    ob-browser ; render html using phantomjs
    ob-http ; make http requests and get responses
    ob-ipython
    ))

(defvar gbarta-excluded-packages '()
  "List of packages to exclude.")

(defun gbarta/init-evil-noautochdir ()
    (use-package evil-noautochdir))

(defun gbarta/init-ob-browser ()
  (use-package ob-browser))

(defun gbarta/init-ob-http ()
  (use-package ob-http))

(defun gbarta/init-ob-ipython ()
  (use-package ob-ipython))
