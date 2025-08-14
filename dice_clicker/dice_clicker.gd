extends Node2D

## Onready nodes
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var dices: Node2D = $dices
@onready var ui: Control = $UI
@onready var snake_eyes: Node = $snakeEyes
@onready var snake_eye_timer: Timer = $SnakeEyeTimer
@onready var dice_throw_cooldown := $DiceThrowCooldown

## Scenes to be instantiated
var dice_scene := preload("res://objects/dice/dice.tscn")
var snake_eye_scene = preload("res://dice_clicker/snake_eyes.tscn")

var hand_checker = preload("res://scripts/hand_checker.gd")

## Viewport sizes
var viewport_sizes: Vector2i

## Flag variables
var dice_throw_cooldown_passed := true

var amount_of_dice := 1

func _ready() -> void:
	Signalbus.throw_button_pressed.connect(_on_throw_button_pressed)
	Signalbus.dice_bought.connect(_on_dice_bought)
	viewport_sizes = get_viewport().size
	
func _on_throw_button_pressed():
	if dice_throw_cooldown_passed:
		throw_dice()

func spawn_snake_eyes():
	var snake_eye = snake_eye_scene.instantiate()
	var random_x = randi_range(0, viewport_sizes.x)
	var random_y = randi_range(0, viewport_sizes.y)
	snake_eye.position = Vector2(random_x,random_y)
	snake_eyes.add_child(snake_eye)

func throw_dice():
	
	start_dice_throw_cooldown()
	
	var total_result := 0
	var all_throws: Array[int] = []
	
	for dice in dices.get_children():
		animation_player.play("dice_throw")
		all_throws.append(dice.throw_dice())
		total_result += all_throws[-1]
	
	var result_before_multiplier = total_result
	
	if result_before_multiplier == dices.get_child_count():
		spawn_snake_eyes()
	
	var hand_number = hand_checker.check_yahtzee_hand(all_throws)
	var multiplier = Variables.get_hand_multiplier(hand_number)
	
	total_result *= multiplier
	
	Variables.add_points(total_result)
	
	ui.change_total_amount_text(result_before_multiplier, multiplier, total_result)
	
	ui.show_hand_text(hand_number)
	
func start_dice_throw_cooldown():
	ui.change_cooldown_text("Cooling Down")
	dice_throw_cooldown.start()
	dice_throw_cooldown_passed = false

func add_snake_eye_penalties():
	Variables.decrease_points(Variables.snake_eyes_count)

func _on_snake_eye_timer_timeout() -> void:
	print_debug("snake eye timer timedout")
	if Variables.get_snake_eyes_count() > 0:
		add_snake_eye_penalties()

func _on_dice_bought():
	spawn_new_dice()

func spawn_new_dice():
	
	for dice in dices.get_children():
		dice.position.x -= 120
	
	var dice = dice_scene.instantiate()
	dice.position.x = dices.get_child(-1).position.x + 120
	dice.position.y = dices.get_child(-1).position.y 
	dices.add_child(dice)

func _on_dice_throw_cooldown_timeout() -> void:
	ui.change_cooldown_text("Throw Dice")
	dice_throw_cooldown_passed = true
