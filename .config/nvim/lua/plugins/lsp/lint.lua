return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			c = { "cpplint", "codespell" },
			dockerfile = { "hadolint", "codespell" },
			diff = { "codespell", "proselint" },
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			markdown = { "codespell", "proselint" },
			proto = { "buf_lint", "codespell" },
			python = { "pylint", "codespell" },
			rust = { "codespell" },
			sh = { "shellcheck", "codespell" },
			svelte = { "eslint_d" },
			text = { "codespell", "proselint" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			yaml = { "yamllint", "codespell" },
			-- go = { "staticcheck" }, // staticchek should be part of gopls and golangci is slow
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
