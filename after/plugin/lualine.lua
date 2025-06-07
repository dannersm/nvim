require("lualine").setup({
	sections = {
		lualine_c = {

			{
				'filename',
				path = 1,
			},
			require("vectorcode.integrations").lualine({show_job_count = true})
		}
	},
})
