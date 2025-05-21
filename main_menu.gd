extends Control

func _ready() -> void:
	var start_button = $VBoxContainer/StartButton
	var settings_button = $VBoxContainer/SettingsButton
	var exit_button = $VBoxContainer/ExitButton
	if start_button:
		start_button.pressed.connect(_on_start_button_pressed)
	if settings_button:
		settings_button.pressed.connect(_on_options_button_pressed)
	if exit_button:
		exit_button.pressed.connect(_on_exit_button_pressed)

func _on_start_button_pressed() -> void:
	SoundManager.play_button_click_sound()
	get_tree().change_scene_to_file("res://root.tscn")


func _on_options_button_pressed() -> void:
	SoundManager.play_button_click_sound()
	get_tree().change_scene_to_file("res://options_main_menu.tscn")


func _on_exit_button_pressed() -> void:
	SoundManager.play_button_click_sound()
	get_tree().quit()
