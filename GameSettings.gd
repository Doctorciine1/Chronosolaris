extends Node

signal settings_loaded() 

func _ready() -> void:
	load_audio_settings()
	emit_signal("settings_loaded") 

func load_audio_settings() -> void:
	var config = ConfigFile.new()
	config.load("user://settings.cfg")

	# Загрузка громкости мастер-шины
	if config.has_section_key("audio", "master_volume"):
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(config.get_value("audio", "master_volume")))
	else:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(0.5)) 

	if config.has_section_key("audio", "music_volume"):
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(config.get_value("audio", "music_volume")))
	else:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(0.5)) # Значение по умолчанию

	# Загрузка громкости шины звуков
	if config.has_section_key("audio", "sounds_volume"):
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sounds"), linear_to_db(config.get_value("audio", "sounds_volume")))
	else:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sounds"), linear_to_db(0.5)) # Значение по умолчанию

func save_volume(bus_name: String, volume_value: float) -> void:
	var config = ConfigFile.new()
	config.load("user://settings.cfg")
	config.set_value("audio", bus_name + "_volume", volume_value)
	config.save("user://settings.cfg")

func save_mute_state(is_muted: bool) -> void:
	var config = ConfigFile.new()
	config.load("user://settings.cfg")
	config.set_value("audio", "muted", is_muted)
	config.save("user://settings.cfg")
