function Manager:render(area)
	local chunks = ui.Layout()
		:direction(ui.Direction.HORIZONTAL)
		:constraints({
			ui.Constraint.Ratio(MANAGER.layout.parent, MANAGER.layout.all),
			ui.Constraint.Ratio(MANAGER.layout.current, MANAGER.layout.all),
			ui.Constraint.Ratio(MANAGER.layout.preview, MANAGER.layout.all),
		})
		:split(area)

	local bar = function(c, x, y)
		return ui.Bar(ui.Rect({ x = math.max(0, x), y = math.max(0, y), w = 1, h = 1 }), ui.Position.TOP):symbol(c)
	end

	return utils.flat({
		ui.Border(area, ui.Position.ALL):type(ui.Border.ROUNDED),
		ui.Bar(chunks[1], ui.Position.RIGHT),
		ui.Bar(chunks[3], ui.Position.LEFT),

		bar("┬", chunks[1].right - 1, chunks[1].y),
		bar("┴", chunks[1].right - 1, chunks[1].bottom - 1),
		bar("┬", chunks[2].right, chunks[2].y),
		bar("┴", chunks[2].right, chunks[1].bottom - 1),

		-- Parent
		Folder:render(chunks[1]:padding(ui.Padding.xy(1)), { kind = Folder.PARENT }),
		-- Current
		Folder:render(chunks[2]:padding(ui.Padding.y(1)), { kind = Folder.CURRENT }),
		-- Preview
		ui.Base(chunks[3]:padding(ui.Padding.xy(1)), ui.Base.PREVIEW),
	})
end
