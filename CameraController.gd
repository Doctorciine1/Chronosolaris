extends Node3D

@onready var side_view_camera = $"../SideViewCamera"
@onready var main_camera = $"../Player/Head/Camera3D"
var is_side_view_active: bool = false


func _ready() -> void:
	main_camera.current = false
	side_view_camera.current = true




func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_camera_mode"):
		is_side_view_active = !is_side_view_active
	
	main_camera.current = is_side_view_active
	side_view_camera.current = !is_side_view_active

	if is_side_view_active:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		if event.is_action_pressed("leave_to_menu"):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			get_tree().change_scene_to_file("res://main_menu.tscn")

	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if event.is_action_pressed("leave_to_menu"):
			get_tree().change_scene_to_file("res://main_menu.tscn")
