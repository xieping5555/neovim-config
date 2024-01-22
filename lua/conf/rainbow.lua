local ok, rainbow = pcall(require, "rainbow-delimiters")
if not ok then
	vim.notify("rainbow-delimiters not found")
	return
end

local ok2, rainbow_setup = pcall(require, "rainbow-delimiters.setup")
if not ok2 then
	vim.notify("rainbow-delimiters.setup not found")
	return
end

rainbow_setup({
	strategy = {
		[""] = rainbow.strategy["global"],
		commonlisp = rainbow.strategy["local"],
	},
	query = {
		[""] = "rainbow-delimiters",
		latex = "rainbow-blocks",
	},
	highlight = {
		"RainbowDelimiterRed",
		"RainbowDelimiterYellow",
		"RainbowDelimiterBlue",
		"RainbowDelimiterOrange",
		"RainbowDelimiterGreen",
		"RainbowDelimiterViolet",
		"RainbowDelimiterCyan",
	},
	blacklist = { "c", "cpp" },
})
