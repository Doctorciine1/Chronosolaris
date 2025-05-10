extends Control

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://root.tscn")


func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://options_main_menu.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
