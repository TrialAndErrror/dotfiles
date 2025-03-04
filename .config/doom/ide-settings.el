;; Activate virtual env
(after! pyenv-mode
  (defun projectile-pyenv-mode-set ()
    "Set pyenv version matching project name."
    (let ((project (projectile-project-name)))
      (if (member project (pyenv-mode-versions))
          (pyenv-mode-set project)

        (pyvenv-activate "/home/wade/.pyenv/versions/global")
        )
      )

    (add-hook 'projectile-after-switch-project-hook 'projectile-pyenv-mode-set)
    ))


;; Python LSP
(use-package! lsp-pyright
  :ensure t
  :hook (python-mode . (lambda () (require 'lsp-pyright) (lsp))))
(after! lsp-pyright
  (setq lsp-pyright-venv-path "workspace")
  (setq lsp-pyright-auto-import-completions t))


;; Jinja and web QOL improvements
(after! web-mode
  (setq web-mode-engines-alist '(("jinja" . "\\.jinja\\'")))
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t))

;; Use prettier for web files formatting
(after! apheleia
  ;; Add Prettier to the formatter list
  (setf (alist-get 'prettier apheleia-formatters)
        '("npx" "prettier" "--stdin-filepath" buffer-file-name)))

(after! apheleia
  ;; Use Prettier for web-mode (e.g., HTML, Jinja templates)
  (add-to-list 'apheleia-mode-alist '(web-mode . prettier)))

;; Adjust spacing for web files to 4 spaces
(setq-hook! 'js-mode-hook
  js-indent-level 4)

(setq-hook! 'html-mode-hook
  sgml-basic-offset 4)

(setq-hook! 'web-mode-hook
  web-mode-markup-indent-offset 4
  web-mode-code-indent-offset 4
  web-mode-css-indent-offset 4)

;; JQuery support
(add-hook 'js-mode-hook
          (lambda ()
            (setq js-indent-level 2)))

;; Add bootstrap support
(use-package! company-web
  :after company
  :config
  (add-to-list 'company-backends 'company-web-html))

;; Jinja tag support on autocomplete
(defun my-jinja2-path-completion (command &optional arg &rest ignored)
  "Provide completion for Jinja2 `{% include %}` paths."
  (interactive)
  (let ((root (projectile-project-root)) ;; Assumes you're in a Projectile project
        (pattern "templates/**/*.html")) ;; Adjust folder pattern as needed
    (cl-case command
      (init nil)
      (prefix (when (looking-back "{% include \\(\"\\|'" 20)
                (buffer-substring-no-properties
                 (match-beginning 0) (point))))
      (candidates
       (when root
         (mapcar (lambda (path)
                   (file-relative-name path root))
                 (file-expand-wildcards (concat root pattern)))))
      (meta (format "Path: %s" arg)))))

(after! yasnippet
  (yas-define-snippets 'jinja2-mode
                       '(("include" "{% include \"${1:path/to/file}\" %}" "Insert include tag"))))


;; Add support for Snippets
;; (use-package! yasnippet)
;; (use-package! python-snippets)
;; (use-package! web-snippets
