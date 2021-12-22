
function OnData(){
	var data = async_load[? "buffer"];
	var type = buffer_read(data, buffer_u16);
	switch(type) {
		case DInit:
			var txt = buffer_read(data, buffer_string);
			show_debug_message(txt);
			break;
	}
}