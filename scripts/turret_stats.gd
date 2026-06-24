class_name TurretStats extends Resource

@export var name: String
@export var health: int
@export var damage: int
## Set below 0 (to something like -1) if turret doesn't fire regularly
@export var fire_rate: float

func _init(p_name: String = "Default", p_health: int = 5, p_damage: int = 10, p_fire_rate: float = 0.5):
	name = p_name
	health = p_health
	damage = p_damage
	fire_rate = p_fire_rate
