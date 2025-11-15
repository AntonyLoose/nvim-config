function Color_Terminal(color)
    color = color or "tokyonight-night"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

local colors = {
    "evergarden",
    "tokyonight-night",
    "xcode"
}

function wrap(x, low, high)
    return ((x - low) % (high - low + 1)) + low
end

local currentColorIndex = 1
vim.keymap.set(
    "n",
    "<leader>nt",
    function()
        Color_Terminal(colors[currentColorIndex])

        local index = currentColorIndex + 1
        currentColorIndex = wrap(index, 0, #colors)
    end
)

-- Leave empty or use evergarden if language not supported.
Color_Terminal(colors[currentColorIndex])
