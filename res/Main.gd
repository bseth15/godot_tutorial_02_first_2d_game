extends Node

export(PackedScene) var mob_scene: PackedScene
var score: int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()

	var mob_timer = get_node("MobTimer")
	mob_timer.connect("timeout", self, "_on_MobTimer_timeout")

	var player = get_node("Player")
	player.connect("hit", self, "game_over")

	var score_timer = get_node("ScoreTimer")
	score_timer.connect("timeout", self, "_on_ScoreTimer_timeout")

	var start_timer = get_node("StartTimer")
	start_timer.connect("timeout", self, "_on_StartTimer_timeout")

	new_game()


func _on_ScoreTimer_timeout() -> void:
	score += 1


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


func new_game() -> void:
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
