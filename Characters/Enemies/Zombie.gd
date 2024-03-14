extends CharacterBody2D

var SPEED_DIVIDER = 70
var PLAYER = null
var PLAYER_CHASE = false
var PLAYER_IN_RANGE = false
var HEALTH = 100

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	#position.x = 100
	#position.y = 208
	pass

func _process(_delta):
	if HEALTH <= 0:
		$ZombieKilled.play()
	$Label.text = str(HEALTH) + " HP"

func _physics_process(_delta):
	if HEALTH <= 0:
		position.x = -100000
		hide()
		Global.MOB_COUNT -= 1
		HEALTH = 100
	if PLAYER_CHASE:
		position.x += (PLAYER.position.x - position.x)/SPEED_DIVIDER
	
	move_and_slide()

func _on_area_2d_body_entered(body):
	PLAYER = body
	PLAYER_CHASE = true

func _on_area_2d_body_exited(_body):
	PLAYER = null
	PLAYER_CHASE = false
