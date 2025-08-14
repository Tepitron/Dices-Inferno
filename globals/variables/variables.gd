extends Node

var points := 0
var snake_eyes_count := 0

## Shop constants
const FIRST_DICE_COST = 100
const AUTO_THROW_COST = 100
const GAME_WIN_LIMIT = 1000

## Dicemap offset between playing spaces
const DICEMAP_OFFSET := 50

var HAND_MULTIPLIERS = [1, 2, 3, 4, 5, 6, 7]

func get_hand_multiplier(hand_number):
	return HAND_MULTIPLIERS[hand_number-1]

func change_hand_multiplier(hand_number, new_multiplier):
	HAND_MULTIPLIERS[hand_number-1] = new_multiplier

func set_points(new_points):
	points = new_points

func get_points() -> int:
	return points

func add_points(_points):
	points += _points
	Signalbus.points_changed.emit()
	if points >= GAME_WIN_LIMIT:
		end_first_phase()

func decrease_points(_points):
	points -= _points
	Signalbus.points_changed.emit()

func get_snake_eyes_count() -> int:
	return snake_eyes_count

func increment_snake_eyes_count():
	snake_eyes_count += 1

func decrease_snake_eyes_count():
	snake_eyes_count -= 1

func end_first_phase():
	print_debug("You win the game ???")
	
