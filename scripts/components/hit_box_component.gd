class_name HitBoxComponent extends Area2D

@export var health_component : HealthComponent
@export var team : GameManager.Team

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func damage(projectile : Projectile):
	if health_component:
		health_component.damage(projectile)


# func _on_area_entered(area: Area2D) -> void:
	# if area.team != team:
		# damage(area)
	# pass # Replace with function body.
