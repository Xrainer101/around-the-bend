@icon("res://assets/Sprites/WhiteCircle.png")
class_name Spinner extends Node2D

@export var target_angle : float = 0.0
@export var rotation_speed : int = 10

@onready var crank_sound: AudioStreamPlayer2D = $CrankSound
@onready var sprite: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation_degrees = deg_to_rad(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation = lerp_angle(rotation, target_angle, delta * rotation_speed)

func speen(degrees : float):
	target_angle += deg_to_rad(degrees)
	crank_sound.play()
