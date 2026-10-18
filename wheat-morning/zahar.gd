extends AnimatedSprite2D
@onready var area_2d: Area2D=$Area2D
@onready var sound: AudioStreamPlayer2D = $AudioStreamPlayer2D
var permis: bool = false
var prezenta = 0
var pusdeja : bool = false

func _ready() -> void:
	scale = Vector2(0.682561, 0.682561)
	position = Vector2(912,159)
	modulate.a = 0
	area_2d.input_event.connect(mouse)
	area_2d.area_entered.connect(turnat)
	add_to_group("zahar")

func _physics_process(delta: float) -> void:
	if permis:
		global_position = get_global_mouse_position()
		look_at(get_global_mouse_position())
	if (Ordine.selectie == 1 or Ordine.selectie == 2 or Ordine.selectie == 3) and Ordine.invzahar >= 1:
		modulate.a = 1
		prezenta = 1
	else:
		modulate.a = 0
		prezenta = 0
		
func mouse(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and prezenta == 1 and pusdeja == false and Ordine.invzahar >= 1:
		permis = true
		sound.play()

func turnat(area: Area2D) -> void:
	if area.get_parent().is_in_group("bol") and prezenta == 1:
		if Ordine.pasulgatit == 2 and Ordine.selectie == 1:
			permis = false
			position = Vector2(688,387)
			frame = 1
			rotation_degrees = -125
			await get_tree().create_timer(0.6).timeout
			frame = 2
			rotation_degrees = 0
			await get_tree().create_timer(0.6).timeout
			position = Vector2 (912,159)
			Ordine.pasulgatit = 3
		if Ordine.pasulgatit == 1 and (Ordine.selectie == 2 or Ordine.selectie == 3):
			permis = false
			position = Vector2(688,387)
			frame = 1
			rotation_degrees = -125
			await get_tree().create_timer(0.6).timeout
			frame = 2
			rotation_degrees = 0
			await get_tree().create_timer(0.6).timeout
			position = Vector2 (912,159)
			Ordine.pasulgatit = 2
		pusdeja = true
		Ordine.invzahar -= 1
	if area.get_parent().is_in_group("bol") and prezenta == 1:
		if Ordine.pasulgatit != 2 and Ordine.selectie == 1:
			permis = false
			position = Vector2(912,159)
		if Ordine.pasulgatit !=1 and (Ordine.selectie == 2 or Ordine.selectie ==3):
			print("&")
			permis = false
			position = Vector2(912,159)


func _on_area_2d_mouse_entered() -> void:
	if pusdeja == false:
		scale = Vector2(0.72,0.72)

func _on_area_2d_mouse_exited() -> void:
	if pusdeja == false:
		scale = Vector2(0.682561, 0.682561)
