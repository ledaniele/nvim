------------------------------
-- Config: auto 
------------------------------

-- Insert boilerplate on new HTML files:
vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.html",
	callback = function()
		local boilerplate = [[
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Default</title>
	</head>
	<body>
    
	</body>
</html>
]]
		vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(boilerplate, "\n"))
	end,
})


-- Insert boilerplate on saved empty HTML files:
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.html",
  callback = function()
    -- Check if buffer is empty (only one line which is empty)
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    if #lines == 1 and lines[1] == "" then
      local boilerplate = [[
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Document</title>
	</head>
	<body>
    
	</body>
</html>
]]
      vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(boilerplate, "\n"))
    end
  end,
})
