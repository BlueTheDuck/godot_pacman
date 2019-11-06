extends Node

class_name RemoteControl

var last_action = "";
var tcp: StreamPeerTCP;
var pacman = null;
var int_to_dir: Array = ["up","right","down","left"];


func _init(pacman):
	self.pacman = pacman;
	tcp = StreamPeerTCP.new();
	print("Connecting");
	var res = tcp.connect_to_host("127.0.0.1",4040);
	assert(pacman!=null);
	if res==OK:
		tcp.put_utf8_string("CNX");
		print("Sent data");
		process_command();		
	else:
		print("No connection");
		
func process_command():
	if tcp.get_status()!=tcp.STATUS_CONNECTED:
		return;
	if tcp.get_available_bytes()==0:
		return;
	else:
		var rec = tcp.get_data(2);
		var bytes: Array = rec[1];
		match bytes[0]:
			0xFE:
				assert(bytes[1]==0xFE);
				for key in pacman.near_dots.keys():
					var value: float = pacman.near_dots[key];
					tcp.put_float(value);
			0xFF:
				if last_action!="":
					Input.action_release(last_action);
					last_action = "";
				assert(bytes.size()==2);
				print(int_to_dir[bytes[1]]);
				Input.action_press(int_to_dir[bytes[1]]);
				last_action = int_to_dir[bytes[1]];