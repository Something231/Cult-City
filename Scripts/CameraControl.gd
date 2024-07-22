extends Camera2D

@export var movement_amount: int = 1
@export var top_boundary: int = -9999
@export var bottom_boundary: int = 9999
@export var left_boundary: int = -9999
@export var right_boundary: int = 9999

func _process(delta):
	if Input.is_action_pressed("move_up") and position.y >= top_boundary:
		position.y -= movement_amount
	elif Input.is_action_pressed("move_down") and position.y <= bottom_boundary:
		position.y += movement_amount
	elif Input.is_action_pressed("move_left") and position.x >= left_boundary:
		position.x -= movement_amount
	elif Input.is_action_pressed("move_right") and position.x <= right_boundary:
		position.x += movement_amount
		
