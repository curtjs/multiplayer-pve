extends Control

signal started_game
signal quit_game

@export var host_controls: Array[Control] = []

@export var player_card: PackedScene
@export var player_cards: HBoxContainer

func setup_screen() -> void:
	if !multiplayer.is_server():
		for c in host_controls:
			c.hide()
	else:
		var pc = player_card.instantiate()
		pc.name = "1"
		player_cards.add_child(pc)
		
		multiplayer.peer_connected.connect(
			func(id: int) -> void:
				var client_pc = player_card.instantiate()
				client_pc.name = str(id)
				player_cards.add_child(client_pc)
		)
		
		multiplayer.peer_disconnected.connect(
			func(id: int) -> void:
				var client_pc = player_cards.get_node(str(id))
				client_pc.queue_free()
		)

func _on_visibility_changed() -> void:
	if visible: setup_screen()

func _on_start_pressed() -> void:
	started_game.emit()

func _on_quit_pressed() -> void:
	multiplayer.multiplayer_peer.close()
	quit_game.emit()
