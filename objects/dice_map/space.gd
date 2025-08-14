extends Node2D

@onready var face = $Face
@onready var top: Sprite2D = $Top

var space_visited := false

func _ready() -> void:
	face.hide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print_debug(body.name)
	if body.name == "DiceDude":
		if not space_visited:
			space_visited = true
			open_space()

func open_space():
	face.show()
	top.queue_free()
	
	
	
