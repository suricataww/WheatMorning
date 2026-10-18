extends Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sound: AudioStreamPlayer2D = $sfx_sparkles

func _ready() -> void:
	modulate.a = 0

func _process(delta: float) -> void:
	if Ordine.fel == 1:
		modulate.a = 1
		sound.play()
		animation_player.play("felicitari")
	else:
		modulate.a = 0
