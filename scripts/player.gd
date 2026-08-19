extends CharacterBody3D

const SENSITIVITY = 0.003
@onready var Camera = $Camera
var dragging = false

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		dragging = event.pressed
	elif event is InputEventMouseMotion and dragging:
		rotate_y(-event.relative.x * SENSITIVITY)
		Camera.rotate_x(-event.relative.y * SENSITIVITY)
		Camera.rotation.x = clamp(Camera.rotation.x, deg_to_rad(-89), deg_to_rad(89))
