extends Node

enum Directions {
	UP = 0,
	RIGHT,
	DOWN,
	LEFT,
	NONE,
}

func direction(name: String) -> Dictionary:
	if name=="up":
		return Directions.UP;
	elif name=="right":
		return Directions.RIGHT;
	elif name=="down":
		return Directions.DOWN;
	elif name=="left":
		return Directions.LEFT;
	else:
		print("Error: %s is not a Direction"%name);
		get_tree().quit();
		return Directions.NONE;
		

class Point:
	var pos: Vector2;
	var connections: Array;
	func _init(pos: Vector2,connections: Array):
		self.pos = pos;
		self.connections = connections;
	func get_id_on(dir: int) -> int:
		return self.connections[dir];
# {"pos":Vector2,"connections":[0,0,0,0]}

const tile_size = 12;
const row1 = 102;		# 52
const row2 = row1+tile_size*8;	# 107
const row3 = row2+tile_size*6;	# 139 
const row4 = row3+tile_size*6;	# 177
const row5 = row4+tile_size*6;	# 214
const row6 = row5+tile_size*6;	# 251
const row7 = row6+tile_size*6;	# 293
const row8 = row7+tile_size*6;	# 330
const row9 = row8+tile_size*6;	# 363
const row10 = row9+tile_size*6;	# 410
const col1 = 30;		# 28
const col2 = col1+tile_size*4;	# 72
const col3 = col2+tile_size*6;	# 74
const col4 = col3+tile_size*6;	# 110
const col5 = col4+tile_size*6;	# 146
const col6 = col5+tile_size*6;	# 182
const col7 = col6+tile_size*6;	# 218
const col8 = col7+tile_size*6;	# 254
const col9 = col8+tile_size*6;	# 290
const col10 = col9+tile_size*4;	# 314
var list: Array = [
# Row 1
	Point.new(Vector2(col1,row1),[-1,1,62,-1]),
	Point.new(Vector2(col3,row1),[-1,2,54,0]),
	Point.new(Vector2(col5,row1),[-1,-1,63,1]),
	Point.new(Vector2(col6,row1),[-1,4,64,-1]),
	Point.new(Vector2(col8,row1),[-1,5,59,3]),
	Point.new(Vector2(col10,row1),[-1,-1,65,4]),
# Row 2
	Point.new(Vector2(col1,row2),[0,7,62,-1]),
	Point.new(Vector2(col3,row2),[1,8,54,6]),
	Point.new(Vector2(col4,row2),[-1,9,55,7]),
	Point.new(Vector2(col5,row2),[2,10,-1,8]),
	Point.new(Vector2(col6,row2),[3,11,-1,9]),
	Point.new(Vector2(col7,row2),[-1,12,58,10]),
	Point.new(Vector2(col8,row2),[4,13,59,11]),
	Point.new(Vector2(col10,row2),[5,-1,65,12]),
# Row 3
	Point.new(Vector2(col1,row3),[6,15,-1,-1]),
	Point.new(Vector2(col3,row3),[7,-1,54,14]),
	Point.new(Vector2(col4,row3),[8,17,-1,-1]),
	Point.new(Vector2(col5,row3),[-1,-1,63,16]),
	Point.new(Vector2(col6,row3),[-1,19,64,-1]),
	Point.new(Vector2(col7,row3),[11,-1,-1,18]),
	Point.new(Vector2(col8,row3),[12,21,59,-1]),
	Point.new(Vector2(col10,row3),[13,-1,-1,20]),
# Row 4
	Point.new(Vector2(col4,row4),[-1,23,55,-1]),
	Point.new(Vector2(col5,row4),[17,24,-1,22]),
	Point.new(Vector2(col6,row4),[18,25,-1,23]),
	Point.new(Vector2(col7,row4),[-1,-1,58,24]),
# Row 5
	Point.new(Vector2(col1,row5),[-1,27,-1,31]),
	Point.new(Vector2(col3,row5),[15,28,54,26]),
	Point.new(Vector2(col4,row5),[22,-1,55,27]),
	Point.new(Vector2(col7,row5),[25,30,58,-1]),
	Point.new(Vector2(col8,row5),[20,31,59,29]),
	Point.new(Vector2(col10,row5),[-1,26,-1,30]),
# Row 6
	Point.new(Vector2(col4,row6),[28,33,55,-1]),
	Point.new(Vector2(col7,row6),[29,-1,58,32]),
# Row 7
	Point.new(Vector2(col1,row7),[-1,35,62,-1]),
	Point.new(Vector2(col3,row7),[27,36,54,34]),
	Point.new(Vector2(col4,row7),[32,37,-1,35]),
	Point.new(Vector2(col5,row7),[-1,-1,63,36]),
	Point.new(Vector2(col6,row7),[-1,39,64,-1]),
	Point.new(Vector2(col7,row7),[33,40,-1,38]),
	Point.new(Vector2(col8,row7),[30,41,59,39]),
	Point.new(Vector2(col10,row7),[-1,-1,65,40]),
# Row 8
	Point.new(Vector2(col1,row8),[34,43,-1,-1]),
	Point.new(Vector2(col2,row8),[-1,-1,53,42]),
	Point.new(Vector2(col3,row8),[35,45,54,-1]),
	Point.new(Vector2(col4,row8),[-1,46,55,44]),
	Point.new(Vector2(col5,row8),[37,47,-1,45]),
	Point.new(Vector2(col6,row8),[38,48,-1,46]),
	Point.new(Vector2(col7,row8),[-1,49,58,47]),
	Point.new(Vector2(col8,row8),[40,-1,59,48]),
	Point.new(Vector2(col9,row8),[-1,51,60,-1]),
	Point.new(Vector2(col10,row8),[41,-1,-1,50]),
# Row 9
	Point.new(Vector2(col1,row9),[-1,53,62,-1]),
	Point.new(Vector2(col2,row9),[43,54,-1,52]),
	Point.new(Vector2(col3,row9),[44,-1,-1,53]),
	Point.new(Vector2(col4,row9),[45,56,-1,-1]),
	Point.new(Vector2(col5,row9),[-1,-1,63,55]),
	Point.new(Vector2(col6,row9),[-1,58,64,-1]),
	Point.new(Vector2(col7,row9),[48,-1,-1,57]),
	Point.new(Vector2(col8,row9),[49,60,-1,-1]),
	Point.new(Vector2(col9,row9),[50,61,-1,59]),
	Point.new(Vector2(col10,row9),[-1,-1,65,60]),
# Row 10
	Point.new(Vector2(col1,row10),[52,63,-1,-1]),
	Point.new(Vector2(col5,row10),[56,64,-1,62]),
	Point.new(Vector2(col6,row10),[57,65,-1,63]),
	Point.new(Vector2(col10,row10),[61,-1,-1,64]),
# Pacman spawn
	Point.new(Vector2((col5+col6)/2,row8),[-1,47,-1,46])
]

func find_closest_node(pos: Vector2):
	var closest: int = -1;
	var distance: float = INF;
	for i in range(0,list.size()):
		var node: Point = list[i];
		var dist_to_i = node.pos.distance_to(pos);
		if dist_to_i < distance:
			closest = i;
			distance = dist_to_i;
	return {"id":closest,"dist":distance};