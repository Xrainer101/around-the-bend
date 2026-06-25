class_name Projectile extends Area2D

@export var damage : int = 5
@export var speed : float = 25
@export var pierce : int = 0
@export var life_time : float = 2
@export var explosion : PackedScene

@onready var timer: Timer = $LifeTimer
@onready var hit_sound: AudioStreamPlayer2D = $HitSound

var attack_component : AttackComponent
var time_active : float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = life_time
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_local_y(-1 * speed * delta)
	pass

func reset_projectile():
	visible = false
	set_process(false)

func _on_timer_timeout() -> void:
	attack_component.add_to_pool(self)
