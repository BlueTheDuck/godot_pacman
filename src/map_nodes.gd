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
# 
const col1 = 16;		# 14
const col2 = col1+24;	# 38
const col3 = col2+36;	# 74
const col4 = col3+36;	# 110
const col5 = col4+36;	# 146
const col6 = col5+36;	# 182
const col7 = col6+36;	# 218
const col8 = col7+36;	# 254
const col9 = col8+36;	# 290
const col10 = col9+24;	# 314
var list: Array = [
# Row 1
	Point.new(Vector2(col1,52),[-1,1,62,-1]),
	Point.new(Vector2(col3,52),[-1,2,54,0]),
	Point.new(Vector2(col5,52),[-1,-1,63,1]),
	Point.new(Vector2(col6,52),[-1,4,64,-1]),
	Point.new(Vector2(col8,52),[-1,5,59,3]),
	Point.new(Vector2(col10,52),[-1,-1,65,4]),
# Row 2
	Point.new(Vector2(col1,102),[0,7,62,-1]),
	Point.new(Vector2(col3,102),[1,8,54,6]),
	Point.new(Vector2(col4,102),[-1,9,55,7]),
	Point.new(Vector2(col5,102),[2,10,-1,8]),
	Point.new(Vector2(col6,102),[3,11,-1,9]),
	Point.new(Vector2(col7,102),[-1,12,58,10]),
	Point.new(Vector2(col8,102),[4,13,59,11]),
	Point.new(Vector2(col10,102),[5,-1,65,12]),
# Row 3
	Point.new(Vector2(col1,139),[6,15,-1,-1]),
	Point.new(Vector2(col3,139),[7,-1,54,14]),
	Point.new(Vector2(col4,139),[8,17,-1,-1]),
	Point.new(Vector2(col5,139),[-1,-1,63,16]),
	Point.new(Vector2(col6,139),[-1,19,64,-1]),
	Point.new(Vector2(col7,139),[11,-1,-1,18]),
	Point.new(Vector2(col8,139),[12,21,59,-1]),
	Point.new(Vector2(col10,139),[13,-1,-1,20]),
# Row 4
	Point.new(Vector2(col4,177),[-1,23,55,-1]),
	Point.new(Vector2(col5,177),[17,24,-1,22]),
	Point.new(Vector2(col6,177),[18,25,-1,23]),
	Point.new(Vector2(col7,177),[-1,-1,58,24]),
# Row 5
	Point.new(Vector2(col1,214),[-1,27,-1,-1]),
	Point.new(Vector2(col3,214),[15,28,54,26]),
	Point.new(Vector2(col4,214),[22,-1,55,27]),
	Point.new(Vector2(col7,214),[25,30,58,-1]),
	Point.new(Vector2(col8,214),[20,31,59,29]),
	Point.new(Vector2(col10,214),[-1,-1,-1,30]),
# Row 6
	Point.new(Vector2(col4,251),[28,33,55,-1]),
	Point.new(Vector2(col7,251),[29,-1,58,32]),
# Row 7
	Point.new(Vector2(col1,289),[-1,35,62,-1]),
	Point.new(Vector2(col3,289),[27,36,54,34]),
	Point.new(Vector2(col4,289),[32,37,-1,35]),
	Point.new(Vector2(col5,289),[-1,-1,63,36]),
	Point.new(Vector2(col6,289),[-1,39,64,-1]),
	Point.new(Vector2(col7,289),[33,40,-1,38]),
	Point.new(Vector2(col8,289),[30,41,59,39]),
	Point.new(Vector2(col10,289),[-1,-1,65,40]),
# Row 8
	Point.new(Vector2(col1,326),[34,43,-1,-1]),
	Point.new(Vector2(col2,326),[-1,-1,53,42]),
	Point.new(Vector2(col3,326),[35,45,54,-1]),
	Point.new(Vector2(col4,326),[-1,46,55,44]),
	Point.new(Vector2(col5,326),[37,47,-1,45]),
	Point.new(Vector2(col6,326),[38,48,-1,46]),
	Point.new(Vector2(col7,326),[-1,49,58,47]),
	Point.new(Vector2(col8,326),[40,-1,59,48]),
	Point.new(Vector2(col9,326),[-1,51,60,-1]),
	Point.new(Vector2(col10,326),[41,-1,-1,50]),
# Row 9
	Point.new(Vector2(col1,363),[-1,53,62,-1]),
	Point.new(Vector2(col2,363),[43,54,-1,52]),
	Point.new(Vector2(col3,363),[44,-1,-1,53]),
	Point.new(Vector2(col4,363),[45,56,-1,-1]),
	Point.new(Vector2(col5,363),[-1,-1,63,55]),
	Point.new(Vector2(col6,363),[-1,58,64,-1]),
	Point.new(Vector2(col7,363),[48,-1,-1,57]),
	Point.new(Vector2(col8,363),[49,60,-1,-1]),
	Point.new(Vector2(col9,363),[50,61,-1,59]),
	Point.new(Vector2(col10,363),[41,-1,65,60]),
# Row 10
	Point.new(Vector2(col1,410),[52,63,-1,-1]),
	Point.new(Vector2(col5,410),[56,64,-1,62]),
	Point.new(Vector2(col6,410),[57,65,-1,63]),
	Point.new(Vector2(col10,410),[61,-1,-1,64])
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