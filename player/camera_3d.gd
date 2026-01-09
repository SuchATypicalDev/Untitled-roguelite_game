extends SpringArm3D
const CAM_SENS_Y = 0.1 #in rad
const ZOOM_SENS = 60.0;
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		
		rotate_x(-CAM_SENS_Y*event.screen_relative.y*get_process_delta_time())
		if rotation_degrees.x > 30:
			rotation_degrees.x = 30
		elif rotation_degrees.x < -30:
			rotation_degrees.x = -30
	if event.is_action_pressed("wheel_up"):
		spring_length = max(spring_length - ZOOM_SENS * get_process_delta_time(),1.0);
	elif event.is_action_pressed("wheel_down"):
		spring_length = min(spring_length + ZOOM_SENS * get_process_delta_time(),15.0);
