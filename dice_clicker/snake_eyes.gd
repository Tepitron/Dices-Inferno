extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Variables.increment_snake_eyes_count()

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action("pop"):
		print_debug("Snake_eye_clicked")
		Variables.decrease_snake_eyes_count()
		queue_free()
