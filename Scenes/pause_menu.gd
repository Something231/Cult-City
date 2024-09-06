extends Control

func resume():
	get_tree().paused = false

func pause():
	get_tree().paused = true
	
func testEsc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		resume()
