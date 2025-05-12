extends Control


@onready var option_button: OptionButton = $HBoxContainer/OptionButton


const WINDOW_MODE_ARRAY : Array[String] = [
	"Full-Screen",
	"Window-mode",
	"Borderless Window",
	"Borderless Full-Screen"
]


func _ready() -> void:
