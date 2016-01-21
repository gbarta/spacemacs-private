;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers '(
                                       auto-completion
                                       c-c++
                                       csharp
                                       emacs-lisp
                                       extra-langs
                                       gbarta
                                       git
                                       haskell
                                       html
                                       javascript
                                       markdown
                                       org
                                       purescript
                                       python
                                       shell
                                       syntax-checking
                                       )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Specify the startup banner. If the value is an integer then the
   ;; text banner with the corresponding index is used, if the value is
   ;; `random' then the banner is chosen randomly among the available banners,
   ;; if the value is a string then it must be a path to a .PNG file,
   ;; if the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'doge
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-dark
                         solarized-light
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil)
  ;; User initialization goes here
  )

(defun dotspacemacs/config ()
  "This is were you can ultimately override default Spacemacs configuration.
This function is called at the very end of Spacemacs initialization."

  ;; system setup
  (case system-type
    ('gnu/linux
     (progn
       ))
    ('cygwin
     (progn
       (setq default-buffer-file-coding-system 'utf-8-dos)
       ))
    ('darwin
     (progn
       ;; Use PCKeyboardHack to map CapsLock to Control_R (keycode=62)
       (setq mac-allow-anti-aliasing t)
       (set-face-font 'default "Monospace-15")
       (add-hook 'after-init-hook
                 '(lambda ()
                    (if window-system
                        (menu-bar-mode nil))));; doesn't cost any space on OSX.
       ))
    ('windows-nt
     (progn
       (set-face-font 'default "DejaVu Sans Mono-12")
       (add-hook 'after-init-hook
                 '(lambda ()
                    ;; windows emacs is dog slow.	 Help it along..
                    (global-auto-revert-mode -1)
                    (setq w32-get-true-file-attributes nil)
                    ))
       )))

  ;; machine setup
  (pcase (downcase system-name)
    ("blackdog.local"
     (setq exec-path (cons "/opt/local/bin" exec-path)))
    ("gabr-bart-dev"
     (setq exec-path (cons "C:/Projects/netcode/omnisharp-server/OmniSharp/bin/Debug" exec-path))
     (setq exec-path (cons "/mybin/" exec-path))
     (setq helm-ag-base-command "pt --nocolor --nogroup")
     (setq tern-command '("tern"))))

  ;; case insensitive completion
  (setq read-buffer-completion-ignore-case t)
  (setq completion-ignore-case t)
  (setq read-file-name-completion-ignore-case t)

  (setq-default indent-tabs-mode nil)
  (setq default-tab-width 4)
  (setq tab-width 4)

  (setq whitespace-style '(tab-mark face trailing space-before-tab space-after-tab))
  (global-whitespace-mode t)

  ;; backup policy -- always backup, but keep the
  ;; files out of the way in _backups/
  (setq
   backup-by-copying t
   backup-directory-alist '((".*" . "_backups"))
   delete-old-versions t
   kept-new-versions 100
   make-backup-files t
   vc-make-backup-files t
   version-control t)
  (defun gbarta/force-backup-of-buffer ()
    (setq buffer-backed-up nil))
  (add-hook 'before-save-hook  'gbarta/force-backup-of-buffer)

  ;; spacemacs has matchit but only turns it on for a few things
  (global-evil-matchit-mode 1)

  ;; helm is pretty cool, but a bit jarring for ex-style commands
  (eval-after-load 'evil-mode
    (defadvice evil-ex (around evil-ex-use-standard-completion () activate)
      (if (fboundp #'completion--in-region)
          (let ((completion-in-region-function #'completion--in-region))
            ad-do-it)
        ad-do-it)))

  (defadvice evil-get-register (around evil-get-register-ex-fix () activate)
    ;; getting the register should be done in the context
    ;; of a real buffer, not the minibuffer
    (with-current-buffer (or (and (evil-ex-p) evil-ex-current-buffer) (current-buffer))
      ad-do-it))

  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(custom-safe-themes
   (quote
    ("bf3ec301ea82ab546efb39c2fdd4412d1188c7382ff3bbadd74a8ecae4121678" default)))
 '(ring-bell-function (quote ignore) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
