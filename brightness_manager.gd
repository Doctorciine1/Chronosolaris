extends WorldEnvironment

signal brightness_changed(value)

var current_brightness = 1.0

func _ready() -> void:
	load_brightness()
	environment.adjustment_brightness = current_brightness
	emit_signal("brightness_changed", current_brightness)

func set_brightness(value: float) -> void:
	current_brightness = clamp(value, 0.5, 1.5)
	environment.adjustment_brightness = current_brightness
	emit_signal("brightness_changed", current_brightness)
	save_brightness(current_brightness)

func save_brightness(brightness_value: float) -> void:
	var config = ConfigFile.new()
	config.load("user://settings.cfg")
	config.set_value("display", "brightness", brightness_value)
	config.save("user://settings.cfg")

func load_brightness() -> void:
	var config = ConfigFile.new()
	config.load("user://settings.cfg")
	if config.has_section_key("display", "brightness"):
		current_brightness = config.get_value("display", "brightness")
	else:
		current_brightness = 1.0 #яркость по умолчанию
