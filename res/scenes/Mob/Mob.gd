extends RigidBody2D

const CONNECTION_FAILED := "connection_failed"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if $VisibilityNotifier2D.connect("screen_exited", self, "_on_VisibilityNotifier2D_screen_exited") != OK: print_debug(CONNECTION_FAILED)

	var mob_types: PoolStringArray = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]
	$AnimatedSprite.playing = true


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
