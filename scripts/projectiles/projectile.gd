class_name Projectile extends Area2D

## Damage done to enemies
@export var damage : int = 5
## Projectile speed
@export var speed : float = 100
## Direction fired
@export var move_dir : Vector2 = Vector2.UP
## How many enemies to pierce (0 = stops on first enemy hit)
@export var pierce : int = 0
## How far the projectile flies before giving up and dying
@export var max_dist : float = 1500
## An explosion to spawn when projectile dies
@export var explosion : PackedScene

## Sound to play when hitting something
@onready var hit_sound: AudioStreamPlayer2D = $HitSound

var attack_component : AttackComponent
var dist_moved : float = 0
var team : GameManager.Team

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	var new_pos : Vector2 = position + move_dir * delta * speed
	dist_moved += position.distance_to(new_pos)
	position = new_pos
	if dist_moved > max_dist:
		reset_projectile()

func reset_projectile():
	print("Reset")
	dist_moved = 0
	visible = false
	set_process(false)
	set_physics_process(false)
