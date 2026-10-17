for i = 1, 9, 1 do
	hl.workspace_rule({ workspace = tostring(i), monitor = "DP-1" })
	hl.workspace_rule({ workspace = tostring(i + 9), monitor = "HDMI-A-1" })
end
