extends AnimatedSprite2D
@onready var area2d: Area2D = $Area2D
var health = 100
signal ajunge

func _ready() -> void:
	frame = 0
	area2d.input_event.connect(enervant)
	print(position)
	#position = Vector2()

func _process(delta: float) -> void:
	if health == 0:
		frame = 1
		scale = Vector2(1.5, 1.5)
		await get_tree().create_timer(0.05).timeout
		scale = Vector2(1.7, 1.7)
		await get_tree().create_timer(0.05).timeout
		scale = Vector2(1.9, 1.9)
		await get_tree().create_timer(0.05).timeout
		ajunge.emit()
		modulate.a = 0

func enervant(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		health -= 20
