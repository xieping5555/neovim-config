local config = {}

config.nvim_lsputils = function()
    if vim.fn.has("nvim-0.5.1") == 1 then
        vim.lsp.handlers["textDocument/codeAction"] = require(
                                                          "lsputil.codeAction").code_action_handler
        vim.lsp.handlers["textDocument/references"] = require(
                                                          "lsputil.locations").references_handler
        vim.lsp.handlers["textDocument/definition"] = require(
                                                          "lsputil.locations").definition_handler
        vim.lsp.handlers["textDocument/declaration"] = require(
                                                           "lsputil.locations").declaration_handler
        vim.lsp.handlers["textDocument/typeDefinition"] = require(
                                                              "lsputil.locations").typeDefinition_handler
        vim.lsp.handlers["textDocument/implementation"] = require(
                                                              "lsputil.locations").implementation_handler
        vim.lsp.handlers["textDocument/documentSymbol"] = require(
                                                              "lsputil.symbols").document_handler
        vim.lsp.handlers["workspace/symbol"] =
            require("lsputil.symbols").workspace_handler
    else
        local bufnr = vim.api.nvim_buf_get_number(0)

        vim.lsp.handlers["textDocument/codeAction"] =
            function(_, _, actions)
                require("lsputil.codeAction").code_action_handler(nil, actions,
                                                                  nil, nil, nil)
            end

        vim.lsp.handlers["textDocument/references"] =
            function(_, _, result)
                require("lsputil.locations").references_handler(nil, result, {
                    bufnr = bufnr
                }, nil)
            end

        vim.lsp.handlers["textDocument/definition"] =
            function(_, method, result)
                require("lsputil.locations").definition_handler(nil, result, {
                    bufnr = bufnr,
                    method = method
                }, nil)
            end

        vim.lsp.handlers["textDocument/declaration"] = function(_, method,
                                                                result)
            require("lsputil.locations").declaration_handler(nil, result, {
                bufnr = bufnr,
                method = method
            }, nil)
        end

        vim.lsp.handlers["textDocument/typeDefinition"] = function(_, method,
                                                                   result)
            require("lsputil.locations").typeDefinition_handler(nil, result, {
                bufnr = bufnr,
                method = method
            }, nil)
        end

        vim.lsp.handlers["textDocument/implementation"] = function(_, method,
                                                                   result)
            require("lsputil.locations").implementation_handler(nil, result, {
                bufnr = bufnr,
                method = method
            }, nil)
        end

        vim.lsp.handlers["textDocument/documentSymbol"] =
            function(_, _, result, _, bufn)
                require("lsputil.symbols").document_handler(nil, result,
                                                            {bufnr = bufn}, nil)
            end

        vim.lsp.handlers["textDocument/symbol"] =
            function(_, _, result, _, bufn)
                require("lsputil.symbols").workspace_handler(nil, result,
                                                             {bufnr = bufn}, nil)
            end
    end
end

config.lsp_saga = function()
    require("lspsaga").setup { -- defaults ...
        debug = false,
        use_saga_diagnostic_sign = true,
        -- diagnostic sign
        error_sign = "",
        warn_sign = "",
        hint_sign = "",
        infor_sign = "",
        diagnostic_header_icon = "   ",
        -- code action title icon
        code_action_icon = " ",
        code_action_prompt = {
            enable = true,
            sign = true,
            sign_priority = 40,
            virtual_text = true
        },
        finder_definition_icon = "  ",
        finder_reference_icon = "  ",
        max_preview_lines = 10,
        finder_action_keys = {
            open = "o",
            vsplit = "s",
            split = "i",
            quit = "q",
            scroll_down = "<C-f>",
            scroll_up = "<C-b>"
        },
        code_action_keys = {quit = "q", exec = "<CR>"},
        rename_action_keys = {quit = "<C-c>", exec = "<CR>"},
        definition_preview_icon = "  ",
        border_style = "single",
        rename_prompt_prefix = "➤",
        rename_output_qflist = {enable = false, auto_open_qflist = false},
        server_filetype_map = {},
        diagnostic_prefix_format = "%d. ",
        diagnostic_message_format = "%m %c",
        highlight_prefix = false
    }
end

config.fidget = function()
    require("fidget").setup {
        text = {
            spinner = "pipe", -- animation shown when tasks are ongoing
            done = "✔", -- character shown when all tasks are complete
            commenced = "Started", -- message shown when task starts
            completed = "Completed" -- message shown when task completes
        },
        align = {
            bottom = true, -- align fidgets along bottom edge of buffer
            right = true -- align fidgets along right edge of buffer
        },
        timer = {
            spinner_rate = 125, -- frame rate of spinner animation, in ms
            fidget_decay = 2000, -- how long to keep around empty fidget, in ms
            task_decay = 1000 -- how long to keep around completed task, in ms
        },
        window = {
            relative = "editor", -- where to anchor, either "win" or "editor"
            blend = 100, -- &winblend for the window
            zindex = nil -- the zindex value for the window
        },
        fmt = {
            leftpad = true, -- right-justify text in fidget box
            stack_upwards = true, -- list of tasks grows upwards
            max_width = 0, -- maximum width of the fidget box
            fidget = -- function to format fidget title
            function(fidget_name, spinner)
                return string.format("%s %s", spinner, fidget_name)
            end,
            task = -- function to format each task line
            function(task_name, message, percentage)
                return string.format("%s%s [%s]", message, percentage and
                                         string.format(" (%s%%)", percentage) or
                                         "", task_name)
            end
        }
    }
end

config.lsp_signature = function() require"lsp_signature".setup {} end

return config
