
function Client() constructor {
	buffer = buffer_create(1024, buffer_grow, 1);
	socket = network_create_socket(network_socket_tcp);
	
	function Connect(url, port) {
		network_connect(socket, url, port);
	}
	function OnAsync() {
		var type = async_load[? "type"];
		switch(type) {
			case network_type_connect: OnConnect(); break;
			case network_type_disconnect: OnDisconnect(); break;
			case network_type_data: OnData(); break;
		}
	}
	function OnConnect() {
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
	function DataSend() {
		network_send_packet(socket, buffer, buffer_tell(buffer));
	}
	
}