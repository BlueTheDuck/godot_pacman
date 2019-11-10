extends Node

class_name RemoteControl


var last_action = "";
var tcp: StreamPeerTCP = null;
var pacman = null;
var int_to_rot: Array = [
	"fwd",
	"rot_left",
	"bwd",
	"rot_right"
];
var force_cnx = true;

func _init(pacman: Area2D):
	self.pacman = pacman;
	var status = null;
	while status!=StreamPeerTCP.STATUS_CONNECTED and force_cnx==true:
		tcp = StreamPeerTCP.new();
		print("Connecting");
		var res = tcp.connect_to_host("127.0.0.1",4040);
		print("Status: ",tcp.get_status())
		assert(pacman!=null);
		if res==OK and tcp.get_status()==StreamPeerTCP.STATUS_CONNECTED:
			tcp.put_utf8_string("CNX");
			print("Sent data");
			process_command();
			break;
		elif force_cnx==false:
			break;
			
		
func process_command(pacman=null):
	if tcp.get_status()!=tcp.STATUS_CONNECTED:
		return;
	if tcp.get_available_bytes()==0:
		return;
	else:
		var rec = tcp.get_data(2);
		var bytes: Array = rec[1];
		match bytes[0]:
			0xFE:
				match bytes[1]:
					0xFE:
						print("Requested update");
						if pacman==null:
							for i in range(12):
								tcp.put_float(0.0);
							tcp.put_u32(0);
							return;
						for key in pacman.near_dots.keys():
							var value: float = pacman.near_dots[key];
#							print("Sending ",value," for ",key);
							tcp.put_float(value);
						for key in pacman.near_walls.keys():
							var value: float = pacman.near_walls[key];
#							print("Sending ",value," for ",key);
							tcp.put_float(value);
						for key in pacman.near_ghosts.keys():
							var value: float = pacman.near_ghosts[key];
#							print("Sending ",value," for ",key);
							tcp.put_float(value);
						tcp.put_u32(game_state.score);
					0x00:
						print("Closing");
						game_state.score = 0
						game_state.resets += 1
						pacman.get_tree().reload_current_scene()
					0xF0:
						print("Unimplemented")
						assert(false)
#						print("Receiving nn structure");
#						var nns: int = tcp.get_u64(); # Gen neuron count
#						print("%s neurons"%nns);
#						var cnxs: int = tcp.get_u32(); 
#						for i in range(cnxs):
#							var from: int = tcp.get_32();
#							var to: int = tcp.get_32();
#							var weight: float = tcp.get_float();
			0xFF:
				if last_action!="":
					Input.action_release(last_action);
					last_action = "";
				assert(bytes.size()==2);
				print(int_to_rot[bytes[1]]);
				game_state.emit_signal("move_player",int_to_rot[bytes[1]]);
				last_action = int_to_rot[bytes[1]];