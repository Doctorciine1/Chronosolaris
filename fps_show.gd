extends CanvasLayer


func _process(_delta: float) -> void:
	$Fps.text = "FPS: " + str(Engine.get_frames_per_second())
