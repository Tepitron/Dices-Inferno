extends dice_thrower

@onready var dices: Node2D = $Dices

func devilish_cheat():
	var index = 0
	
	while index <= 4:
		hand[index] = DICE.SIX
		index += 1

func hide_dice():
	for dice in dices.get_children():
		dice.hide()

func show_hand():
	var hand = get_hand()
	var index = 0
	for number in hand:
		var dice = dices.get_child(index)
		dice.show_correct_side(number)
		dice.show()
		index += 1
