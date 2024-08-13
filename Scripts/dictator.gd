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
		
	var selected_tile = get_global_mouse_position()
	var selection_list = []
	if selection_state == 0:
		if selected_tile != last_selected:
			last_selected = selected_tile
			selection_list.append(selected_tile)
			get_tree().call_group("tilemap", "select_tiles", selection_list)
	elif selection_state == 1:
		if mouse_pressed == false:
			if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
				mouse_pressed = true
				root_selected = selected_tile
		else:
			if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
				mouse_pressed = false
			elif selected_tile != root_selected:
				pass
		
		

func build_state(button):
	building = not building
	buildmaterial = button
