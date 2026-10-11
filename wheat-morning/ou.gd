extends AnimatedSprite2D
@onready var area2d: Area2D = $Area2D
var permis: bool = false
signal schimbare
# Called when the node enters the scene tree for the first time.
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
		#move_and_slide()
		schimbare.emit()
func _on_cofrag_out() -> void:
	print("&")
	modulate.a=1
	permis = true

func mouse(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		permis = true
	
func spart(area : Area2D) -> void:
	if area.get_parent().is_in_group("bol"):
		permis = 0
		await get_tree().create_timer(0.6).timeout
		frame = 1
		await get_tree().create_timer(0.6).timeout
		frame = 2
		modulate.a = 0
