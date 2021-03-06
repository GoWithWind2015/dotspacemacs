;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(yaml
    (dap :variables
          dap-enable-mouse-support t
          )
    (ipython-notebook :variables
                      ein-backend 'jupyter
                      )
     (javascript :variables
                 js2-mode-show-strict-warnings nil
                 javascript-import-tool 'import-js 
                 javascript-backend 'lsp
                 javascript-fmt-tool 'web-beautify
                 javascript-fmt-on-save nil
                 js2-basic-offset 4
                 js-indent-level 4
                 javascript-repl 'nodejs
                 js2-include-node-externs t


                 )
     (vue :variables
          vue-backend 'lsp
          ;; node-add-modules-path t
          )
     vimscript
     rust
     ;; eaf
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------

    (auto-completion :variables
            auto-completion-return-key-behavior 'complete
            auto-completion-tab-key-behavior 'cycle
            auto-completion-complete-with-key-sequence nil
            auto-completion-complete-with-key-sequence-delay 0.1
            auto-completion-idle-delay 0.2
            auto-completion-minimum-prefix-length 2
            auto-completion-enable-snippets-in-popup t
            auto-completion-private-snippets-directory nil
            auto-completion-use-company-box nil
            auto-completion-enable-help-tooltip t  ;; 可选项 'manual
            auto-completion-enable-sort-by-usage t
           ;; :enabled-for ;;java python c-c++ org html vue  javascript  ;;只是在这些layer中使用 auto-completion layer
           ;; :disabled-for  java  ;;在这些layer中不适用
)
     ;; better-defaults
     (lsp :variables
          lsp-lens-enable t
          lsp-modeline-diagnostics-mode  :file)
     (html :variables
           css-enable-lsp t
           html-enable-lsp t
           web-fmt-tool 'web-beautify)
      
;;     python
      cscope
;;     gtags
      (cmake :variables
             cmake-backend 'lsp
             cmake-enable-cmake-ide-support t)
     emacs-lisp
     (python :variables
             ;; python-formatter 'yapf
             python-backend 'lsp
             python-lsp-server 'pylsp
             python-save-before-test t
             )
     ;; git
     (java  :variables
            lsp-ui-doc-max-height 100
            lsp-ui-sideline-show-diagnostics nil
            lsp-ui-sideline-show-hover nil
            dotspacemacs-show-trailing-whitespace nil
                                )
     helm
     (latex :variables
            lsp-ui-doc-enable nil
            lsp-ui-doc-show-with-mouse nil
            lsp-ui-sideline-show-hover nil
            lsp-eldoc-enable-hover nil)

     (c-c++ :variables
            c-c++-backend 'lsp-clangd
            c-c++-lsp-enable-semantic-highlight 'rainbow
            clang-format-style "webkit"
            c-c++-enable-clang-format-on-save t
            c-c++-default-mode-for-headers 'c-mode
            c-c++-adopt-subprojects t
            c-c++-enable-clang-format-on-save nil
            dotspacemacs-show-trailing-whitespace nil
            )
     (markdown :variables
               markdown-live-preview-engine 'vmd
               )
     multiple-cursors
     ;; use org layer by excluding org-contrib package
     (org :packages
          (not org-contri))  
     (shell :variables
             shell-default-height 30
             shell-default-position 'bottom
             shell-default-shell 'term
             shell-default-full-span nil
             )
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     (treemacs :variables
               treemacs-use-follow-mode t
               treemacs-use-filewatch-mode t
               treemacs-lock-width nil
               treemacs-project-follow-mode t
               )

      )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '()

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

(setq configuration-layer-elpa-archives
    '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
      ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
      ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))

(with-eval-after-load 'xcscope
      (defun cscope-click-show-entry-other-window (event)
        "this function use cscope-show-entry-other-window to show tag detail when click"
        (interactive "e")
        (cscope-show-entry-other-window))
      (define-key cscope-list-entry-keymap [mouse-1] 'cscope-click-show-entry-other-window)
      (setq cscope-display-cscope-buffer t)
      (spacemacs/set-leader-keys "os" 'cscope-find-this-symbol))

)


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump.")


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
(setq-default evil-escape-key-sequence "jk")
(define-key evil-normal-state-map (kbd "U") 'evil-redo)
(evil-define-key nil evil-normal-state-map (kbd "J") nil)
(evil-define-key nil evil-normal-state-map (kbd "K") nil)
(evil-define-key nil evil-motion-state-map (kbd "K") (lambda () (interactive) (evil-previous-line 10)))
(evil-define-key nil evil-motion-state-map (kbd "J") (lambda () (interactive) (evil-next-line 10)))
(setq-default dotspacemacs-configuration-layers
              '((latex :variables latex-backend 'lsp)))


(setq-default dotspacemacs-configuration-layers
              '((latex :variables latex-build-engine 'xetex)))
(setq TeX-save-query nil)

"only set font in graphic mode"
(if (display-graphic-p)
(dolist (charset '(kana han cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font) charset
                    (font-spec :family "FZLingFeiJingXiaoKaiS" :size 28))))

(setq org-image-actual-width '(500))
;;(setq org-image-actual-width nil)


;; hot key for inserting image key in hot mode

(defun insert-clipboard-image ()
  (interactive)
  "insert windows clipboard  image into org mode"
  (require 's)
  (let ((user-add-path-begin nil)
        (user-add-path-end nil)
        (user-add-path nil)
        (absolute-user-add-path nil)
        (windows-absolute-user-add-path nil)
        (disk nil)
        (PasteExExeBin nil)
        (windows-power-shell nil))
  ;;modify this when need
  (setq PasteExExeBin "D:\\software_install_file\\PasteEx\\PasteEx.exe -q -f")  
  (setq windows-power-shell "/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe")
  (setq user-add-path-begin (search-backward "["))
  (setq user-add-path-end (search-forward "]"))
  (setq user-add-path (buffer-substring (+ 1 user-add-path-begin) (- user-add-path-end 1)))
  (setq absolute-user-add-path  (expand-file-name user-add-path))
  (setq disk (s-upcase
              (substring absolute-user-add-path 5 6)))
  (setq windows-absolute-user-add-path (replace-regexp-in-string "/mnt/." "" absolute-user-add-path))
  (setq windows-absolute-user-add-path (replace-regexp-in-string "/" "\\\\\\\\" windows-absolute-user-add-path))
  (setq windows-absolute-user-add-path
        (concat disk ":" windows-absolute-user-add-path))
  (message windows-absolute-user-add-path)
  (message windows-power-shell)
  (call-process windows-power-shell nil nil nil (concat  PasteExExeBin " " windows-absolute-user-add-path))
  (insert "]")
  (sleep-for 1)
  (if (file-exists-p user-add-path)
      (org-display-inline-images)
    (message "image do not exist"))
  (evil-previous-line)
  (evil-insert 1)
  (insert "#+ATTR_ORG: :width 350")
  ))
(defun org-refresh-image ()
  (interactive)
  "refresh image in org files"
  (save-buffer)
  (org-toggle-inline-images)
  (org-toggle-inline-images)
  )

(spacemacs/set-leader-keys "oi" 'insert-clipboard-image)
(spacemacs/set-leader-keys "ot" 'org-refresh-image)
;; (spacemacs/set-leader-keys "og" 'projectile-grep)
;; (spacemacs/set-leader-keys "og" 'helm-projectile-grep)
;; 使用helm-grep-do-git-grip 以在搜索的过程中能够忽略.gitignore中已经忽略的文件
;; (spacemacs/set-leader-keys "og" 'helm-grep-do-git-grep)
;; 发现使用helm-project-do-rg 能够和.gitignore配合工作，并且比helm-grep-do-git-grep 更快 
;; 在使用此命令之前首先要sudo apt-get install ripgrep
(spacemacs/set-leader-keys "og" 'spacemacs/helm-project-do-rg)

(defun tex-to-pdf ()
  (interactive)
  "convert dvi to pdf"
  (let ((tex-to-dvi-command (concat "tex_wrapper.sh " buffer-file-name))
        (dvi-to-pdf-command (concat "dvipdfmx " (concat (substring buffer-file-name 0 (- (length buffer-file-name) 3)) "dvi") " " )))
    (setq tex-to-pdf-command (concat tex-to-dvi-command " && " dvi-to-pdf-command))
    (save-buffer buffer-file-name)
    (shell-command tex-to-pdf-command)
    ))

(spacemacs/set-leader-keys "oc" 'tex-to-pdf)

(defun hhd/compile-and-run-current-cpp-file ()
  (interactive)
  "convert dvi to pdf"
  (let ((compile-and-run-cpp-command (concat "g++ " buffer-file-name "&& ./a.out"))
        )
    (save-buffer buffer-file-name)
    (shell-command compile-and-run-cpp-command)
    ))

(defun hhd/compile-and-run-current-node-file ()
  (interactive)
  (let ((compile-and-run-node-command (concat "node " buffer-file-name))
        )
    (save-buffer buffer-file-name)
    (shell-command compile-and-run-node-command)
    ))


(defun hhd/compile-and-run-current-java-file ()
  (interactive)
  "return to original place after executing the compile and run command"
  " save-excursion"
  (let ((compile-and-run-java-command (concat "javac " buffer-file-name "&& java " (file-name-base buffer-file-name)))
        )
    "(save-buffer buffer-file-name)"
    " save all buffers by default"
    (save-some-buffers t)
    "(message compile-and-run-java-command)"
    "(shell-command compile-and-run-java-command)"
   " (previous-window-any-frame)"
    (helm-M-x-execute-command 'dap-java-debug)
    ))


(setq projectile-project-search-path '("~/org_note/"))
(setq projectile-dirconfig-comment-prefix "#")


(setq lsp-latex-root-directory "/mnt/d/nutcloud_sync_file/Nutstore/org_note/tex/")

;; start cscope when c-c++-mode start
(add-hook 'c-mode-hook (function cscope-minor-mode))
(add-hook 'c++-mode-hook (function cscope-minor-mode))


;; toggle symbol highlight at point
(setq hhd/highlight-string-list nil)
(defun hhd/toggle-symbol-highlight-at-point ()
  "toggle string highlight at point"
  (interactive)
  (require 'hi-lock)
  (let ((string-regexp-at-point (hi-lock-regexp-okay (find-tag-default-as-symbol-regexp))))
    (if (member string-regexp-at-point hhd/highlight-string-list)
        (progn
          (unhighlight-regexp string-regexp-at-point)
          (setq hhd/highlight-string-list (remove string-regexp-at-point hhd/highlight-string-list)))
      (progn
        (push string-regexp-at-point hhd/highlight-string-list)
        (highlight-symbol-at-point))
      )))
(define-key global-map (kbd "<f8>") 'hhd/toggle-symbol-highlight-at-point)

(set-default 'truncate-lines t)

;; require helm-command to speed up M-x
(require 'helm-command)
(require 'elisp-mode)
;; open task.org on startup
;;(find-file "/mnt/d/nutcloud_sync_file/Nutstore/org_note/task.org")
(with-eval-after-load 'tex-mode
  (latex-mode)
  )


(defun hhd/compile-and-run-current-file ()
  (interactive)
  (cond ((eq major-mode 'python-mode)  (save-buffer buffer-file-name)  (spacemacs/python-execute-file nil)            )
        ((eq major-mode 'c++-mode) (hhd/compile-and-run-current-cpp-file))
        ((eq major-mode 'java-mode) (hhd/compile-and-run-current-java-file))
        ((eq major-mode 'js2-mode) (hhd/compile-and-run-current-node-file))
         )
  )
(spacemacs/set-leader-keys "op" 'hhd/compile-and-run-current-file)


;;  distinguish C-i and tab in the GUI version of Emacs.
(setq-default dotspacemacs-distinguish-gui-tab t)
(setq  treemacs-use-all-the-icons-theme t)

;; 设置web-mode默认缩进
(setq-default
 ;; web-mode
 web-mode-markup-indent-offset 2
 web-mode-css-indent-offset 2
 web-mode-code-indent-offset 2
  web-mode-attr-indent-offset 2)

;; 设置emacs的undo文件默认存储位置
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))


;; 设置lsp-java-jdt以支持java8
(setq lsp-java-jdt-download-url  "https://download.eclipse.org/jdtls/milestones/0.57.0/jdt-language-server-0.57.0-202006172108.tar.gz")

(lsp-register-custom-settings '(("javascript.format.semicolons" "insert" t)))

)



;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-engine 'xetex t)
 '(browse-url-browser-function 'browse-url-firefox)
 '(browse-url-firefox-program "firefox.exe")
 '(comment-style 'indent)
 '(evil-escape-delay 0.5)
 '(evil-want-Y-yank-to-eol nil)
 '(lsp-enable-links nil)
 '(lsp-enable-symbol-highlighting nil)
 '(lsp-latex-root-directory "/root/org_note/tex/" t)
 '(lsp-pyright-python-executable-cmd "python3")
 '(lsp-yaml-hover t)
 '(org-agenda-files
   '("/mnt/d/nutclound_data_file/Nutstore/org_note/task.org" "/home/hhd/nutcloud/org_note/task.org" "/mnt/d/nutcloud_sync_file/Nutstore/org_note/task.org"))
 '(org-file-apps
   '((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . default)))
 '(package-selected-packages
   '(treemacs-all-the-icons company-quickhelp yapfify yaml-mode ws-butler winum which-key web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package undo-tree queue toml-mode toc-org spaceline powerline restart-emacs request rainbow-delimiters racer pos-tip rust-mode pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode pcre2el paradox spinner org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-mime org-download org-bullets open-junk-file neotree move-text macrostep lorem-ipsum livid-mode skewer-mode simple-httpd live-py-mode linum-relative link-hint json-mode json-snatcher js2-refactor multiple-cursors js2-mode js-doc indent-guide hydra lv hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-cscope xcscope helm-ag google-translate golden-ratio gnuplot flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg eval-sexp-fu elisp-slime-nav eclim yasnippet dumb-jump disaster diminish define-word dactyl-mode cython-mode column-enforce-mode coffee-mode cmake-mode clean-aindent-mode clang-format cargo markdown-mode bind-map bind-key auto-highlight-symbol ht auto-compile packed auctex-latexmk auctex anaconda-mode pythonic f dash s aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy popup helm-core async)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t))
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   '(yapfify yaml-mode ws-butler winum which-key web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package undo-tree queue toml-mode toc-org spaceline powerline restart-emacs request rainbow-delimiters racer pos-tip rust-mode pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode pcre2el paradox spinner org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-mime org-download org-bullets open-junk-file neotree move-text macrostep lorem-ipsum livid-mode skewer-mode simple-httpd live-py-mode linum-relative link-hint json-mode json-snatcher js2-refactor multiple-cursors js2-mode js-doc indent-guide hydra lv hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-cscope xcscope helm-ag google-translate golden-ratio gnuplot flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg eval-sexp-fu elisp-slime-nav eclim yasnippet dumb-jump disaster diminish define-word dactyl-mode cython-mode column-enforce-mode coffee-mode cmake-mode clean-aindent-mode clang-format cargo markdown-mode bind-map bind-key auto-highlight-symbol ht auto-compile packed auctex-latexmk auctex anaconda-mode pythonic f dash s aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy popup helm-core async)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
