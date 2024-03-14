extends AnimationPlayer

var ATTACK = false
var DIRECTION = "right"

func _ready():
	pass

func _process(_delta):
	if Input.is_action_just_pressed("Stab"):
		play("Stab")
	elif Global.JUMPING == true and not is_playing():
		play("Idle")
	elif Input.is_key_pressed(KEY_RIGHT) and not is_playing():
		play("Moving")
	elif Input.is_key_pressed(KEY_LEFT) and not is_playing():
		play("Moving")
	elif not is_playing():
		play("Idle")
