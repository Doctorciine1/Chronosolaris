extends CanvasLayer

func _ready() -> void:
	var continue_button = $VBoxContainer/ContinueButton
	var settings_button = $VBoxContainer/SettingsButton
	var exit_button = $VBoxContainer/MainMenuButton
	if continue_button:
		continue_button.pressed.connect(_on_continue_button_pressed)
	if settings_button:
		settings_button.pressed.connect(_on_settings_button_pressed)
	if exit_button:
		exit_button.pressed.connect(_on_main_menu_button_pressed)

func _on_settings_button_pressed() -> void:
	SoundManager.play_button_click_sound()
	get_tree().change_scene_to_file("res://options_main_menu.tscn")

func _on_main_menu_button_pressed() -> void:
	# Сбрасываем состояние паузы перед выходом
	SoundManager.play_button_click_sound()
	var manager = get_parent().get_node("ScriptManager")
	if manager and manager.has_method("set_pause_state"):
		manager.set_pause_state(false)
	if manager and manager.has_method("reset_mouse_mode"):
		manager.reset_mouse_mode()  # Сбрасываем курсор перед выходом
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_continue_button_pressed() -> void:
	SoundManager.play_button_click_sound()
	var manager = get_parent().get_node("ScriptManager")
	if manager and manager.has_method("set_pause_state"):
		manager.set_pause_state(false)
