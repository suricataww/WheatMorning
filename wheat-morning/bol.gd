extends AnimatedSprite2D
@onready var area2d: Area2D=$Area2D
@onready var sound: AudioStreamPlayer2D = $AudioStreamPlayer2D
signal readyy
func _ready() -> void:
	add_to_group("bol")
	area2d.area_entered.connect(schimbare)
	area2d.input_event.connect(gatit)
	frame = 0
	Ordine.pasulgatit = 0
	position = Vector2(553.0,568.0)

func schimbare(area: Area2D) -> void:
	if Ordine.selectie == 1:
		if area.get_parent().is_in_group("faina") and Ordine.pasulgatit == 0:
			await get_tree().create_timer(0.6).timeout
			frame = 1
			Ordine.pasulgatit = 1
			Ordine.fel = 1 # ce dracu e aia ordine.fel the fuck
			# aaa este de la ordine.felicitari si e pt animatia cu stelute ce smart sunt
			await get_tree().create_timer(0.2).timeout
			Ordine.fel = 0
		if area.get_parent().is_in_group("ou") and Ordine.pasulgatit == 1:
			await get_tree().create_timer(0.6).timeout
			frame = 2
			Ordine.fel = 1
			await get_tree().create_timer(0.2).timeout
			Ordine.fel = 0
		if area.get_parent().is_in_group("zahar") and Ordine.pasulgatit == 2:
			await get_tree().create_timer(0.6).timeout
			frame = 3
			Ordine.fel = 1
			await get_tree().create_timer(0.2).timeout
			Ordine.fel = 0
		if area.get_parent().is_in_group("lapte") and Ordine.pasulgatit == 3:
			await get_tree().create_timer(0.6).timeout
			frame = 4
			Ordine.fel = 1
			await get_tree().create_timer(0.2).timeout
			Ordine.fel = 0
	if Ordine.selectie == 2:
		if area.get_parent().is_in_group("ou") and Ordine.pasulgatit == 0:
			await get_tree().create_timer(0.6).timeout
			frame = 2
			Ordine.fel = 1
			await get_tree().create_timer(0.2).timeout
			Ordine.fel = 0
		if area.get_parent().is_in_group("zahar") and Ordine.pasulgatit == 1:
			await get_tree().create_timer(0.6).timeout
			frame = 3
			Ordine.fel = 1
			await get_tree().create_timer(0.2).timeout
			Ordine.fel = 0
		if area.get_parent().is_in_group("lapte") and Ordine.pasulgatit == 2:
			await get_tree().create_timer(0.6).timeout
			frame = 4
			Ordine.fel = 1
			await get_tree().create_timer(0.2).timeout
			Ordine.fel = 0
	if Ordine.selectie == 3:
		if area.get_parent().is_in_group("faina") and Ordine.pasulgatit == 0:
			await get_tree().create_timer(0.6).timeout
			frame = 1
			Ordine.pasulgatit = 1
			Ordine.fel = 1 
			await get_tree().create_timer(0.2).timeout
			Ordine.fel = 0
		if area.get_parent().is_in_group("zahar") and Ordine.pasulgatit == 1:
			await get_tree().create_timer(0.6).timeout
			frame = 3
			Ordine.fel = 1
			await get_tree().create_timer(0.2).timeout
			Ordine.fel = 0
		if area.get_parent().is_in_group("lapte") and Ordine.pasulgatit == 2:
			await get_tree().create_timer(0.6).timeout
			frame = 4
			Ordine.fel = 1
			await get_tree().create_timer(0.2).timeout
			Ordine.fel = 0

func gatit(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if frame == 4:
			sound.play()
			modulate.a=0
			readyy.emit()
