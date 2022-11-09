{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      #theme
      catppuccin-nvim
      #barbar-nvim
      #lualine-nvim
      #nvim-colorizer-lua
      gitsigns-nvim
      nvim-treesitter
      #bufferline-nvim
      vim-devicons
      indent-blankline-nvim
      nerdcommenter
      # A File Explorer / icons
      nvim-tree-lua
      nvim-web-devicons
      # Configs for the Nvim LSP client
      nvim-lspconfig
      cmp-nvim-lsp
      # A completion engine plugin for neovim written in Lua.
      nvim-cmp
      cmp-buffer
      cmp-path
      cmp-cmdline
      # VSCode(LSP)'s snippet feature in vim.
      cmp-vsnip
      vim-vsnip
      # Extra rust tools for writing applications using the native lsp. 
      rust-tools-nvim
      # Support for writing Nix expressions
      vim-nix
    ];
    extraConfig = ''
      """ GENERAL SETTINGS
      set number relativenumber
      " switch buffer shift + vim key
      nmap <S-l> :bnext<CR>
      nmap <S-h> :bprevious<CR>
      " switch window ctrl + vim key
      nmap <silent> <C-h> :wincmd h<CR>
      nmap <silent> <C-j> :wincmd j<CR>
      nmap <silent> <C-k> :wincmd k<CR>
      nmap <silent> <C-l> :wincmd l<CR>
      " escape
      imap jj <Esc>

      " FIXME: NVIM TREE AUTO CLOSE
      autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

      lua << EOF
        require('gitsigns').setup()

        -- GENERAL SETTINGS

        -- THEME
        require("catppuccin").setup({
           transparent_background = false
        })
        vim.cmd.colorscheme "catppuccin"

        -- require('lualine').setup {
          -- options = {
          -- theme = "catppuccin"
          -- }
        -- }

        -- BUFFERLINE
        -- require("bufferline").setup{}

        -- INDENT BLANKLINE
        require("indent_blankline").setup {}

        -- NVIM TREE
        require("nvim-tree").setup({
          open_on_setup = true,
          view = {
            width = 50,
          },
          renderer = {
            add_trailing = true,
            highlight_git = true,
            highlight_opened_files = "all",
          },
        })

        -- NERD COMMENTER
        vim.g.mapleader = "c"

        -- CMP
        local cmp = require'cmp'

        cmp.setup({
          snippet = {
            expand = function(args)
              vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            end,
          },
          window = {
          },
          mapping = cmp.mapping.preset.insert({
            ['<C-k>'] = cmp.mapping.select_prev_item(select_opts),
            ['<C-j>'] = cmp.mapping.select_next_item(select_opts),
            ['<C-p>'] = cmp.mapping.scroll_docs(-4),
            ['<C-y>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
          }),
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
          }, {
            { name = 'buffer' },
          })
        })

        cmp.setup.filetype('gitcommit', {
          sources = cmp.config.sources({
            { name = 'cmp_git' },
          }, {
            { name = 'buffer' },
          })
        })

        cmp.setup.cmdline('/', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer' }
          }
        })

        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' }
          }, {
            { name = 'cmdline' }
          })
        })

        -- RUST TOOLS
        local opts = {
          tools = {
            inlay_hints = {
              auto = false,
            },
          },
        }
        require('rust-tools').setup(opts)

      EOF
    '';
  };
}
