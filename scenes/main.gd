extends Node2D

var MouseIsOnCat = false

func add_counter():
	Global.data.counter += 1
	$Counter.text = "Pet Count: " + str(int(Global.data.counter))

func _mouse_entered_cat():
	MouseIsOnCat = true
	$Petpet.show_petpet()

func _mouse_left_cat():
	MouseIsOnCat = false
	$Petpet.hide_petpet()

func _setupcatmousedetector():
	$Cat/Area2D.mouse_entered.connect(_mouse_entered_cat)
	$Cat/Area2D.mouse_exited.connect(_mouse_left_cat)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and MouseIsOnCat:
			add_counter()
			$Cat.catpressed()
			$Petpet.actually_pet()

func _process(delta: float) -> void:
	global_position = get_viewport().get_camera_2d().global_position


func _ready() -> void:
	Global.load_data()
	_setupcatmousedetector()
	$Counter.text = "Click to Pet"
