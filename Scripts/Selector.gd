extends TileMap

var last_selected: Array = [Vector2i(0, 0)]

func select_tiles(tile_selection: Array[Vector2i]):
	for tile in last_selected:
		erase_cell(1, tile)
	
	if tile_selection.size() == 1:
		for tile in tile_selection:
			set_cell(1, tile, 1, Vector2i(0, 0), 0)
			
	else:
		var max_x = null
		var min_x = null
		var max_y = null
		var min_y = null
