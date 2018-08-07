
;; useless chrome

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; no backup files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; sort buffer list by mode
(setq Buffer-menu-sort-column 4)
(setq use-package-always-ensure t)

(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/init.el")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ace-window-display-mode t)
 '(ansi-color-names-vector
   ["#ede9e7" "#ef001b" "#8cc610" "#eea806" "#23cbfe" "#ec3691" "#1ee079" "#272b34"])
 '(ansi-term-color-vector
   [unspecified "#1F1611" "#660000" "#144212" "#EFC232" "#5798AE" "#BE73FD" "#93C1BC" "#E6E1DC"] t)
 '(coin-ticker-mode t)
 '(company-quickhelp-color-background "#e8e8e8")
 '(company-quickhelp-color-foreground "#444444")
 '(compilation-message-face (quote default))
 '(counsel-projectile-mode t nil (counsel-projectile))
 '(csv-separators (quote ("	")))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("9240e71034689655a6c05c04063af2c90d0a831aa4e7ca24c8b6e29b5a2da946" "cdd26fa6a8c6706c9009db659d2dffd7f4b0350f9cc94e5df657fa295fffec71" "e8825f26af32403c5ad8bc983f8610a4a4786eb55e3a363fa9acb48e0677fe7e" "4627421e5aed6f37d7e40b5a493cd66ec1589d8b9d651b5c27efeb45e766193c" "7cb89c93e37327cf1545fd8579816241446c611ebabc144a9835d09bbe132b19" "2f532f1fe87f94aada4aa5257139d9b9ab69f0fcec58ecaaa5a119d9ecedaaa4" "c1390663960169cd92f58aad44ba3253227d8f715c026438303c09b9fb66cdfb" "4486ade2acbf630e78658cd6235a5c6801090c2694469a2a2b4b0e12227a64b9" "8bceed439b6d46e0234e0be965cc4d2dc899786d4ce37fbaf10fede43b1cdf79" "abf8f2906b2b125efb05b3623c8ba7c4a8361d086139af0525d66913facfbd29" "6ac7c0f959f0d7853915012e78ff70150bfbe2a69a1b703c3ac4184f9ae3ae02" "d876b5eb328b9aaeb2edf36df34e8efef3658a9f3bfa53af08b0fa1981c2d303" "d068374342ff3328f60fdb092a7171a94e0c11118be841f0491b42f8d5aa01a2" "dcb9fd142d390bb289fee1d1bb49cb67ab7422cd46baddf11f5c9b7ff756f64c" "d494af9adbd2c04bec4b5c414983fefe665cd5dadc5e5c79fd658a17165e435a" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "ad109c1ad8115573f40e22ac2b996693b5d48052fa37b5919f70ea37c62a965e" "444238426b59b360fb74f46b521933f126778777c68c67841c31e0a68b0cc920" "44eec3c3e6e673c0d41b523a67b64c43b6e38f8879a7969f306604dcf908832c" "7527f3308a83721f9b6d50a36698baaedc79ded9f6d5bd4e9a28a22ab13b3cb1" "2cfc1cab46c0f5bae8017d3603ea1197be4f4fff8b9750d026d19f0b9e606fae" "f2057733672d3b119791f5b7d1a778bf8880121f22ea122a21d221b45081f49e" "c4bd8fa17f1f1fc088a1153ca676b1e6abc55005e72809ad3aeffb74bd121d23" "5c0f12a63fbc33bb56ad98bd27223b5a92397386c55317694e416be7c11679a2" "32550555652a3e43897f5b0c20d7cbacd74f1988e9d45164112e06dbb07c6594" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "2b6bd2ebad907ee42b3ffefa4831f348e3652ea8245570cdda67f0034f07db93" "65d9573b64ec94844f95e6055fe7a82451215f551c45275ca5b78653d505bc42" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "44c566df0e1dfddc60621711155b1be4665dd3520b290cb354f8270ca57f8788" "a40eac965142a2057269f8b2abd546b71a0e58e733c6668a62b1ad1aa7669220" "2f0a552a9d14fe8ddaaacdb7b82a0eee1ea1f7f5d0850789915e5b04a1b9669f" "fb0234f37de07754227864ceb11bad7d7decc74d2853ac635f9f8715ba917a20" "0e0c37ee89f0213ce31205e9ae8bce1f93c9bcd81b1bcda0233061bb02c357a8" "8d3c5e9ba9dcd05020ccebb3cc615e40e7623b267b69314bdb70fe473dd9c7a8" "086970da368bb95e42fd4ddac3149e84ce5f165e90dfc6ce6baceae30cf581ef" "af23b37b52abc61b78373a47767df9e35c42c63d80be6c0f2d2ed8fc6175d50f" "f66edc956ad84fd071604c402c8582549d8d3823ef21b578e93771768ef8adff" "3eb2b5607b41ad8a6da75fe04d5f92a46d1b9a95a202e3f5369e2cdefb7aac5c" "5673c365c8679addfb44f3d91d6b880c3266766b605c99f2d9b00745202e75f6" "24685b60b28b071596be6ba715f92ed5e51856fb87114cbdd67775301acf090d" "2d16a5d1921feb826a6a9b344837c1ab3910f9636022fa6dc1577948694b7d84" "6fc0ae7cc2abd82d8add1140874ccf8773feaaae73a704981d52fdf357341038" "ed763cdf0b7c523cdc094ba137080e7f2c4e7a28303e0cbeb0eda159f964f1b6" "0ee3fc6d2e0fc8715ff59aed2432510d98f7e76fe81d183a0eb96789f4d897ca" default)))
 '(default-input-method "latin-1-prefix")
 '(deft-auto-save-interval 0.0)
 '(dumb-jump-mode t)
 '(electric-pair-mode t)
 '(elfeed-feeds (quote ("https://www.reddit.com/r/emacs/")))
 '(fci-rule-character-color "#452E2E")
 '(fci-rule-color "#eee8d5")
 '(global-display-line-numbers-mode nil)
 '(global-flycheck-mode t)
 '(global-linum-mode nil)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(line-number-mode t)
 '(magit-diff-use-overlays nil)
 '(magit-dispatch-arguments nil)
 '(minions-mode t)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (all-the-icons-dired counsel-notmuch farmhouse-theme csharp-mode which-key prassee-theme 0blayout toc-org nordless-theme danneskjold-theme haml-mode yaml-mode plantuml-mode oceanic-theme minions yoshi-theme yoshi-theme "yoshi-theme" "yoshi-theme" "yoshi" "yoshi" "yoshi" "yoshi" "yoshi" "yoshi" "yoshi" "yoshi-theme" "yoshi-theme-20170330.0" csv-mode auctex powershell moody notmuch htmlize org-review org-present ox-reveal unfill beacon beacon-mode challenger-deep-theme centered-window define-word monokai-alt-theme monokai-theme org restclient birds-of-paradise-plus-theme coin-ticker btc-ticker diminish olivetti counsel-spotify elfeed fireplace race ox-gfm add-node-modules-path auto-dim-other-buffers nord-theme color-identifiers-mode treemacs-projectile treemacs solarized-theme projectile-ripgrep ripgrep github-modern-theme multiple-cursors paredit all-the-icons writeroom-mode tao-theme gruvbox-theme yafolding devdocs seoul256-theme js-import visual-fill-column darktooth-theme mu4e-alert prettier-js emojify darkroom indium twilight-bright-theme twilight-theme dictionary markdown-mode yasnippet dumb-jump exec-path-from-shell json-mode multi-term counsel-projectile creamsody-theme web-mode expand-region magit-gh-pulls ag js2-mode projectile mu4e magit ace-window flycheck :flycheck org-bullets org-mode deft counsel counseil swiper ivy use-package)))
 '(pdf-view-midnight-colors (quote ("#6a737d" . "#fffbdd")))
 '(pixel-scroll-mode t)
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(projectile-mode t nil (projectile))
 '(reb-re-syntax (quote string))
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(tramp-syntax (quote default) nil (tramp))
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c9485ddd1797")
     (60 . "#bf7e73b30bcb")
     (80 . "#b58900")
     (100 . "#a5a58ee30000")
     (120 . "#9d9d91910000")
     (140 . "#9595943e0000")
     (160 . "#8d8d96eb0000")
     (180 . "#859900")
     (200 . "#67119c4632dd")
     (220 . "#57d79d9d4c4c")
     (240 . "#489d9ef365ba")
     (260 . "#3963a04a7f29")
     (280 . "#2aa198")
     (300 . "#288e98cbafe2")
     (320 . "#27c19460bb87")
     (340 . "#26f38ff5c72c")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(visible-bell t)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(when
      (or
       (not
	(boundp
	 (quote ansi-term-color-vector)))
       (not
	(facep
	 (aref ansi-term-color-vector 0)))))
 '(which-key-mode t)
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"])
 '(yas-global-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
