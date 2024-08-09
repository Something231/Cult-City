extends TileMap

var last_selected: Array = [Vector2i(0, 0)]

func select_tiles(tile_selection):
	print(tile_selection)
	for tile in last_selected:
		erase_cell(1, tile)
	last_selected.clear()
	if tile_selection.size() == 1:
		for t in tile_selection:
			var tile = local_to_map(t)
			set_cell(1, tile, 1, Vector2i(0, 0), 0)
			last_selected.append(tile)
	else:
		pass
