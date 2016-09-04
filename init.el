;;;;;;;;;;;;;加载全局加载目录;;;;;;;;;;;;
(let ((default-directory  "~/.emacs.d/lisp/"))
  (setq load-path
        (append
         (let ((load-path  (copy-sequence load-path))) ;; Shadow
           (append
            (copy-sequence (normal-top-level-add-to-load-path '(".")))
            (normal-top-level-add-subdirs-to-load-path)))
         load-path)))

(require 'eim-extra)
(require 'yasnippet)
(require 'flymake-jslint)
(require 'flymake-cursor)
(require 'install-elisp) 

(autoload 'json-mode "json-mode"
   "Major mode for editing json files" t)
(autoload 'web-mode "web-mode"
   "Major mode for editing html files" t)
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.html\\'" .     web-mode))
(add-to-list 'auto-mode-alist '("\\.htm\\'" .      web-mode))
(add-to-list 'auto-mode-alist '("\\.hjs\\'" .      web-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" .     markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" .       markdown-mode))
(defun my-web-mode-hook ()
  "Hook for web mode"
  (setq web-mode-markup-indent-offset 2)
  )
(add-hook 'web-mode-hook 'my-web-mode-hook)


;;;;;;;;;;; ket bind for vssh@ipad ;;;;;;;;;;;
(global-set-key "≈" 'execute-extended-command)
(global-set-key "∑" 'kill-ring-save)
(global-set-key "√" 'scroll-down-command)
(global-set-key "∫" 'backward-word)
(global-set-key "ƒ" 'forward-word)
(global-set-key "¯" 'beginning-of-buffer)
(global-set-key "˘" 'end-of-buffer)
(global-set-key "∂" 'kill-word)
(global-set-key (kbd "<backtab>") 'hs-toggle-hiding)


(setq shell-file-name "/bin/bash")
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t) 
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t) 
(setq-default indent-tabs-mode nil)  
(setq-default tab-width 4) 
(setq-default c-basic-offset 4)
(put 'upcase-region 'disabled nil)
(add-hook 'window-configuration-change-hook (lambda () (ruler-mode 1)))
(setq linum-format "%4d\u2502")  ;; 设置标尺格式
(add-hook 'find-file-hook (lambda () (linum-mode 1)))
;;(global-linum-mode t)            ;; 默认全部窗口显示行号.
;; (iswitchb-mode 1)



;;;;;;;;;;;;;package;;;;;;;;;;;;;;;;;;
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
(setq custom-safe-themes t)

(add-hook 'after-init-hook
          (lambda ()
            (load-theme 'tango-dark)
            ))

(defun sql-exec-select-text ()
  "Send select select text with sql-send-string"
  (interactive)
  (if mark-active
      (sql-send-string (buffer-substring (mark) (point)))
    (message "Select SQL to execute first..." )))

(add-hook 'sql-mode-hook
           (lambda () 
             (define-key sql-mode-map (kbd "C-j") 'sql-exec-select-text)))

(add-hook 'sql-mode-hook
           (lambda () 
             (toggle-truncate-lines)))

;;;;;;;;;;;;;rtags;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; http://www.tuicool.com/articles/RvQJfmR
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; git clone --recursive https://github.com/Andersbakken/rtags.git
;; cd rtags
;; cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .
;; make
;; bear --append make -j16
;; cd /where/you/built/rtags/bin
;; nohup ./rdm &
;; cd /your/project/source
;; rc -J /dir/containing/compile_commands.json/
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ensure that we use only rtags checking
;; https://github.com/Andersbakken/rtags#optional-1
(defun setup-flycheck-rtags ()
  (interactive)
  (flycheck-select-checker 'rtags)
  ;; RTags creates more accurate overlays.
  (setq-local flycheck-highlighting-mode nil)
  (setq-local flycheck-check-syntax-automatically nil))

;; only run this if rtags is installed
(when (require 'rtags nil :noerror)
  ;; make sure you have company-mode installed
  (require 'company)
  (define-key c-mode-base-map (kbd "M-.")
    (function rtags-find-symbol-at-point))
  (define-key c-mode-base-map (kbd "M-,")
    (function rtags-find-references-at-point))
  ;; disable prelude's use of C-c r, as this is the rtags keyboard prefix
  ;; (define-key prelude-mode-map (kbd "C-c r") nil)
  ;; install standard rtags keybindings. Do M-. on the symbol below to
  ;; jump to definition and see the keybindings.
  (rtags-enable-standard-keybindings)
  ;; comment this out if you don't have or don't use helm
  (setq rtags-use-helm t)
  ;; company completion setup
  (setq rtags-autostart-diagnostics t)
  (rtags-diagnostics)
  (setq rtags-completions-enabled t)
  (push 'company-rtags company-backends)
  (global-company-mode)
  (define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))
  ;; use rtags flycheck mode -- clang warnings shown inline
  (require 'flycheck-rtags)
  ;; c-mode-common-hook is also called by c++-mode
    (add-hook 'c-mode-common-hook #'setup-flycheck-rtags))

;;;;;;;;;;;;;拼音输入法;;;;;;;;;;;;;;;;;;
;; EIM Input Method. Use C-\ to toggle input method.
(autoload 'eim-use-package "eim" "Another emacs input method")
(setq eim-use-tooltip nil)              ; don't use tooltip
(setq eim-punc-translate-p nil)         ; use English punctuation
(register-input-method
 "eim-py" "euc-cn" 'eim-use-package
 "拼音" "EIM Chinese Pinyin Input Method" "py.txt"
 'my-eim-py-activate-function)
(set-input-method "eim-py")             ; use Pinyin input method
(setq activate-input-method t)          ; active input method
(toggle-input-method nil)               ; default is turn off
(defun my-eim-py-activate-function ()
  (add-hook 'eim-active-hook
            (lambda ()
              (let ((map (eim-mode-map)))
                (define-key eim-mode-map "-" 'eim-previous-page)
                (define-key eim-mode-map "=" 'eim-next-page)
		(define-key eim-mode-map "<" 'eim-previous-page)
                (define-key eim-mode-map ">" 'eim-next-page)
		(define-key eim-mode-map "," 'eim-previous-page)
                (define-key eim-mode-map "." 'eim-next-page)
		))))


;;;;;;;;;;; lintnode ;;;;;;;;;;;;;;;; 
(setq lintnode-location "~/.emacs.d/lisp/lintnode")
(setq lintnode-jslint-excludes (list 'nomen 'undef 'plusplus 'onevar 'white))
(add-hook 'js-mode-hook
          (lambda ()
            (lintnode-hook)))

(add-hook 'js-mode-hook
          (lambda ()
            ;; Scan the file for nested code blocks
            (imenu-add-menubar-index)
            ;; Activate the folding mode
            (hs-minor-mode t)))

;;;;;;;;;;;;;flymake;;;;;;;;;;;;
(defun flymake-html-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "tidy" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.html$\\|\\.ctp" flymake-html-init))

(add-to-list 'flymake-err-line-patterns
             '("line \\([0-9]+\\) column \\([0-9]+\\) - \\(Warning\\|Error\\): \\(.*\\)"
               nil 1 2 4))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#313131" "#D9A0A0" "#8CAC8C" "#FDECBC" "#99DDE0" "#E090C7" "#A0EDF0" "#DCDCCC"])
 '(custom-safe-themes
   (quote
    ("40f6a7af0dfad67c0d4df2a1dd86175436d79fc69ea61614d668a635c2cd94ab" "bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" "6af55f6f26c0c6f113427d8ce72dea34aa1972b70e650486e6c725abd18bbe91" "f9574c9ede3f64d57b3aa9b9cef621d54e2e503f4d75d8613cbcc4ca1c962c21" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" default)))
 '(eww-search-prefix "http://www.sogou.com")
 '(fci-rule-color "#5E5E5E")
 '(linum-format " %7i ")
 '(nrepl-message-colors
   (quote
    ("#336c6c" "#205070" "#0f2050" "#806080" "#401440" "#6c1f1c" "#6b400c" "#23733c")))
 '(package-user-dir "~/.emacs.d/lisp/elpa")
 '(vc-annotate-background "#202020")
 '(vc-annotate-color-map
   (quote
    ((20 . "#C99090")
     (40 . "#D9A0A0")
     (60 . "#ECBC9C")
     (80 . "#DDCC9C")
     (100 . "#EDDCAC")
     (120 . "#FDECBC")
     (140 . "#6C8C6C")
     (160 . "#8CAC8C")
     (180 . "#9CBF9C")
     (200 . "#ACD2AC")
     (220 . "#BCE5BC")
     (240 . "#CCF8CC")
     (260 . "#A0EDF0")
     (280 . "#79ADB0")
     (300 . "#89C5C8")
     (320 . "#99DDE0")
     (340 . "#9CC7FB")
     (360 . "#E090C7"))))
 '(vc-annotate-very-old-color "#E090C7")
 '(w3m-home-page "https://fwall.club"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))

