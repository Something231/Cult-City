extends TileMap

var last_selected = Vector2i(0, 0)
var selection_state: int = 0

func _process(_delta):
	if selection_state == 0:
		var selected_tile = local_to_map(get_global_mouse_position())
		erase_cell(1, last_selected)
		set_cell(1, selected_tile, 1, Vector2i(0, 0), 0)
		last_selected = selected_tile
