class_name TurretSlot extends Node2D

var current_turret: Turret

@onready var polygon: Polygon2D = $Polygon2D
@onready var area: Area2D = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	polygon.color = Color(0.735, 0.735, 0.735, 0.733)
	area.monitorable = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func place(turret: Turret):
	turret.reparent(self)
	print(get_parent().get_parent().scale)
	turret.position = area.position
	turret.original_pos = turret.position
	turret.rotation = 0
	area.monitorable = false
	polygon.color = Color(0.463, 0.58, 0.894, 0.796)

func _on_area_2d_area_exited(area: Area2D) -> void:
	# polygon.color = Color(0.735, 0.735, 0.735, 0.733)
	pass

func _on_area_2d_mouse_entered() -> void:
	if TurretDragHandler.turret_dragged:
		TurretDragHandler.set_slot(self)
	pass

func _on_area_2d_mouse_exited() -> void:
	if TurretDragHandler.turret_dragged:
		polygon.color = Color(0.735, 0.735, 0.735, 0.733)
		if TurretDragHandler.curr_slot == self:
			TurretDragHandler.curr_slot = null
	pass # Replace with function body.
