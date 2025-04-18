extends CharacterBody2D

var game_started = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if game_started:
		velocity = Vector2(0, 0)
		if Input.is_action_pressed("Player2_Up"):
			velocity.y = -5
		if Input.is_action_pressed("Player2_Down"):
			velocity.y = 5
			
		move_and_collide(velocity)



func _on_ball_game_started():
	game_started = true

func _on_ball_p_1_wins():
	game_started = false

func _on_ball_p_2_wins():
	game_started = false
