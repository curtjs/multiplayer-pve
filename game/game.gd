extends Node

@onready var world: World = $World

func _on_connection_manager_hosting() -> void:
	world.spawn_player(1)
	
	multiplayer.peer_connected.connect(
		func(pid) -> void:
			world.spawn_player(pid)
	)
