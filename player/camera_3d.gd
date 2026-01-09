extends SpringArm3D
const CAM_SENS_Y = 0.001 #in rad
const ZOOM_SENS = 0.6;
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		
		rotate_x(-CAM_SENS_Y*event.screen_relative.y)
		if rotation_degrees.x > 30:
			rotation_degrees.x = 30
		elif rotation_degrees.x < -30:
			rotation_degrees.x = -30
	if event.is_action_pressed("wheel_up"):
		spring_length = max(spring_length - ZOOM_SENS ,1.0);
	elif event.is_action_pressed("wheel_down"):
		spring_length = min(spring_length + ZOOM_SENS,15.0);
