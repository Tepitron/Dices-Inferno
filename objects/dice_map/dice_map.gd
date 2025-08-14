extends Node2D

@onready var spaces: Node2D = $spaces
const SPACE = preload("res://objects/space.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# 10 x 10 map
	var i = -5
	var j = -5
	
	while i <= 4:
		j = -5
		while j <= 4:
			var space = SPACE.instantiate()
			spaces.add_child(space)
			space.position = Vector2(
				i * Variables.DICEMAP_OFFSET, 
				j * Variables.DICEMAP_OFFSET)
			j += 1
		i += 1
		
