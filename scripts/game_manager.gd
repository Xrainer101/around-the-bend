extends Node

enum GameState {SETUP, FIGHT, PAUSE}
enum Team {PLAYER, ENEMY}
@export var game_state: GameState

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_state = GameState.SETUP
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
