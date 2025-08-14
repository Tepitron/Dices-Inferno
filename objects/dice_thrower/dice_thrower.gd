class_name dice_thrower extends Node2D

enum DICE {
	ONE = 1,
	TWO,
	THREE,
	FOUR,
	FIVE,
	SIX
}

var hand: Array[int]

func _ready() -> void:
	hand = [DICE.ONE, DICE.ONE, DICE.ONE, DICE.ONE, DICE.ONE]

func throw_dice():
	var index = 0
	
	while index <= 4:
		hand[index] = randi_range(DICE.ONE, DICE.SIX)
		index += 1
	
func get_hand():
	return hand
