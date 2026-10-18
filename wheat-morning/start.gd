extends Control
func _ready() -> void:
	pass

func _on_kitchen_pressed() -> void:
	get_tree().change_scene_to_file("res://bucatarie.tscn")
	
func _on_garden_pressed() -> void:
	get_tree().change_scene_to_file("res://garden.tscn")

func _on_shop_pressed() -> void:
	get_tree().change_scene_to_file("res://shop.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
