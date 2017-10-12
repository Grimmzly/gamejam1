/// @description Insert description here
// You can write your code in this editor
if(task = "join") {
	type = async_load[? "type"];
	if(type = network_type_data) {
		mID = buffer_read(async_load[? "buffer"],buffer_u8);
		Buffer = async_load[? "buffer"]; //Added
		switch(mID) {
			case 0:
				name = buffer_read(async_load[? "buffer"],buffer_string);
				with(obj_server_name) {
					if(text) = obj_lobby.name then obj_lobby.server_name_exists = true;
				}
				if(!server_name_exists) {
					server_name_obj = instance_create_layer(360,instance_number(obj_server_name)*164+5,"Instances",obj_server_name);
					server_name_obj.text = name;
					server_name_obj.ip = async_load[? "ip"];
					buffer_seek(buffer,buffer_seek_start,0);
					buffer_write(buffer,buffer_u8,0);
					buffer_write(buffer,buffer_u32,current_time);
					network_send_udp(udp_socket,async_load[? "ip"],35235,buffer,buffer_tell(buffer));
				}
			break;
			case 1:
				ping = current_time-buffer_read(async_load[? "buffer"],buffer_u32);
				ip = async_load[? "ip"];
				found_name_obj = 0;
				with(obj_server_name) {
					if(ip = obj_lobby.ip) {
						obj_lobby.found_name_obj = id;
					}
				}
				found_name_obj.ping = ping;
				break;
				case 2:
					GlobalPlayer.x = buffer_read(async_load[?"buffer"],buffer_u16);
					GlobalPlayer.y = buffer_read(async_load[?"buffer"],buffer_u16);
				break;
				case 3: //Added Statement
					bullet = instance_create_layer(GlobalPlayer.x,GlobalPlayer.y,"Instances",obj_bullet);
					bullet.direction = buffer_read(Buffer,buffer_u16);
				break;
		}
	}
}
if(task = "host") { 
	rec_buffer = async_load[? "buffer"];
	type = async_load[? "type"];
	if(type = network_type_connect) { 
		PlayerSocket = async_load[? "socket"];
		LocalPlayer = instance_create_layer(32,32,"Instances",obj_player);
		GlobalPlayer = instance_create_layer(32,32,"Instances",obj_player);
	}
	if(type = network_type_data) {
		mID = buffer_read(rec_buffer,buffer_u8);
		switch(mID) {
			case 0:
				buffer_seek(buffer,buffer_seek_start,0);
				buffer_write(buffer,buffer_u8,1);
				buffer_write(buffer,buffer_u32,buffer_read(rec_buffer,buffer_u32));
				network_send_udp(socket,async_load[? "ip"],35237,buffer,buffer_tell(buffer));
			break;
			case 2:
				GlobalPlayer.x = buffer_read(rec_buffer,buffer_u16);
				GlobalPlayer.y = buffer_read(rec_buffer,buffer_u16);
			break;
			case 3: //Added Statement
					bullet = instance_create_layer(GlobalPlayer.x,GlobalPlayer.y,"Instances",obj_bullet);
					bullet.direction = buffer_read(rec_buffer,buffer_u16);
				break;
		}
	}
}
