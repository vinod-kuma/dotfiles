;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     typescript
     csv
     ;; javascript
     ;; typescript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; helm
     ivy
     auto-completion
     ;; better-defaults
     emacs-lisp
     git
     ;; markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     semantic
     ;; (colors :variables colors-enable-nyan-cat-progress-bar t)
     pdf-tools
     ranger
     ;; lsp
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      doom-modeline
                                      keycast
                                      ivy-rich
                                      ;; exwm
                                      org-wild-notifier
                                      alert
                                      ivy-posframe
                                      lsp-mode
                                      lsp-ui
                                      lsp-ivy
                                      typescript-mode
                                      ;; js2-mode
                                      company-box
                                      ;; lsp-clients
                                      helm-lsp
                                      moe-theme
                                      elfeed
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    company-tern
                                     )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-but-keep-unused))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 0
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 10)
                                (projects . 10)
                                ;; (todos . 5)
                                ;; (agenda . 5)
                                )
   ;; true if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; list of themes, the first of the list is loaded when spacemacs starts.
   ;; press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(modus-vivendi
                         modus-operandi
                         spacemacs-dark
                         spacemacs-light)
   ;; if non nil the cursor color matches the state color in gui emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("fira code retina"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; the leader key
   dotspacemacs-leader-key "SPC"
   ;; the key used for emacs commands (m-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; the key used for vim ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; the leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-m-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; these variables control whether separate commands are bound in the gui to
   ;; the key pairs C-i, tab and C-m, ret.
   ;; setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and tab or <C-m> and ret.
   ;; in the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the gui. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; if non nil `y' is remapped to `y$' in evil states. (default nil)
   dotspacemacs-remap-y-to-y$ nil
   ;; if non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; if non-nil, j and k move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; if non nil, inverse the meaning of `g' in `:substitute' evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; name of the default layout (default "default")
   dotspacemacs-default-layout-name "default"
   ;; if non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; if non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; size (in mb) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; location where to auto-save files. possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; if non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; controls fuzzy matching in helm. if set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. if set to `source', preserve individual
   ;; source settings. else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; if non nil the paste micro-state is enabled. when enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; which-key delay in seconds. the which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.3
   ;; which-key frame position. possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; if non nil a progress bar is displayed when spacemacs is loading. this
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil
   ;; if non nil the frame is fullscreen when emacs starts up. (default nil)
   ;; (emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; if non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; use to disable fullscreen animations in osx. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; if non nil the frame is maximized when emacs starts up.
   ;; takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; a value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; a value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; if non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; if non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; if non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; if non nil smooth scrolling (native-scrolling) is enabled. smooth
   ;; scrolling overrides the default behavior of emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; control line numbers activation.
   ;; if set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. if set to `relative', line numbers are relative.
   ;; this variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; code folding method. possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; if non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; if non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; this can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; select a scope to highlight delimiters. possible values are `any',
   ;; `current', `all' or `nil'. default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; if non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-enable-server t
   dotspacemacs-persistent-server t
   dotspacemacs-server-socket-dir nil
   ;; list of search tool executable names. spacemacs uses the first installed
   ;; tool of the list. supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; the default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; not used for now. (default nil)
   dotspacemacs-default-package-repository 'melpa
   ;; delete whitespace while saving buffer. possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "initialization function for user code.
it is called immediately after `dotspacemacs/init', before layer configuration
executes.
 this function is mostly useful for variables that need to be set
before packages are loaded. if you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (require 'use-package)
  (setq doom-modeline-vcs-max-length 60)

  (setq configuration-layer-elpa-archives '(("melpa" . "melpa.org/packages/")   │
                                            │            ("org" . "orgmode.org/elpa/") ("gnu" . "elpa.gnu.org/packages/"))) 





  )

(defun dotspacemacs/user-config ()
  "configuration function for user code.
this function is called at the very end of spacemacs initialization after
layers configuration.
this is the place where most of your configurations should be done. unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."


  ;; (use-package org-tempo
    ;; :ensure org-plus-contrib
    ;; :after org
  ;; )
  ;; (require 'ob-sh)
  (org-babel-do-load-languages
    'org-babel-load-languages
    '((emacs-lisp . t)
      (python . t)
      (shell . t)
      (js . t)
      (sql . t)))

  (setq org-confirm-babel-evaluate nil)

  (use-package org-tempo ;; part of org-mode
    :after org
    ) ;; if use-package-always-ensure is set to t use-package looks for an org-tempo *package*

  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("js" . "src js"))
  (add-to-list 'org-structure-template-alist '("sql" . "src sql"))

  (defun efs/lsp-mode-setup ()
    (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
    (lsp-headerline-breadcrumb-mode))

  (use-package lsp-mode
    :defer t
    :commands (lsp lsp-deferred)
    :hook (lsp-mode . efs/lsp-mode-setup)
    :init
    (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
    :config
    (lsp-enable-which-key-integration t)
    (add-hook 'js2-mode-hook 'lsp-deferred))

  (use-package lsp-ui
    :defer t
    :hook (lsp-mode . lsp-ui-mode)
    :custom
    (lsp-ui-doc-position 'bottom))

  ;; (use-package lsp-treemacs
    ;; :after lsp)

  (use-package lsp-ivy
    :defer t)

  (use-package helm-lsp
    :defer t)

  ;; (use-package js2-mode
  ;;   :mode "\\.js\\'"
  ;;   :hook (js2-mode . lsp-deferred)
  ;;   :config
  ;;   ;; (setq typescript-indent-level 2)
  ;;   )

  (use-package typescript-mode
    :defer t
    :mode "\\.ts\\'"
    :hook (typescript-mode . lsp-deferred)
    :config
    ;; (setq typescript-indent-level 2)
    )

  (use-package company
    :after lsp-mode
    :hook (lsp-mode . company-mode)
    :bind (:map company-active-map
          ("<tab>" . company-complete-selection))
          (:map lsp-mode-map
          ("<tab>" . company-indent-or-complete-common))
    :custom
    (company-minimum-prefix-length 1)
    (company-idle-delay 0.0))

  (use-package company-box
    :hook (company-mode . company-box-mode))

  (defhydra hydra-zoom (global-map "s-.")
    "zoom"
    ("g" text-scale-increase "in")
    ("l" text-scale-decrease "out")
    ("0" text-scale-adjust "reset"))


  (use-package doom-modeline
    :ensure
    :config
    (doom-modeline-mode t))

  (with-eval-after-load 'keycast
    (define-minor-mode keycast-mode
      "show current command and its key binding in the mode line."
      :global t
      (if keycast-mode
          (add-hook 'pre-command-hook 'keycast-mode-line-update t)
        (remove-hook 'pre-command-hook 'keycast-mode-line-update)))

    (add-to-list 'global-mode-string '("" mode-line-keycast)))

  (use-package keycast
    :config
    (keycast-mode t))

  (use-package ivy-rich
    :ensure
    :config
     (ivy-rich-mode t))

  ;; (global-centered-cursor-mode t)
  (global-visual-line-mode t)

  ;; (use-package exwm
  ;;   :config
  ;;   (require 'exwm-config)
  ;;   (exwm-config-default))

  ;; (golden-ratio-mode t)

  ;; (use-package window
  ;;   :init
  ;;   (setq display-buffer-alist
  ;;         '(
  ;;           ("\\*messages.*"
  ;;            (display-buffer-in-side-window)
  ;;            (window-height . 0.16)
  ;;            (side . top)
  ;;            (slot . 1)
  ;;            (window-parameters . ((no-other-window . t))))
  ;;           ("^\\(\\*e?shell\\|vterm\\).*"
  ;;            (display-buffer-in-side-window)
  ;;            (window-height . 0.16)
  ;;            (side . bottom)
  ;;            (slot . 1))
  ;;         ))
  ;;   )


  (dolist (face '(default fixed-pitch))
    (set-face-attribute `,face nil :font "Fira Code Retina"))

  (defvar parameters
    '(window-parameters . ((no-other-window . t)
                           (no-delete-other-windows . t))))

  (setq fit-window-to-buffer-horizontally t)
  (setq window-resize-pixelwise t)

  (setq
   display-buffer-alist
   `(("\\*buffer list\\*" display-buffer-in-side-window
      ;; (side . top) (slot . 0) (window-height . fit-window-to-buffer)
      (side . top) (slot . 0) (window-height . 0.30)
      (preserve-size . (nil . t)), parameters)
     ("\\*tags list\\*" display-buffer-in-side-window
      ;; (side . right) (slot . 0) (window-width . fit-window-to-buffer)
      (side . right) (slot . 0) (window-width . 0.30)
      (preserve-size . (t . nil)) ,parameters)
     ("\\*\\(?:help\\|grep\\|completions\\)\\*"
      display-buffer-in-side-window
      (side . bottom) (slot . -1) (preserve-size . (nil . t))
      ,parameters)
     ("\\*\\(?:shell\\|compilation\\)\\*" display-buffer-in-side-window
      (side . bottom) (slot . 1) (preserve-size . (nil . t))
      ,parameters)))

  (defun dired-default-directory-on-left ()
    "display `default-directory' in side window on left, hiding details."
    (interactive)
    (let ((buffer (dired-noselect default-directory)))
      (with-current-buffer buffer (dired-hide-details-mode t))
      (display-buffer-in-side-window
       buffer `((side . left) (slot . 0)
                (window-width . fit-window-to-buffer)
                (preserve-size . (t . nil)) ,parameters))))

  (global-set-key (kbd "s-n") 'next-buffer)
  (global-set-key (kbd "s-p") 'previous-buffer)


  (use-package winner
    :hook (after-init-hook . winner-mode)
    :bind (("<s-right>" . winner-redo)
           ("<s-left>" . winner-undo)))

  ;; (find-file-noselect "~/Documents/digital-analogue/scratch.org")

  (global-set-key (kbd "C-c C-s") 'find-scratch-org-file)
  (global-set-key (kbd "C-k") 'kill-current-buffer)
  (evil-define-key 'normal 'global (kbd "s") 'save-buffer)

  (defun find-scratch-org-file ()
    "Open the scratch org file"
    (interactive)
    (find-file-other-window "/Users/vinod/Dropbox/Documents/digital-analogue/scratch.org"))

  ;; (set-face-attribute 'default nil :font "Hack-16")
  (set-face-attribute 'fixed-pitch nil :font "Monaco")
  (set-face-attribute 'variable-pitch nil :font "Consolas")


  ) ;; end

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-files '("~/Dropbox/Documents/digital-analogue/scratch.org"))
 '(org-time-stamp-custom-formats '("<%m/%d/%y %a %H:%M>" . "<%m/%d/%y %a %H:%M>"))
 '(package-selected-packages
   '(ivy-youtube google-maps elfeed org-tempo moe-theme helm-lsp lsp-ui lsp-ivy company-box frame-local helm-themes helm-swoop helm-projectile helm-mode-manager helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag ace-jump-helm-line helm helm-core lsp-mode markdown-mode ht ivy-posframe posframe org-wild-notifier dash-functional ranger pdf-tools tablist web-mode csv-mode exwm xelb treemacs-all-the-icons rainbow-mode rainbow-identifiers color-identifiers-mode keycast tide typescript-mode flycheck doom-modeline shrink-path all-the-icons memoize ivy-rich tern stickyfunc-enhance srefactor web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc coffee-mode xterm-color smeargle shell-pop orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download multi-term magit-gitflow magit-popup htmlize gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link fuzzy evil-magit magit git-commit with-editor transient eshell-z eshell-prompt-extras esh-help company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete ws-butler winum which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package undo-tree toc-org spaceline powerline smex restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint ivy-hydra indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-make google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired f evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg eval-sexp-fu elisp-slime-nav dumb-jump popup dash s diminish define-word counsel-projectile projectile pkg-info epl counsel swiper ivy column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed async aggressive-indent adaptive-wrap ace-window ace-link avy))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
