extends Node

## YAHTZEE HANDS
enum YAHTZEE_HANDS {
	HIGH = 1,
	PAIR,
	TWO_PAIR,
	THREES,
	FULL_HOUSE,
	FOURS,
	FIVES
}

static func check_yahtzee_hand(hand_to_check: Array[int]):
	
	var digit = 1
	var amount_of_pairs = 0
	var threes = false
	
	while digit <= 6:
		
		var instances_of_digit = hand_to_check.count(digit)
		if instances_of_digit == 2:
			amount_of_pairs += 1
			
		elif instances_of_digit == 3:
			threes = true
			
		elif instances_of_digit == 4:
			return YAHTZEE_HANDS.FOURS
			
		elif instances_of_digit == 5:
			return YAHTZEE_HANDS.FIVES
		digit += 1
	
	if amount_of_pairs == 1 and threes == false:
		return YAHTZEE_HANDS.PAIR
	
	elif amount_of_pairs == 2:
		return YAHTZEE_HANDS.TWO_PAIR
		
	elif amount_of_pairs == 0 and threes == true:
		return YAHTZEE_HANDS.THREES
	
	elif amount_of_pairs == 1 and threes == true:
		return YAHTZEE_HANDS.FULL_HOUSE
		
	else:
		return YAHTZEE_HANDS.HIGH
