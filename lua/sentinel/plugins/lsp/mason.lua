return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				--        "tsserver",
				"html",
				"cssls",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"angularls",
				"pyright",
				"gopls",
				"rust_analyzer",
				"jdtls",
				"kotlin_language_server",
				--    "scalametals",
				"clangd",
				"cmake",
				"bashls",
				"dockerls",
				"ansiblels",
				"terraformls",
				"helm_ls",
				"jsonls",
				"yamlls",
				"lemminx",
				"marksman",
				"sqls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"gofumpt",
				"goimports",
				"rustfmt",
				"google-java-format",
				"ktfmt",
				"clang-format",
				"shfmt",
				--				"dockfmt",
				"hclfmt",
				"yamlfmt",
				"ansible-lint",
				"sql-formatter",
				"xmlformatter",

				-- Linters
				"eslint_d", -- JS, TS, Svelte, React
				"pylint", -- Python
				"golangci-lint", -- Go
				"rstcheck", -- Rust
				"checkstyle", -- Java
				"ktlint", -- Kotlin
				"cpplint", -- C, C++
				"shellcheck", -- Shell
				"hadolint", -- Docker
				"yamllint", -- YAML
				"jsonlint", -- JSON
				"tflint", -- Terraform
				"ansible-lint", -- Ansible
				"sqlfluff", -- SQL
				"stylelint", -- CSS, SCSS, Less
			},
		})
	end,
}
