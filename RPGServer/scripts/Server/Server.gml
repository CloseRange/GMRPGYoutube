

function Server(port, maxClients) constructor {
	buffer = buffer_create(1024, buffer_grow, 1);
	server = network_create_server(network_socket_tcp, port, maxClients);

	function OnAsync() {
		var type = async_load[? "type"];
		switch(type) {
			case network_type_connect: OnConnect(); break;
			case network_type_disconnect: OnDisconnect(); break;
			case network_type_data: OnData(); break;
		}
	}
	function OnConnect() {
		var socket = async_load[? "socket"];
		
		DataStart(DInit);
		DataWrite(buffer_string, "Hello :)");
		DataSend(socket);
	}
	function OnDisconnect() {
	}
	
	
	function DataStart(type) {
		buffer_seek(buffer, buffer_seek_start, 0);
		buffer_write(buffer, buffer_u16, type);
	}
	function DataWrite(type, data) {
		buffer_write(buffer, type, data);
	}
	function DataSend(socket) {
		network_send_packet(socket, buffer, buffer_tell(buffer));
	}
}

