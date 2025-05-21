extends Node

var button_click_player: AudioStreamPlayer

func _ready() -> void:
	button_click_player = AudioStreamPlayer.new()
	add_child(button_click_player)
	var click_sound = load("res://sound/sfx.wav")
	if click_sound:
		button_click_player.stream = click_sound
	else:
		print("Ошибка звук не загружен")
	button_click_player.bus = "Sounds"

func play_button_click_sound():
		if button_click_player and button_click_player.stream:
			button_click_player.play()
		else:
			print("Ошибка: AudioStreamPlayer не готов")
