extends TileMap

var last_selected: Array = [Vector2i(0, 0)]

func select_tiles(tile_selection: Array[Vector2i]):
	print("e")
	for tile in last_selected:
		erase_cell(1, tile)
	
	if tile_selection.size() == 1:
		for t in tile_selection:
			var tile = local_to_map(t)
			set_cell(1, tile, 1, Vector2i(0, 0), 0)
			
	else:
		var max_x = null
		var min_x = null
		var max_y = null
		var min_y = null
