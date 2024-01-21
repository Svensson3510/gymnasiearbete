extends Node2D

var Eggs_Per_Second = 1
var Eggs_Upgrade_Cost = 30

var Gold_Eggs_Per_Second = 0.3
var Gold_Eggs_Upgrade_Cost = 60

var Enchanted_Eggs_Per_Second = 0.15
var Enchanted_Eggs_Upgrade_Cost = 20

func _ready():
	$CanvasLayer/Control/Panel/Eggs.text = str(Global.Eggs)
	$"CanvasLayer/Control/Panel/Eggs Upgrade".text = str(Eggs_Per_Second) + "/s"
	$"CanvasLayer/Control/Panel/Eggs Upgrade Cost".text = str(Eggs_Upgrade_Cost)
	$"CanvasLayer/Control/Panel/Gold Eggs".text = str(Global.Gold_Eggs)
	$"CanvasLayer/Control/Panel/Gold Eggs Upgrade".text = str(Gold_Eggs_Per_Second) + "/s"
	$"CanvasLayer/Control/Panel/Gold Eggs Upg Cost".text = str(Gold_Eggs_Upgrade_Cost)
	$"CanvasLayer/Control/Panel/Enchanted Eggs".text = str(Global.Enchanted_Eggs)
	$"CanvasLayer/Control/Panel/Ench Eggs Upgrade".text = str(Enchanted_Eggs_Per_Second) + "/s"
	$"CanvasLayer/Control/Panel/Ench Eggs Upg Cost".text = str(Enchanted_Eggs_Upgrade_Cost)
	$CanvasLayer/Control/PanelContainer/Coins.text = str(Global.Coins)
	$CanvasLayer/Control/PanelContainer2/Tokens.text = str(Global.Tokens)
	$Timer.start()
	$BackgroundMusic.play()
	

func _on_timer_timeout():
	Global.Eggs += Eggs_Per_Second
	Global.Gold_Eggs += Gold_Eggs_Per_Second
	Global.Gold_Eggs_Integer = Global.Gold_Eggs
	Global.Enchanted_Eggs += Enchanted_Eggs_Per_Second
	Global.Enchanted_Eggs_Integer = Global.Enchanted_Eggs
	$CanvasLayer/Control/Panel/Eggs.text = str(Global.Eggs)
	$"CanvasLayer/Control/Panel/Gold Eggs".text = str(Global.Gold_Eggs_Integer)
	$"CanvasLayer/Control/Panel/Enchanted Eggs".text = str(Global.Enchanted_Eggs_Integer)

func _on_eggs_upgrade_pressed():
	if Global.Eggs >= Eggs_Upgrade_Cost:
		$ButtonClick.play()
		Global.Eggs -= Eggs_Upgrade_Cost
		$CanvasLayer/Control/Panel/Eggs.text = str(Global.Eggs)
		Eggs_Per_Second += 1
		$"CanvasLayer/Control/Panel/Eggs Upgrade".text = str(Eggs_Per_Second) + "/s"
		Eggs_Upgrade_Cost = round(Eggs_Upgrade_Cost * 2.4)
		$"CanvasLayer/Control/Panel/Eggs Upgrade Cost".text = str(Eggs_Upgrade_Cost)
	else:
		#print("Not enough eggs!")
		pass

func _on_gold_eggs_upgrade_pressed():
	if Global.Eggs >= Gold_Eggs_Upgrade_Cost:
		$ButtonClick.play()
		$"CanvasLayer/Control/Panel/Gold Eggs".text = str(Global.Gold_Eggs_Integer)
		Global.Eggs -= Gold_Eggs_Upgrade_Cost
		$CanvasLayer/Control/Panel/Eggs.text = str(Global.Eggs)
		Gold_Eggs_Per_Second += 0.25
		$"CanvasLayer/Control/Panel/Gold Eggs Upgrade".text = str(Gold_Eggs_Per_Second) + "/s"
		Gold_Eggs_Upgrade_Cost = round(Gold_Eggs_Upgrade_Cost * 3.2)
		$"CanvasLayer/Control/Panel/Gold Eggs Upg Cost".text = str(Gold_Eggs_Upgrade_Cost)
	else:
		#print("Not enough eggs!")
		pass

func _on_ench_eggs_upgrade_pressed():
	if Global.Gold_Eggs >= Enchanted_Eggs_Upgrade_Cost:
		$ButtonClick.play()
		$"CanvasLayer/Control/Panel/Enchanted Eggs".text = str(Global.Enchanted_Eggs_Integer)
		Global.Gold_Eggs -= Enchanted_Eggs_Upgrade_Cost
		Global.Gold_Eggs_Integer = Global.Gold_Eggs
		$"CanvasLayer/Control/Panel/Gold Eggs".text = str(Global.Gold_Eggs_Integer)
		Enchanted_Eggs_Per_Second += 0.05
		$"CanvasLayer/Control/Panel/Ench Eggs Upgrade".text = str(Enchanted_Eggs_Per_Second) + "/s"
		Enchanted_Eggs_Upgrade_Cost = round(Enchanted_Eggs_Upgrade_Cost * 3.8)
		$"CanvasLayer/Control/Panel/Ench Eggs Upg Cost".text = str(Enchanted_Eggs_Upgrade_Cost)
	else:
		#print("Not enough gold eggs!")
		pass

func _on_get_coins_pressed():
	if Global.Gold_Eggs >= 10:
		$ButtonClick.play()
		Global.Coins += 25
		$CanvasLayer/Control/PanelContainer/Coins.text = str(Global.Coins)
		Global.Gold_Eggs -= 10
		Global.Gold_Eggs_Integer = Global.Gold_Eggs
		$"CanvasLayer/Control/Panel/Gold Eggs".text = str(Global.Gold_Eggs_Integer)
	else:
		#print("Not enough gold eggs!")
		pass

func _on_get_token_pressed():
	if Global.Coins >= 10 and Global.Enchanted_Eggs >= 5:
		$ButtonClick.play()
		Global.Tokens += 5
		$CanvasLayer/Control/PanelContainer2/Tokens.text = str(Global.Tokens)
		Global.Coins -= 10
		$CanvasLayer/Control/PanelContainer/Coins.text = str(Global.Coins)
		Global.Enchanted_Eggs -= 5
		Global.Enchanted_Eggs_Integer = Global.Enchanted_Eggs
		$"CanvasLayer/Control/Panel/Enchanted Eggs".text = str(Global.Enchanted_Eggs_Integer)
	else:
		#print("Not enough coins and enchanted eggs!")
		pass

func _process(_delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene_to_file("res://UI/Start Menu.tscn")
	$CanvasLayer/Control/PanelContainer/Coins.text = str(Global.Coins)
	$CanvasLayer/Control/PanelContainer2/Tokens.text = str(Global.Tokens)
	if Global.dash == true:
		$CanvasLayer/Control/Panel3/Dash.show()
	if Global.fireball == true:
		$CanvasLayer/Control/Panel3/Fireball.show()
	if Global.shield == true:
		$CanvasLayer/Control/Panel3/Shield.show()
