extends MenuButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	int item_count = 3
	get_popup().add_item("Garden")
	popup/item_{1}/text = "Garden"
	popup/item_{1}/icon
	get_popup().add_item("Kitchen")
	popup/item_{2}/text = "Kitchen"
	popup/item_{2}/icon
	get_popup().add_item("Shop")
	popup/item_{3}/text = "Shop"
	popup/item_{3}/icon

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
