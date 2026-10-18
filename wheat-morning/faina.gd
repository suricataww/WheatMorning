extends AnimatedSprite2D
@export var speed = 200
@onready var area_2d: Area2D=$Area2D
@onready var sound: AudioStreamPlayer2D = $AudioStreamPlayer2D
var permis : bool = false
var prezenta = 0 
var pusdeja : bool = false

func _ready() -> void:
	scale = Vector2(0.593394,0.593394)
	position=Vector2(273.0,487.0)
	modulate.a = 0
	area_2d.input_event.connect(mouse)
	area_2d.area_entered.connect(turnat)
	add_to_group("faina")

func _physics_process(delta: float) -> void:
	if permis:
		global_position = get_global_mouse_position()
		look_at(get_global_mouse_position())
	if (Ordine.selectie == 1 or Ordine.selectie == 3) and Ordine.invfaina >= 1:
		modulate.a = 1
		prezenta = 1
	else:
		prezenta = 0
		modulate.a = 0

func mouse(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and prezenta == 1 and pusdeja == false and Ordine.invfaina >= 1:
		permis = 1
		sound.play()
func turnat(area:Area2D) -> void:
	if area.get_parent().is_in_group("bol") and prezenta == 1:
		permis = 0
		position=Vector2(458,370)
		frame = 1
		await get_tree().create_timer(0.6).timeout
		frame = 2
		await get_tree().create_timer(0.6).timeout
		position=Vector2(273.0,487.0)
		pusdeja = true
		Ordine.invfaina -= 1


func _on_area_2d_mouse_entered() -> void:
	if pusdeja == false:
		scale = Vector2(0.63,0.63)
func _on_area_2d_mouse_exited() -> void:
	if pusdeja == false:
		scale = Vector2(0.593394,0.593394)
