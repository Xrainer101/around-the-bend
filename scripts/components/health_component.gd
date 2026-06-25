class_name HealthComponent extends Node2D

@export var max_health : int
@export var deathsplosion : PackedScene
@export var damage_sound : AudioStreamPlayer2D

var health : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = max_health
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func damage(projectile : Projectile):
	health -= projectile.damage
	
	if damage_sound:
		damage_sound.play()
	
	if health <= 0:
		if deathsplosion:
			deathsplosion.instantiate()
		get_parent().queue_free()
