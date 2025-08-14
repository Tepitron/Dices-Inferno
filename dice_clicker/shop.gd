extends Control

var shop_open := false

var new_dice_cost = Variables.FIRST_DICE_COST

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shop_open = false
	
func _on_shop_button_pressed() -> void:
	open_and_close_shop()
	
func open_and_close_shop():
	# Flip the shop_open flag
	shop_open = not shop_open
	
	# Opens shop
	if shop_open:
		for shop_item in get_children():
			if shop_item.name != "AutoThrowButton":
				shop_item.show()
	
	#Closes shop
	else:
		for shop_item in get_children():
			shop_item.hide()

func _on_new_dice_button_pressed() -> void:
	try_to_buy_new_dice()

func try_to_buy_new_dice():
	if Variables.get_points() >= new_dice_cost:
		Variables.decrease_points(new_dice_cost)
		add_new_dice()

func add_new_dice():
	Signalbus.dice_bought.emit()
