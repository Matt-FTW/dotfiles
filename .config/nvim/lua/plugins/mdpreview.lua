return {
    {
        "mrjones2014/mdpreview.nvim",
        ft = "markdown", -- you can lazy load on markdown files only
        -- requires the `terminal` filetype to render ASCII color and format codes
        dependencies = { "norcalli/nvim-terminal.lua", config = true },
    },
}
