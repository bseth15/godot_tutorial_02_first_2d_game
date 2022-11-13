extends Node


const CONNECTION_FAILED := "connection_failed"

export(PackedScene) var mob_scene: PackedScene

var score: int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if $ScoreTimer.connect("timeout", self, "_on_ScoreTimer_timeout") != OK: print_debug(CONNECTION_FAILED)
	if $StartTimer.connect("timeout", self, "_on_StartTimer_timeout") != OK: print_debug(CONNECTION_FAILED)
	if $MobTimer.connect("timeout", self, "_on_MobTimer_timeout") != OK: print_debug(CONNECTION_FAILED)
	if $HUD.connect("start_game", self, "new_game") != OK: print_debug(CONNECTION_FAILED)
	if $Player.connect("hit", self, "game_over") != OK: print_debug(CONNECTION_FAILED)

	randomize()


func _on_ScoreTimer_timeout() -> void:
	score += 1
	$HUD.update_score(score)


func _on_StartTimer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()


func _on_MobTimer_timeout() -> void:
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instance()

	# Choose a random location on Path2D.
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.offset = randi()

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Add some randomness to the direction.
	direction += rand_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)


func game_over() -> void:
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	get_tree().call_group("mobs", "queue_free")
	$DeathSound.play()
	$Music.stop()


func new_game() -> void:
	score = 0
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$Music.play()
