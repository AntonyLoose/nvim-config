# nvim-config

## 1. Clone Repository

```
git clone git@github.com:AntonyLoose/nvim-config.git
```

## 2. Install Language Servers

You can find a list of language servers [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#html).
You can also use `help lspconfig-all` to bring up all the lsps.

Look at `lsp.lua` to see which servers you should install.

## 2a. Install Latex

The following installs the base:

```bash
sudo apt install texlive-full latexmk
sudo apt update
sudo apt install zathura zathura-pdf-poppler
```

This following installs the packages you will likely need:

```bash
tlmgr init-usertree
tlmgr install etoolbox
tlmgr install hyperref
```

## 3. Run Neovim

When you do this `lazy.nvim` will automatically download dependencies.

---

Happy editing :)

