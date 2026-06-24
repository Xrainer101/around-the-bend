class_name Turret extends Node2D

@export var stats : TurretStats
# @export var projectile : Projectile
@onready var sprite: Sprite2D = $Sprite2D

var health: int
var damage: int
var fire_rate: float

var original_pos: Vector2
var fire_timer: float = 0
var is_grabbed: bool = false
var hovering: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = stats.health
	damage = stats.damage
	fire_rate = stats.fire_rate
	original_pos = position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match GameManager.game_state:
		GameManager.GameState.SETUP:
			if is_grabbed:
				var mouse_pos = get_global_mouse_position()
				global_position = mouse_pos
		GameManager.GameState.FIGHT:
			if(fire_rate >= 0 and fire_timer <= 0):
				fire_timer = fire_rate
				fire()
			fire_timer -= delta
			# Should move all attack handling into a separate AttackComponent that can be used for both turrets and enemies
		_:
			print("Uh oh")

func _input(event: InputEvent) -> void:
	if hovering:
		if event.is_action_pressed("left_click"):
			is_grabbed = true
			TurretDragHandler.turret_dragged = self
		elif event.is_action_released("left_click"):
			# print("Left click released")
			is_grabbed = false
			TurretDragHandler.turret_dragged = null
			if(TurretDragHandler.curr_slot):
				TurretDragHandler.curr_slot.place(self)
			else:
				position = original_pos

func fire():
	pass

func _on_area_2d_mouse_entered() -> void:
	hovering = true
	sprite.self_modulate = Color(1.0, 0.78, 0.78)

func _on_area_2d_mouse_exited() -> void:
	if !is_grabbed:
		hovering = false
		sprite.self_modulate = Color.WHITE
