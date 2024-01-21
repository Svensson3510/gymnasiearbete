extends CharacterBody2D

const SPEED = 150.0
const SPEED_INCREASE = 2

var zoom_minimum = Vector2(.6000001, .6000001)
var zoom_maximum = Vector2(1.5000001, 1.5000001)
var zoom_speed = Vector2(.1000001, .1000001)

@onready var camera = $Camera2D

func _physics_process(_delta):
	var horizontal_direction = Input.get_axis("ui_left", "ui_right")
	var vertical_direction = Input.get_axis("ui_up", "ui_down")
	var CTRL = Input.is_key_pressed(KEY_CTRL)
	if horizontal_direction and vertical_direction and CTRL:
		velocity.x = horizontal_direction * (SPEED - 50) * SPEED_INCREASE
		velocity.y = vertical_direction * (SPEED - 50) * SPEED_INCREASE
	elif horizontal_direction and CTRL:
		velocity.x = horizontal_direction * SPEED * SPEED_INCREASE
		velocity.y = move_toward(velocity.y, 0, SPEED) * SPEED_INCREASE
	elif vertical_direction and CTRL:
		velocity.y = vertical_direction * SPEED * SPEED_INCREASE
		velocity.x = move_toward(velocity.x, 0, SPEED) * SPEED_INCREASE
	elif horizontal_direction and vertical_direction:
		velocity.x = horizontal_direction * (SPEED - 50)
		velocity.y = vertical_direction * (SPEED - 50)
	elif horizontal_direction:
		velocity.x = horizontal_direction * SPEED
		velocity.y = move_toward(velocity.y, 0, SPEED)
	elif vertical_direction:
		velocity.y = vertical_direction * SPEED
		velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				if camera.zoom > zoom_minimum:
					camera.zoom -= zoom_speed
					pass
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				if camera.zoom < zoom_maximum:
					camera.zoom += zoom_speed
