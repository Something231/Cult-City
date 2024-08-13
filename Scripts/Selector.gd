extends TileMap

var last_selected: Array = [Vector2i(0, 0)]

func select_tiles(tile_selection):
	for tile in last_selected:
		erase_cell(1, tile)
	last_selected.clear()
	for t in tile_selection:
		var tile = local_to_map(t[0])
		set_cell(1, tile, t[1], Vector2i(0, 0), 0)
		last_selected.append(tile)
