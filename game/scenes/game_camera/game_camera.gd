extends Camera2D

var target_position = Vector2.ZERO
const SMOOTH_VALUE = 20


# Called when the node enters the scene tree for the first time.
func _ready():
	make_current()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	acquire_target()
	global_position = global_position.lerp(target_position, 1.0 - exp(-delta * SMOOTH_VALUE))


func acquire_target():
	# Grab array of nodes in player group
	var player_nodes = get_tree().get_nodes_in_group("player")
	if player_nodes.size() > 0:
		# Typecast player node as node2D (not needed) and set cam position to player position
		var player = player_nodes[0] as Node2D
		target_position = player.global_position
