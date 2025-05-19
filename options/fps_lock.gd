extends Control

const FPS_DICTIONARY = {
	0: 0,
	1: 30,
	2: 60,
	3: 144,
	4: 240
}

func _process(delta: float) -> void:
	$HBoxContainer/Fps.text = "FPS: " + str(Engine.get_frames_per_second())

func _on_fps_button_item_selected(_index: int) -> void:
	Engine.max_fps = FPS_DICTIONARY[_index]
