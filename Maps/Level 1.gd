extends Node2D

var WATER_ENTERED = false
var STEPPED_ON_CONTAMINATED_DIRT = false

func _ready():
	Global.MOB_COUNT = 5
	Global.PLAYER_HEALTH = 100
	$BackgroundMusic.play()

func _process(_delta):
	if WATER_ENTERED:
		get_tree().change_scene_to_file("res://Maps/Level 1.tscn")
	if STEPPED_ON_CONTAMINATED_DIRT:
		Global.PLAYER_HEALTH -= 1

func _on_area_2d_body_entered(_body):
	WATER_ENTERED = true

func _on_area_2d_body_exited(_body):
	WATER_ENTERED = false

func _on_area_2d_2_body_entered(_body):
	STEPPED_ON_CONTAMINATED_DIRT = true

func _on_area_2d_2_body_exited(_body):
	STEPPED_ON_CONTAMINATED_DIRT = false
