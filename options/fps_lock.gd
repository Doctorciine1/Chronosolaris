extends Control

const FPS_DICTIONARY = {
	0: 30,
	1: 60,
	2: 144,
	3: 240,
	4: 0
}

func _on_fps_button_item_selected(_index: int) -> void:
	Engine.max_fps = FPS_DICTIONARY[_index]
