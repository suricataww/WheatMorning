extends Button

func _on_pressed() -> void:
	Ordine.pasulgatit = 3
	Ordine.selectie = 3

func _on_button_pressed() -> void:
	Ordine.pasulgatit = 3
	Ordine.selectie = 2

func _on_button_2_pressed() -> void:
	Ordine.pasulgatit = 4
	Ordine.selectie = 1
