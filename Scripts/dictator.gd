extends Node2D

var building: bool = false
var buildmaterial = "_"
var buildstate: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func build_state(button):
	building = not building
	buildmaterial = button
var last_selected = Vector2i(0, 0)
var selection_state: int = 0


