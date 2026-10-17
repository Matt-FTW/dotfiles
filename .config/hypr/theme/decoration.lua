local colors = require("theme.colors")

local function convert_alpha_color(alpha, suffix)
	return "rgba(" .. alpha .. suffix .. ")"
end

hl.config({
	general = {
		border_size = 2,
		col = {
			active_border = convert_alpha_color(colors.lavenderAlpha, "B0"),
			inactive_border = convert_alpha_color(colors.textAlpha, "40"),
		},
		gaps_in = 4,
		gaps_out = 9,
	},
	decoration = {
		rounding = 4,
		active_opacity = 1,
		inactive_opacity = 1,
		blur = {
			enabled = true,
			size = 5,
			passes = 4,
			ignore_opacity = true,
			new_optimizations = true,
			xray = false,
			noise = 0.0,
			popups = true,
		},
		shadow = {
			enabled = false,
			range = 10,
			scale = 2,
			render_power = 5,
			color = colors.surface0,
			color_inactive = colors.crust,
		},
		dim_inactive = false,
		dim_strength = 0.05,
	},
	group = {
		col = {
			border_inactive = { colors = { convert_alpha_color(colors.lavenderAlpha, "69") } },
			border_active = {
				colors = {
					convert_alpha_color(colors.textAlpha, "ee"),
					convert_alpha_color(colors.lavenderAlpha, "68"),
					convert_alpha_color(colors.lavenderAlpha, "69"),
					convert_alpha_color(colors.textAlpha, "ee"),
					angle = 45,
				},
			},
			border_locked_inactive = { colors = { convert_alpha_color(colors.lavenderAlpha, "69") } },
			border_locked_active = {
				colors = {
					convert_alpha_color(colors.textAlpha, "ee"),
					convert_alpha_color(colors.lavenderAlpha, "68"),
					convert_alpha_color(colors.lavenderAlpha, "69"),
					convert_alpha_color(colors.textAlpha, "ee"),
					angle = 45,
				},
			},
		},
		groupbar = {
			gradients = true,
			gradient_rounding = 7,
			indicator_height = 0,
			gradient_round_only_edges = true,
			col = {
				active = convert_alpha_color(colors.lavenderAlpha, "CC"),
				inactive = convert_alpha_color(colors.subtext1Alpha, "99"),
				locked_active = convert_alpha_color(colors.maroonAlpha, "CC"),
				locked_inactive = convert_alpha_color(colors.subtext1Alpha, "99"),
			},
			font_family = "Maple Mono NF",
			font_size = 15,
			text_color = colors.crust,
			height = 20,
		},
	},
})
