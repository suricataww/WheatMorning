extends Sprite2D

func _ready() -> void:
	print(position)
	modulate.a = 0


func _on_vacuta_ajunge() -> void:
	modulate.a = 1
