extends Node2D

var building: bool = false
var buildmaterial = "_"
var buildstate: int = 0
var last_selected = Vector2(0, 0)
var selection_state: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if selection_state == 0:
		var selected_tile = get_global_mouse_position()
		if selected_tile != last_selected:
			last_selected = selected_tile
			var selection_list = []
			selection_list.append(selected_tile)
			get_tree().call_group("tilemap", "select_tiles", selection_list)

func build_state(button):
	building = not building
	buildmaterial = button



