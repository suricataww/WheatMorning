extends AnimatedSprite2D
@onready var area2d: Area2D = $Area2D
var permis: bool = false
signal schimbare

func _ready() -> void:
	modulate.a=0
	area2d.input_event.connect(mouse)
	area2d.area_entered.connect(spart)
	position = Vector2(1006,371)
	add_to_group("ou")
func _physics_process(delta: float) -> void:
	if permis:
		global_position = get_global_mouse_position()
		look_at(get_global_mouse_position())
		schimbare.emit()

func _on_cofrag_out() -> void:
	modulate.a=1
	permis = true

func mouse(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		permis = true
	
func spart(area : Area2D) -> void:
	if area.get_parent().is_in_group("bol"):
		if Ordine.selectie == 1 and Ordine.pasulgatit == 1:
			permis = 0
			await get_tree().create_timer(0.6).timeout
			frame = 1
			await get_tree().create_timer(0.6).timeout
			frame = 2
			modulate.a = 0
			Ordine.pasulgatit = 2
		if Ordine.selectie == 2 and Ordine.pasulgatit == 0:
			permis = 0
			await get_tree().create_timer(0.6).timeout
			frame = 1
			await get_tree().create_timer(0.6).timeout
			frame = 2
			modulate.a = 0
			Ordine.pasulgatit = 1
		Ordine.invou -= 1
	if area.get_parent().is_in_group("bol"):
		if Ordine.pasulgatit != 1 and Ordine.selectie == 1:
			permis = false
			position = Vector2(1006,371)
		if Ordine.pasulgatit != 0 and Ordine.selectie == 2:
			permis = false
			position = Vector2(1006,371)
