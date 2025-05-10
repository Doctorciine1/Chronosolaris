extends Node3D

@onready var side_view_camera = $"../SideViewCamera"
@onready var main_camera = $"../Player/Head/Camera3D"
@onready var pause_menu = $"../PauseMenu"

var is_side_view_active: bool = false
var is_paused: bool = false:
	set(value):
		is_paused = value
		pause_menu.visible = is_paused
		_update_mouse_mode()

func _ready() -> void:
	main_camera.current = false
	side_view_camera.current = true
	pause_menu.process_mode = Node.PROCESS_MODE_ALWAYS
	pause_menu.visible = false
	_update_mouse_mode()

# Публичный метод для управления паузой из других скриптов
func set_pause_state(paused: bool) -> void:
	is_paused = paused

func _update_mouse_mode():
	if is_paused:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		if is_side_view_active:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause_menu"):
		is_paused = !is_paused
	
	if event.is_action_pressed("toggle_camera_mode") and not is_paused:
		is_side_view_active = !is_side_view_active
		main_camera.current = is_side_view_active
		side_view_camera.current = !is_side_view_active
		_update_mouse_mode()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and not is_paused:
		var mouse_pos = event.position
		var camera = $"../SideViewCamera"
		var from = camera.project_ray_origin(mouse_pos)
		var direction = camera.project_ray_normal(mouse_pos)
		var to = from + direction * 100000

		var space_state = get_world_3d().direct_space_state
		var query = PhysicsRayQueryParameters3D.new()
		query.from = from
		query.to = to

		var result = space_state.intersect_ray(query)

		if result:
			var hit_obj = result["collider"]
			print("Ты попал в: ", hit_obj.name)
