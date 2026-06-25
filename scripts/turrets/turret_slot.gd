class_name TurretSlot extends Node2D

var current_turret: Turret

@onready var polygon: Polygon2D = $Polygon2D
@onready var area: Area2D = $Area2D
@onready var collision_shape: CollisionShape2D = $Area2D/CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	polygon.color = Color(0.735, 0.735, 0.735, 0.733)
	collision_shape.disabled = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Put turret into this slot
func place(turret: Turret):
	print(get_parent().get_parent().scale)
	# Put turret into slot position
	turret.reparent(self)
	turret.position = area.position
	turret.rotation = 0
	
	# Set new parameters for turret
	turret.original_pos = turret.position
	turret.self_curr_slot = self
	
	# Make this slot not the current slot
	if TurretDragHandler.curr_slot == self:
			TurretDragHandler.curr_slot = null
	# Disable collision so it cannot be used while occupied
	collision_shape.disabled = true
	
	# Set color to "placed" color
	polygon.color = Color(0.463, 0.58, 0.894, 0.796)

func unplace():
	collision_shape.disabled = false
	polygon.color = Color(0.735, 0.735, 0.735, 0.733)
	current_turret = null

func _on_area_2d_area_exited(area: Area2D) -> void:
	# polygon.color = Color(0.735, 0.735, 0.735, 0.733)
	pass

func _on_area_2d_mouse_entered() -> void:
	if TurretDragHandler.turret_dragged:
		print("Mouse entered")
		TurretDragHandler.set_slot(self)
	pass

func _on_area_2d_mouse_exited() -> void:
	if TurretDragHandler.turret_dragged:
		polygon.color = Color(0.735, 0.735, 0.735, 0.733)
		if TurretDragHandler.curr_slot == self:
			TurretDragHandler.curr_slot = null
	pass # Replace with function body.
