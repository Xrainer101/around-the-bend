extends Node2D

@export var spinners : Array[Spinner] = []

var currIndex : int = 0
var currSpinner : Spinner


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is Spinner:
			spinners.append(child)
	
	currIndex = spinners.size() - 1
	currSpinner = spinners[currIndex]
	currSpinner.sprite.self_modulate = Color(0.0, 1.0, 1.0)
	print(currIndex)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("rotate_left"):
		currSpinner.speen(-45)
	if Input.is_action_just_pressed("rotate_right"):
		currSpinner.speen(45)
	if Input.is_action_just_pressed("ring_up"):
		swap_spinner(-1)
	if Input.is_action_just_pressed("ring_down"):
		swap_spinner(1)

func swap_spinner(direction : int):
	currSpinner.sprite.self_modulate = Color(0.804, 1.0, 0.482)
	currIndex = clamp(currIndex + direction, 0, spinners.size() - 1)
	currSpinner = spinners[currIndex]
	currSpinner.sprite.self_modulate = Color(0.0, 1.0, 1.0)
	print(currIndex)
