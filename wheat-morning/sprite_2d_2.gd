extends Sprite2D

func _ready() -> void:
	modulate.a = 0
	position = Vector2(553.0,568.0)

func _on_bol_readyy() -> void:
	if Ordine.selectie == 1:
		modulate.a = 1
