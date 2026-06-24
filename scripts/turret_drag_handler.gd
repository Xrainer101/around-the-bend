extends Node2D



var turret_dragged : Turret
var curr_slot : TurretSlot
var mouse_pos : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_slot(slot : TurretSlot):
	if(curr_slot):
		curr_slot.polygon.color = Color(0.735, 0.735, 0.735, 0.733)
		curr_slot.area.monitoring = true
	curr_slot = slot
	curr_slot.polygon.color = Color(0.681, 0.486, 0.894, 0.796)
