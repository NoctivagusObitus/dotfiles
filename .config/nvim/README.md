Neovim config inspired by `Neovim IDE from Scratch - Introduction (100% lua config)`

- youutube: https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=1
- github: https://github.com/LunarVim/Neovim-from-scratch

helpful dap setup AND ALSO HELPFUL general vim tips:

- https://www.youtube.com/watch?v=0moS8UHupGc

make sure to install LSPs via `:Mason`

- black (python)
- bash-debug-adapter
- bash-language-server
- codespell
- debugpy
- delve (golang)
- dockerls
- flake8
- gopls
- hadolint
- isort (python)
- jsonnet-language-server
- marksman (done by prettier?)
- mypy
- prettier
- proselint
- pyright
- shellcheck
- semgrep
- shfmt
- sqls
- sqlls
- sql-formatter (trino support)
- write-good
- xmlformatter
- yaml-language-server
- yamlfmt
- yamllint

install LSP tools:

- `go install mvdan.cc/sh/v3/cmd/gosh@latest`
- `go install github.com/mrjosh/helm-lint-ls@master`
- `export os=linux; export arch=amd64; sudo curl -L https://github.com/mrjosh/helm-ls/releases/download/master/helm_ls_${os}_${arch} --output /usr/local/bin/helm_ls; sudo chmod +x /usr/local/bin/helm_ls;`

install debugging tools (dap)

- `sudo emerge -av dev-go/delve`
