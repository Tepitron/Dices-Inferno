extends Node2D
@onready var dice_animations: AnimatedSprite2D = $AnimatedSprite2D
@onready var points_label: Label = $PointsLabel

var pips := Vector2i(1,6)

func set_pips(_min = 1, _max = 6):
	pips.x = _min
	pips.y = _max

func throw_dice() -> int:
	var side_showing = randi_range(pips.x, pips.y)
	show_correct_side(side_showing)
	points_label.text = str(side_showing)
	return side_showing

func show_correct_side(side_showing: int):
	dice_animations.play("side_set")
	dice_animations.pause()
	dice_animations.set_frame_and_progress(
		side_showing-1, 
		dice_animations.frame_progress
		)

func set_dice_face(face: int):
	show_correct_side(face)
