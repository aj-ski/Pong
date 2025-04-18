extends CanvasLayer

signal player1wins
signal player2wins

@onready var player_1_score = $"Player 1 Score"
@onready var player_2_score = $"Player 2 Score"
@onready var player_1_score_box = $"Player 1 Score Box"
@onready var player_2_score_box = $"Player 2 Score Box"
@onready var instructions = $Instructions
@onready var ball = $"../Ball"

var player1Score = 0
var player2Score = 0

func _process(_delta):
	if !ball.first_round:
		instructions.visible = false
	if player1Score >= 5:
		Singleton.player1win = true
		get_tree().change_scene_to_file("res://Scenes/winner_scene.tscn")
		player_1_score = 0
		player_2_score = 0
		ball.first_round = true
	if player2Score >= 5:
		Singleton.player2win = true
		get_tree().change_scene_to_file("res://Scenes/winner_scene.tscn")
		player_1_score = 0
		player_2_score = 0
		ball.first_round = true

func _on_ball_p_1_wins():
	player1Score += 1
	player_1_score.text = "Player 1: " + str(player1Score)
	player_1_score_box.visible = true
	player_2_score_box.visible = true
	player_1_score.visible = true
	player_2_score.visible = true


func _on_ball_p_2_wins():
	player2Score += 1
	player_2_score.text = "Player 2: " + str(player2Score)
	player_1_score_box.visible = true
	player_2_score_box.visible = true
	player_1_score.visible = true
	player_2_score.visible = true
	


func _on_ball_game_started():
	player_1_score_box.visible = false
	player_2_score_box.visible = false
	player_1_score.visible = false
	player_2_score.visible = false
