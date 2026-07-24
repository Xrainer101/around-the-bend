class_name AttackComponent extends Node2D

## What the attack is
@export var projectile : PackedScene
## How often the attack happens in seconds
@export var fire_rate : float = 1
## How many projectiles to shoot in one shot
@export var multi_shot : int = 1
## Spread of multishot projectiles (0 means projectiles fly straight)
@export var proj_spread_angle : float = 0
## How many projectiles to burst fire (Example: Repeater burst fires 2 peas)
@export var burst_fire : int = 1
## Time in between burst_fire shots
@export var burst_fire_rate : float = 0.1
## Sound that plays on every attack
@export var attack_sound : AudioStreamPlayer2D
## Size of projectile pool
@export var pool_size : int = 10
## What team the projectile is on
@export var team : GameManager.Team

var fire_timer : float = 0

var bullet_pool : Array[Projectile] = []
var bullet_index : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in pool_size:
		var p : Projectile = projectile.instantiate()
		p.attack_component = self
		p.team = p.attack_component.team
		p.top_level = true
		add_child(p)
		bullet_pool.append(p)
		p.reset_projectile()
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
	
	for i in burst_fire:
		# To do: Follow tutorial to shoot bullets
		var dir : Vector2 = Vector2.UP
		var rad_angle : float = deg_to_rad(proj_spread_angle)
		var angle : float = -rad_angle * multi_shot * 0.5
		
		for j in multi_shot:
			var p : Projectile = get_bullet_from_pool()
			p.global_position = global_position
			p.global_rotation = global_rotation + angle
			p.move_dir = dir.rotated(global_rotation + angle)
			p.visible = true
			p.set_physics_process(true)
			angle += rad_angle
		pass
	pass

func get_bullet_from_pool() -> Projectile:
	print("Getting bullet")
	var p : Projectile = bullet_pool[bullet_index]
	bullet_index = wrapi(bullet_index + 1, 0, pool_size)
	return p
