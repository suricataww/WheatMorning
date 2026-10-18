extends CharacterBody2D

@export var speed = 200
@onready var area_2d: Area2D = $Area2D

var permis: bool = false
var mancatdeja: bool = false
var gatit: bool = false

func _ready() -> void:
	scale = Vector2(0.5,0.5)
	position=Vector2(974.0,42.0)
	area_2d.area_entered.connect(_on_area_entered)
	area_2d.input_event.connect(_on_input_event)
	add_to_group("crenvusti")
	modulate.a = 0
	
func _physics_process(delta: float) -> void:
	if permis:
		global_position = get_global_mouse_position()
		look_at(get_global_mouse_position())
		move_and_slide()
	if Ordine.pasulgatit == 3 and Ordine.selectie == 2 and gatit == false:
		modulate.a = 1
	
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		permis = true

func _on_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "Casian":
		permis = false
		await get_tree().create_timer(0.25).timeout
		modulate.a = 0
		Ordine.pasulgatit = 4
		gatit = true

func _on_area_2d_mouse_entered() -> void:
	scale = Vector2(0.55,0.55)

func _on_area_2d_mouse_exited() -> void:
	scale = Vector2(0.5,0.5)
