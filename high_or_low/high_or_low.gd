extends Node2D

@onready var player: Node2D = $Player
@onready var devil: Node2D = $Devil
@onready var player_points_number: Label = $PlayerPointsLabel/PlayerPointsNumber
@onready var devil_points_number: Label = $DevilPointsLabel/DevilPointsNumber

var hand_checker = preload("res://scripts/hand_checker.gd")

enum GUESS{
	LOW = 1,
	HIGH
}

var round_number = 1

var devil_current_hand_points = 0
var player_current_hand_points = 0

var player_points = 0
var devil_points = 0

func player_throw():
	player.throw_dice()
	player.show_thrown_dice()
	player_current_hand_points = hand_checker.check_yahtzee_hand(player.get_hand())

func devil_throw():
	devil.throw_dice()
	devil.hide_dice()
	devil_current_hand_points = hand_checker.check_yahtzee_hand(devil.get_hand())
	
func start_turn():
	$DebugPlayerThrowButton.show()

func _on_debug_player_throw_button_pressed() -> void:
	player_throw()
	devil_throw()
	$DebugPlayerThrowButton.hide()
	start_guessing()

func start_guessing():
	$GuessButtons/HigherButton.show()
	$GuessButtons/LowerButton.show()

func guess_lower_or_higher(guess):
	if guess == GUESS.HIGH:
		if is_player_hand_stronger():
			player_scores_point()
		else:
			devil_scores_point()
		
	elif guess == GUESS.LOW:
		if is_player_hand_stronger():
			devil_scores_point()
		else:
			player_scores_point()
	
	show_round_results()
	
func _on_higher_button_pressed() -> void:
	guess_lower_or_higher(GUESS.HIGH)
	
func _on_lower_button_pressed() -> void:
	guess_lower_or_higher(GUESS.LOW)

func is_player_hand_stronger() -> bool:
	return player_current_hand_points > devil_current_hand_points

func player_scores_point():
	player_points += 1
	player_points_number.text = str(player_points)
	
func devil_scores_point():
	devil_points += 1
	devil_points_number.text = str(devil_points)

func show_round_results():
	devil.show_hand()
	hide_guessing_buttons()
	start_new_round()

func hide_guessing_buttons():
	$GuessButtons/HigherButton.hide()
	$GuessButtons/LowerButton.hide()

func start_new_round():
	round_number += 1
	start_turn()
