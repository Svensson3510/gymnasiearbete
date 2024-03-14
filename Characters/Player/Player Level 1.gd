extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -300.0
var ENEMY_IN_HITBOX = null
var ENEMY_IN_HURTBOX = null
var ENEMY_IN_DAMAGE_RANGE = false
var ENEMY_IN_ATTACK_RANGE = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$Sprite2D.flip_h = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		Global.JUMPING = true
		velocity.y += gravity * delta
		
	if is_on_floor():
		Global.JUMPING = false

	# Handle Jump.
	if Input.is_key_pressed(KEY_Z) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction == 1:
		$Sprite2D.flip_h = false
		velocity.x = direction * SPEED
	elif direction == -1:
		$Sprite2D.flip_h = true
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _process(_delta):
	if Global.MOB_COUNT <= 0:
		get_tree().change_scene_to_file("res://UI/Victory.tscn")
	if Global.PLAYER_HEALTH <= 0:
		get_tree().change_scene_to_file("res://Maps/Level 1.tscn")
	$CanvasLayer/Label.text = str(Global.PLAYER_HEALTH) + " HP"
	if ENEMY_IN_ATTACK_RANGE:
		Global.PLAYER_HEALTH -= 1
	if Input.is_action_just_pressed("Stab"):
		$StabSwoosh.play()
		if ENEMY_IN_DAMAGE_RANGE:
			$StabImpact.play()
			ENEMY_IN_HITBOX.HEALTH -= 10
			#print('Enemy stabbed')
	if Input.is_key_pressed(KEY_LEFT):
		$Sprite2D.flip_h = true
		$Hitbox/CollisionShape2D.position.x = -10.5
	elif Input.is_key_pressed(KEY_RIGHT):
		$Sprite2D.flip_h = false
		$Hitbox/CollisionShape2D.position.x = 10.5

func _on_hitbox_body_entered(body):
	ENEMY_IN_HITBOX = body
	ENEMY_IN_DAMAGE_RANGE = true

func _on_hitbox_body_exited(_body):
	ENEMY_IN_HITBOX = null
	ENEMY_IN_DAMAGE_RANGE = false

func _on_hurtbox_body_entered(body):
	ENEMY_IN_HURTBOX = body
	ENEMY_IN_ATTACK_RANGE = true

func _on_hurtbox_body_exited(_body):
	ENEMY_IN_HURTBOX = null
	ENEMY_IN_ATTACK_RANGE = false
