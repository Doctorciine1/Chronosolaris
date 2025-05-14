extends Control


@onready var option_button: OptionButton = $HBoxContainer/OptionButton

const WINDOW_MODE_ARRAY : Array[String] = [
	"Full-Screen",
	"Window Mode",
	"Borderless Window",
	"Borderless Full-Screen"
]


func _ready() -> void:
	option_button.item_selected.connect(on_window_mode_selected)


func on_window_mode_selected(index : int) -> void:
	match index:
		0: #Full-Screen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
