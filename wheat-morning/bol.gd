extends AnimatedSprite2D
@onready var area2d: Area2D=$Area2D
signal readyy
func _ready() -> void:
	add_to_group("bol")
	area2d.area_entered.connect(schimbare)
	area2d.input_event.connect(gatit)
	frame = 0
	position = Vector2(553.0,568.0)

func schimbare(area: Area2D) -> void:
	if area.get_parent().is_in_group("faina"):
		await get_tree().create_timer(0.6).timeout
		frame = 1
	if area.get_parent().is_in_group("ou"):
		await get_tree().create_timer(0.6).timeout
		frame = 2
	if area.get_parent().is_in_group("zahar"):
		await get_tree().create_timer(0.6).timeout
		frame = 3
	if area.get_parent().is_in_group("lapte"):
		await get_tree().create_timer(0.6).timeout
		frame = 4
		
func gatit(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if frame == 4:
			modulate.a=0
			readyy.emit()
