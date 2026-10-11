extends AnimatedSprite2D
@onready var area_2d: Area2D=$Area2D
var permis: bool = false

func _ready() -> void:
	print(position)
	position = Vector2(910,331)
	area_2d.input_event.connect(mouse)
	area_2d.area_entered.connect(turnat)
	add_to_group("lapte")

func _physics_process(delta: float) -> void:
	if permis:
		global_position = get_global_mouse_position()
		look_at(get_global_mouse_position())
		#move_and_slide()

func mouse(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		permis = 1

func turnat(area: Area2D) -> void:
	if area.get_parent().is_in_group("bol"):
		permis = false
		position = Vector2(688,387)
		frame = 1
		await get_tree().create_timer(0.6).timeout
		frame = 2
		await get_tree().create_timer(0.6).timeout
		position = Vector2(910,331)
