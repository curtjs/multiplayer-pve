extends Node

@onready var world: World = $World

func _on_lobby_started_game() -> void:
	_spawn_players()

func _spawn_players() -> void:
	world.spawn_player(1) # server's player
	
	for peer in multiplayer.get_peers():
		world.spawn_player(peer)
