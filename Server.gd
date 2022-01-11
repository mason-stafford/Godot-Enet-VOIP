extends Node


var server_port := 1909
var server_ip := "127.0.0.1"
var max_players = 100

var network = NetworkedMultiplayerENet.new()


func start_client() -> int:
	
	network.create_client(server_ip,server_port)
	get_tree().set_network_peer(network)
	
	return OK

func start_server() -> int:
	
	
	network.create_server(server_port,max_players)
	get_tree().set_network_peer(network)
	
	
	return OK

func stop() -> void:
#	if get_tree().network_peer != null:
#		if get_tree().network_peer is WebSocketClient:
#			get_tree().network_peer.disconnect_from_host()
#		elif get_tree().network_peer is WebSocketServer:
#			get_tree().network_peer.stop()
	pass
