class_name Turret_Slot extends Node2D

var current_turret

@onready var polygon: Polygon2D = $Polygon2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	polygon.color = Color(0.835, 0.835, 0.835, 0.635)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
