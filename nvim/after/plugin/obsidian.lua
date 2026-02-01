require "obsidian".setup({
	legacy_commands = false, -- this will be removed in the next major release
	---@param id string
	---@param dir obsidian.Path
	---@return string
	note_id_func = function(id, dir)
		return id
	end,
	workspaces = {
		{
			name = "minimal",
			path = "~/personal/minimal",
		},
	},
	---@class obsidian.config.CompletionOpts
	---
	---@field nvim_cmp? boolean
	---@field blink? boolean
	---@field min_chars? integer
	---@field match_case? boolean
	---@field create_new? boolean
	completion = (function()
		return {
			blink = true,
			min_chars = 2,
			match_case = true,
			create_new = true,
		}
	end)(),

	templates = {
		folder = "templates/",
		date_format = "%Y-%m-%d",
		time_format = "%H:%M",
	},

	frontmatter = {
		enabled = true,
		func = require("obsidian.builtin").frontmatter,
		sort = { "id" },
	},

	---@class obsidian.config.PickerNoteMappingOpts
	---
	---@field new? string
	---@field insert_link? string

	---@class obsidian.config.PickerTagMappingOpts
	---
	---@field tag_note? string
	---@field insert_tag? string

	---@class obsidian.config.PickerOpts
	---
	---@field name obsidian.config.Picker|?
	---@field note_mappings? obsidian.config.PickerNoteMappingOpts
	---@field tag_mappings? obsidian.config.PickerTagMappingOpts
	picker = {
		name = "fzf-lua",
		note_mappings = {
			new = "<C-x>",
			insert_link = "<C-l>",
		},
		tag_mappings = {
			tag_note = "<C-x>",
			insert_tag = "<C-l>",
		},
	},
	notes_subdir = "notes/",
	new_notes_location = "notes/",
})

vim.keymap.set("n", "<leader>on", "<cmd>Obsidian new_from_template<cr>")
vim.keymap.set("n", "<leader>of", "<cmd>Obsidian search<cr>")
