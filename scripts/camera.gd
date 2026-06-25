extends Camera2D

var min_zoom : float = 0.5
var max_zoom : float = 3.0
var zoom_speed : float = 0.25

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _unhandled_input(event: InputEvent) -> void:
	# Zoom in with scrolling
	if event.is_action_pressed("zoom_in"):
		zoom = Vector2(
			clamp(zoom.x + zoom_speed, min_zoom, max_zoom),
			clamp(zoom.y + zoom_speed, min_zoom, max_zoom)
		)
	# Zoom out with scrolling
	elif event.is_action_pressed("zoom_out"):
		zoom = Vector2(
			clamp(zoom.x - zoom_speed, min_zoom, max_zoom),
			clamp(zoom.y - zoom_speed, min_zoom, max_zoom)
		)
