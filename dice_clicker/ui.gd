extends Control

@onready var points_label: Label = $PointsText/PointsLabel
@onready var shop := $Shop
@onready var dice_throw: Button = $DiceThrow
@onready var double_dice_label_timer: Timer = $DoubleDiceLabel/DoubleDiceLabelTimer
@onready var total_amount_label := $TotalAmountLabel
@onready var multiplier_label: Label = $MultiplierLabel

const MULTIPLIER_TEXTS = [ "HIGH", "PAIR", "TWO PAIR", "TRIPLE", 
							"FULL HOUSE", "QUADS", "FIVES"] 

func _ready() -> void:
	Signalbus.points_changed.connect(_on_points_changed)

func _on_dice_throw_pressed() -> void:
	Signalbus.throw_button_pressed.emit()

func _on_points_changed():
	points_label.text = str(Variables.get_points())

func change_cooldown_text(new_text: String):
	dice_throw.text = new_text

func debug_add_points():
	Variables.add_points(100)

func _on_debug_add_points_pressed() -> void:
	debug_add_points()

func change_total_amount_text(base: int, multiplier: int, total_result: int):
	total_amount_label.text = str(base) + " * " + \
	str(multiplier) + " = " + str(total_result)

func show_hand_text(hand_number: int):

	multiplier_label.text = MULTIPLIER_TEXTS[hand_number-1]
