extends CanvasLayer


func _on_settings_button_pressed() -> void:
	print("Открываем настройки из меню паузы")
	get_tree().change_scene_to_file("res://options_main_menu.tscn")

func _on_main_menu_button_pressed() -> void:
	# Сбрасываем состояние паузы перед выходом
	var manager = get_parent().get_node("ScriptManager")
	if manager and manager.has_method("set_pause_state"):
		manager.set_pause_state(false)
	if manager and manager.has_method("reset_mouse_mode"):
		manager.reset_mouse_mode()  # Сбрасываем курсор перед выходом
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_continue_button_pressed() -> void:
	var manager = get_parent().get_node("ScriptManager")
	if manager and manager.has_method("set_pause_state"):
		manager.set_pause_state(false)
