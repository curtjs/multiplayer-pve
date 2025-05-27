extends CanvasLayer

func _on_connection_manager_hosting() -> void:
	_switch_to_lobby()

func _on_connection_manager_joining() -> void:
	_switch_to_lobby()

func _switch_to_lobby() -> void:
	$ConnectionManager.hide()
	$Lobby.show()

func _on_lobby_started_game() -> void:
	hide_child.rpc("Lobby")

func _on_lobby_quit_game() -> void:
	$Lobby.hide()
	$ConnectionManager.show()

@rpc("call_local")
func hide_child(path: NodePath) -> void:
	get_node(path).hide()
