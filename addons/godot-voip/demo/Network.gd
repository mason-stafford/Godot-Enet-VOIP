extends Node
class_name Network

var server_port := 3000
var server_ip := "127.0.0.1"




func start_client() -> int:
	var peer := NetworkedMultiplayerENet.new()

	var err := peer.create_client(server_ip,server_port)
	if err != OK:
		return err

	get_tree().set_network_peer(peer)

	return OK

func start_server() -> int:
	var peer := NetworkedMultiplayerENet.new()

	var err := peer.create_server(server_port,5)

	if err != OK:
		return err

	get_tree().set_network_peer(peer)

	return OK

func stop() -> void:
	print("Please close application to disconnect :) ")
