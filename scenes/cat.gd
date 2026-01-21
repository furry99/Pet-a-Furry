extends Node2D

@onready var MainCatSprite = $AnimatedSprite2D
var current_tween: Tween

func catgrow():
	var tween = create_tween()	
	current_tween = tween
	tween.tween_property(
		MainCatSprite,
		"scale",
		Vector2(1.1, 1.1),
		0.05
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	await tween.finished
	tween = create_tween()
	current_tween = tween
	tween.tween_property(
		MainCatSprite,
		"scale",
		Vector2(1, 1),
		0.05
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	

func catpressed():
	if current_tween:
		current_tween.kill()
	catgrow()

func _ready() -> void:
	pass
