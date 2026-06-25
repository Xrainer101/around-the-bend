class_name AttackComponent extends Node2D

## What the attack is
@export var projectile : PackedScene
## How often the attack happens in seconds
@export var fire_rate : float = 1
## How many projectiles to shoot in one shot
@export var multi_shot : int = 1
## Spread of multishot projectiles
@export var proj_spread_angle : float = 5
## How many projectiles to burst fire (Example: Repeater burst fires 2 peas)
@export var burst_fire_rate : int = 1
## Sound that plays on every attack
@export var attack_sound : AudioStreamPlayer2D
## Size of projectile pool
@export var pool_size : int = 10
var fire_timer : float = 0


var bullet_pool : Array[Projectile] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# for i in pool_size:
		# var p : Projectile = projectile.instantiate()
		# bullet_pool.append(p)
		# p.reset_projectile()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.game_state == GameManager.GameState.FIGHT:
		if(fire_timer >= fire_rate):
			# print("Timer ran out")
			fire_timer = 0
			fire()
		fire_timer += delta

func fire():
	# print("Fire!")
	if attack_sound:
		attack_sound.play()
	spawn_bullet()
	for i in burst_fire_rate:
		# To do: Follow tutorial to shoot bullets
		pass
	pass

func spawn_bullet():
	var proj : Projectile = pull_from_pool()
	proj.global_position = global_position
	print(proj.global_position)
	print(global_position)

func add_to_pool(proj : Projectile):
	# print("Adding")
	bullet_pool.append(projectile)
	proj.set_process(false)
	proj.set_physics_process(false)
	proj.hide()

func pull_from_pool() -> Projectile:
	var proj : Projectile
	if bullet_pool.is_empty():
		print("Instantiating")
		proj = projectile.instantiate()
		proj.reparent(get_tree().root)
		proj.attack_component = self
	else:
		print("Pulling")
		proj = bullet_pool[0]
		bullet_pool.remove_at(0)
	proj.set_process(true)
	proj.set_physics_process(true)
	proj.show()
	return proj
