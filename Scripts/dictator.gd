extends Node2D

var building: bool = false
var buildmaterial = "_"
var buildstate: int = 0
var last_selected = Vector2(0, 0)
var selection_state: int = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var selected_tile = get_global_mouse_position()
	var selection_list = []
	if selection_state == 0:
		if selected_tile != last_selected:
			last_selected = selected_tile
			selection_list.append(selected_tile)
			get_tree().call_group("tilemap", "select_tiles", selection_list)
	if selection_state == 1:
		if selected_tile != last_selected:
			pass

func build_state(button):
	building = not building
	buildmaterial = button
