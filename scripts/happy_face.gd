extends Sprite2D

var health : int = 100
var rotate_speed : float = 1.0
# Maybe the speed could increase with a power up or something

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate(rotate_speed * delta)
