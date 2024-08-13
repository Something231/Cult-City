extends Node2D

var building: bool = false
var buildmaterial = "_"
var buildstate: int = 0
var last_selected: Vector2 = Vector2(0, 0)
var root_selected: Vector2 = Vector2(0, 0)
var selection_state: int = 0
var mouse_pressed: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("b"):
		if selection_state == 0:
			selection_state = 1
		elif selection_state == 1:
			selection_state = 0
		print("selection_state is: ", selection_state)
		
	var selected_tile = get_global_mouse_position()
	var selection_list = []
	if selection_state == 0:
		if selected_tile != last_selected:
			last_selected = selected_tile
			selection_list.append([selected_tile, 1])
			get_tree().call_group("tilemap", "select_tiles", selection_list)
	elif selection_state == 1:
		if mouse_pressed == false:
			if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
				mouse_pressed = true
				root_selected = selected_tile
			else:
				if selected_tile != last_selected:
					last_selected = selected_tile
					selection_list.append([selected_tile, 1])
					get_tree().call_group("tilemap", "select_tiles", selection_list)
		else:
			if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
				mouse_pressed = false
			elif selected_tile != root_selected:
				var root_x: int = floor(root_selected.x)
				var root_y = floor(root_selected.y)
				var cur_x = floor(selected_tile.x)
				var cur_y = floor(selected_tile.y)
				
				var min_x = min(root_x, cur_x)
				var max_x = max(root_x, cur_x)
				var min_y = min(root_y, cur_y)
				var max_y = max(root_y, cur_y)
				
				#~#~#~#~# TODO add tiling for perimiter; i.e. corner tiles, sides
				
				for x in range(min_x, max_x + 1):
					selection_list.append([Vector2(x, root_y), 1])
					selection_list.append([Vector2(x, cur_y), 1])
				
				for y in range(min_y, max_y + 1):
					selection_list.append([Vector2(root_x, y), 1])
					selection_list.append([Vector2(cur_x, y), 1])
				get_tree().call_group("tilemap", "select_tiles", selection_list)

func build_state(button):
	building = not building
	buildmaterial = button
