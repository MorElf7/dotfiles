return {
    "mhinz/vim-startify",
    config = function()
        vim.g.startify_custom_header = {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
        }

        vim.g.startify_commands = {
            { s = { "Neovim Settings", "e $MYVIMRC | cd $HOME/dotfiles" } },
            { p = { "Nix Settings", "e $HOME/.config/home-manager/home.nix | cd $HOME/.config/home-manager/" } },
            { l = { "Lazy", "Lazy" } },
            { c = { "Codes", "e $HOME/codes.md" } },
        }
        vim.g.startify_bookmarks = {
            { z = "~/.zshrc" },
        }
    end,
}
