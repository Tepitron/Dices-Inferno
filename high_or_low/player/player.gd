extends dice_thrower

@onready var dices: Node2D = $Dices

func show_thrown_dice():
	var hand = get_hand()
	var index = 0
	for number in hand:
		var dice = dices.get_child(index)
		dice.show_correct_side(number)
		index += 1
