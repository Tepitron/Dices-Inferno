extends Node2D

var casino_scene_path := "res://dice_clicker/dice_clicker.tscn"
var high_or_low_path := "res://high_or_low/high_or_low.tscn"
var adventure_path := "res://objects/dice_map.tscn"

var player_name := "PlayerMainhub"

func _on_casino_body_entered(body: Node2D) -> void:
	if body.name == player_name:
		print_debug(body.name, " visited casino")
		get_tree().change_scene_to_file(casino_scene_path)

func _on_high_or_low_body_entered(body: Node2D) -> void:
	if body.name == player_name:
		print_debug(body.name, " visited high_or_low")
		get_tree().change_scene_to_file(high_or_low_path)


func _on_adventure_body_entered(body: Node2D) -> void:
	if body.name == player_name:
		print_debug(body.name, " visited adventure")
		get_tree().change_scene_to_file(adventure_path)
