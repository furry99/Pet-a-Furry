extends Node2D

@onready var petpet = $petpet
@onready var timer = $Timer

func show_petpet():
	petpet.show()

func hide_petpet():
	petpet.hide()

func actually_pet():
	petpet.frame = 0
	petpet.play("gif", 1.6)
	await petpet.animation_finished
	petpet.stop()

func _process(delta):
	global_position = global_position.lerp( get_global_mouse_position(),
											delta * 15 )

func _ready() -> void:
	petpet.hide()
	petpet.sprite_frames.set_animation_loop("gif", false)
