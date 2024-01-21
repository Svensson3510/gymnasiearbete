extends Node2D

var pressed1 = false
var pressed2 = false
var pressed3 = false

func _process(_delta):
	pass

func _on_button_pressed():
	if Global.Coins >= 100 && Global.Tokens >= 30 && pressed1 == false:
		$ButtonClick.play()
		Global.Coins -= 100
		Global.Tokens -= 30
		pressed1 = true
		Global.dash = true
	else:
		#print("Not enough coins or tokens!")
		pass

func _on_button_2_pressed():
	if Global.Coins >= 150 && Global.Tokens >= 50 && pressed2 == false:
		$ButtonClick.play()
		Global.Coins -= 150
		Global.Tokens -= 50
		pressed2 = true
		Global.fireball = true
	else:
		#print("Not enough coins or tokens!")
		pass

func _on_button_3_pressed():
	if Global.Coins >= 200 && Global.Tokens >= 80 && pressed3 == false:
		$ButtonClick.play()
		Global.Coins -= 200
		Global.Tokens -= 80
		pressed3 = true
		Global.shield = true
	else:
		#print("Not enough coins or tokens!")
		pass
