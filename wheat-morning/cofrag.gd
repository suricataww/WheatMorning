extends AnimatedSprite2D
@onready var area2d: Area2D = $Area2D
var permis: bool = false
signal out
func _ready() -> void:
	frame = 0
	position = Vector2(1034,357)
	area2d.input_event.connect(deschidere)

func deschidere(_viewport: Node, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		frame = 1
		out.emit()


func _on_ou_schimbare() -> void:
	frame = 2
