extends CharacterBody2D

@export var moves_left = 0

func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("down"):
		move_down()
	elif event.is_action_pressed("left"):
		move_left()
	elif event.is_action_pressed("right"):
		move_right()
	elif event.is_action_pressed("up"):
		move_up()

func get_moves_left():
	return moves_left

func set_moves_left(_moves_left):
	moves_left = _moves_left
	
func use_a_move():
	moves_left -= 1
	if moves_left <= 0:
		die()

func move_up():
	position.y -= Variables.DICEMAP_OFFSET
	use_a_move()
func move_right():
	use_a_move()
	position.x += Variables.DICEMAP_OFFSET
func move_left():
	use_a_move()
	position.x -= Variables.DICEMAP_OFFSET
func move_down():
	use_a_move()
	position.y += Variables.DICEMAP_OFFSET
	
func die():
	print("You ran out of moves")
