extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mob_types: PoolStringArray = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]
	$AnimatedSprite.playing = true

	var visibility_notifier = get_node("VisibilityNotifier2D")
	visibility_notifier.connect("screen_exited", self, "_on_VisibilityNotifier2D_screen_exited")


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
