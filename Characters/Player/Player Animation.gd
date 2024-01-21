extends AnimationPlayer

func _ready():
	pass

func _process(_delta):
	if Input.is_key_pressed(KEY_DOWN) and Input.is_key_pressed(KEY_UP) or Input.is_key_pressed(KEY_LEFT) and Input.is_key_pressed(KEY_RIGHT):
		speed_scale = 3
		play("Idle")
	elif Input.is_key_pressed(KEY_DOWN) and Input.is_key_pressed(KEY_CTRL):
		speed_scale = 4
		play("Moving_Forward")
	elif Input.is_key_pressed(KEY_DOWN):
		speed_scale = 3
		play("Moving_Forward")
	elif Input.is_key_pressed(KEY_UP) and Input.is_key_pressed(KEY_CTRL):
		speed_scale = 4
		play("Moving_Backward")
	elif Input.is_key_pressed(KEY_UP):
		speed_scale = 3
		play("Moving_Backward")
	elif Input.is_key_pressed(KEY_LEFT) and Input.is_key_pressed(KEY_CTRL):
		speed_scale = 4
		play("Moving_Left")
	elif Input.is_key_pressed(KEY_LEFT):
		speed_scale = 3
		play("Moving_Left")
	elif Input.is_key_pressed(KEY_RIGHT) and Input.is_key_pressed(KEY_CTRL):
		speed_scale = 4
		play("Moving_Right")
	elif Input.is_key_pressed(KEY_RIGHT):
		speed_scale = 3
		play("Moving_Right")
	else:
		speed_scale = 2.5
		play("Idle")
	pass
