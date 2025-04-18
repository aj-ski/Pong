extends Node

@onready var winner_label = $"Winner Label"

func _process(_delta):
	if Singleton.player1win:
		winner_label.text = "Player   1   Wins!"
	if Singleton.player2win:
		winner_label.text = "Player   2   Wins!"

func _on_return_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	Singleton.player1win = false
	Singleton.player2win = false
	
	
	


