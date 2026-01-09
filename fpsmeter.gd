extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(DisplayServer.window_get_vsync_mode() == 1):
		text = "FPS: "+var_to_str(Engine.get_frames_per_second()) + "\nV-SYNC: ON" + "\nDELTA: "+var_to_str(get_process_delta_time())
	else:
		text = "FPS: "+var_to_str(Engine.get_frames_per_second()) + "\nV-SYNC: OFF" + "\nDELTA: "+var_to_str(get_process_delta_time())
