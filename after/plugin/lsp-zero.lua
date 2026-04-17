vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', '<C-]>', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('i', '<C-]>', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', '<D-]>', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('i', '<C-K>', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>fmt', function() vim.lsp.buf.format() end, opts)
    vim.keymap.set({'n', 'x'}, '<leader>ff', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set('i', '<D-h>', function() vim.lsp.buf.signature_help() end, opts)
  end,
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'rescriptls', 'lua_ls', 'elixirls', 'cssls', 'kotlin_language_server', 'gopls', 'tsserver', 'eslint' },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = lsp_capabilities,
      })
    end,
    lua_ls = function()
      require('lspconfig').lua_ls.setup({
        capabilities = lsp_capabilities,
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT'
            },
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,
              }
            }
          }
        }
      })
    end,
    gopls = function()
      require('lspconfig').gopls.setup({
        capabilities = lsp_capabilities,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
      })
    end,
    tsserver = function()
      require('lspconfig').tsserver.setup({
        capabilities = lsp_capabilities,
        settings = {
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            preferences = {
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
              importModuleSpecifierPreference = 'shortest',
              importModuleSpecifierEnding = 'minimal',
              allowTextChangesInNewFiles = true,
              quotePreference = 'single',
            },
            format = {
              insertSpaceAfterFunctionKeywordForAnonymousFunctions = false,
              insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
              insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
              insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
              insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
              insertSpaceAfterSemicolonInForStatements = true,
              insertSpaceAfterTypeAssertion = false,
              insertSpaceBeforeAndAfterBinaryOperators = true,
              insertSpaceBeforeFunctionParenthesis = false,
              placeOpenBraceOnNewLineForControlBlocks = false,
              placeOpenBraceOnNewLineForFunctions = false,
              semicolons = 'insert',
              trimTrailingWhitespace = true,
            },
            suggest = {
              autoImports = true,
              completeFunctionCalls = true,
              completeJSDocs = true,
              enabled = true,
              paths = true,
              includeAutomaticOptionalChainCompletions = true,
              includeCompletionsForImportStatements = true,
              includeCompletionsWithSnippetText = true,
            },
          },
          javascript = {
            updateImportsOnFileMove = { enabled = "always" },
            preferences = {
              importModuleSpecifierPreference = 'shortest',
              importModuleSpecifierEnding = 'minimal',
              quotePreference = 'single',
            },
            format = {
              insertSpaceAfterFunctionKeywordForAnonymousFunctions = false,
              insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
              insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
              insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
              insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
              insertSpaceAfterSemicolonInForStatements = true,
              insertSpaceBeforeAndAfterBinaryOperators = true,
              insertSpaceBeforeFunctionParenthesis = false,
              placeOpenBraceOnNewLineForControlBlocks = false,
              placeOpenBraceOnNewLineForFunctions = false,
              semicolons = 'insert',
              trimTrailingWhitespace = true,
            },
            suggest = {
              autoImports = true,
              completeFunctionCalls = true,
              completeJSDocs = true,
              enabled = true,
              paths = true,
              includeAutomaticOptionalChainCompletions = true,
              includeCompletionsForImportStatements = true,
              includeCompletionsWithSnippetText = true,
            },
          },
          completions = {
            completeFunctionCalls = true
          }
        },
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      })
    end,
    eslint = function()
      require('lspconfig').eslint.setup({
        capabilities = lsp_capabilities,
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
        settings = {
          codeAction = {
            disableRuleComment = {
              enable = true,
              location = "separateLine"
            },
            showDocumentation = {
              enable = true
            }
          },
          codeActionOnSave = {
            enable = false,
            mode = "all"
          },
          format = true,
          nodePath = "",
          onIgnoredFiles = "off",
          packageManager = "npm",
          quiet = false,
          rulesCustomizations = {},
          run = "onType",
          useESLintClass = false,
          validate = "on",
          workingDirectory = {
            mode = "location"
          }
        }
      })
    end,
  }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip', keyword_length = 2 },
    { name = 'buffer',  keyword_length = 3 },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<Cr>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

vim.cmd [[let g:deoplete#enable_at_startup = 1]]
