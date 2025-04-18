extends RigidBody2D

signal game_started
signal p1_wins
signal p2_wins

var velocity = Vector2.ZERO
var first_round = true
var round_started = false
var previous_winner : int

func _input(event):
	if event.is_action_pressed("start"):
		if !round_started:
			emit_signal("game_started")
			if first_round:
				var random_direction = randf_range(0, 1)
				print(random_direction)
				if random_direction < 0.5:
					velocity = Vector2(-3, randf_range(-5, 5))
				else:
					velocity = Vector2(3, randf_range(-5, 5))
				first_round = false
			else:
				velocity = Vector2(3/previous_winner, randf_range(-5, 5))
				
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var collision = move_and_collide(velocity)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		
	if position.x > 1165:
		emit_signal("p1_wins")
		position = Vector2(575, 320)
		previous_winner = -1
		velocity = Vector2.ZERO
	if position.x < -15:
		emit_signal("p2_wins")
		position = Vector2(575, 320)
		previous_winner = 1
		velocity = Vector2.ZERO

func _on_paddle_1_body_entered(body):
	if body is RigidBody2D:
		velocity = Vector2(velocity.x - 1.7, velocity.y)

func _on_paddle_2_body_entered(body):
	if body is RigidBody2D:
		velocity = Vector2(velocity.x + 1.7, velocity.y)
