extends Node


enum Directions {
	UP = 0,RIGHT,DOWN,LEFT
}

const list: Array = [
	{
		"pos": Vector2(14,52),
		"up": false,
		"right": true,
		"down": true,
		"left": false
	},
	{
		"pos": Vector2(74,52),
		"up": false,
		"right": true,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(146,52),
		"up": false,
		"right": false,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(182,52),
		"up": false,
		"right": true,
		"down": true,
		"left": false
	},
	{
		"pos": Vector2(254,52),
		"up": false,
		"right": true,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(314,52),
		"up": false,
		"right": false,
		"down": true,
		"left": true
	},
# Second row
	{
		"pos": Vector2(14,102),
		"up": true,
		"right": true,
		"down": true,
		"left": false
	},
	{
		"pos": Vector2(74,102),
		"up": true,
		"right": true,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(110,102),
		"up": false,
		"right": true,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(146,102),
		"up": true,
		"right": true,
		"down": false,
		"left": true
	},
	{
		"pos": Vector2(182,102),
		"up": true,
		"right": true,
		"down": false,
		"left": true
	},
	{
		"pos": Vector2(218,102),
		"up": false,
		"right": true,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(254,102),
		"up": true,
		"right": true,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(314,102),
		"up": true,
		"right": false,
		"down": true,
		"left": true
	},
# Third row
	{
		"pos": Vector2(14,139),
		"up": true,
		"right": true,
		"down": false,
		"left": false
	},
	{
		"pos": Vector2(74,139),
		"up": true,
		"right": false,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(110,139),
		"up": true,
		"right": true,
		"down": false,
		"left": false
	},
	{
		"pos": Vector2(146,139),
		"up": false,
		"right": false,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(182,139),
		"up": false,
		"right": true,
		"down": true,
		"left": false
	},
	{
		"pos": Vector2(218,139),
		"up": true,
		"right": false,
		"down": false,
		"left": true
	},
	{
		"pos": Vector2(254,139),
		"up": true,
		"right": true,
		"down": true,
		"left": false
	},
	{
		"pos": Vector2(314,139),
		"up": true,
		"right": false,
		"down": false,
		"left": true
	},
# Fourth row
	{
		"pos": Vector2(110,177),
		"up": false,
		"right": true,
		"down": true,
		"left": false
	},
	{
		"pos": Vector2(146,177),
		"up": true,
		"right": true,
		"down": false,
		"left": true
	},
	{
		"pos": Vector2(182,177),
		"up": true,
		"right": true,
		"down": false,
		"left": true
	},
	{
		"pos": Vector2(218,177),
		"up": false,
		"right": false,
		"down": true,
		"left": true
	},
# Fifth row
	{
		"pos": Vector2(14,214),
		"up": false,
		"right": true,
		"down": false,
		"left": false
	},
	{
		"pos": Vector2(74,214),
		"up": true,
		"right": true,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(110,214),
		"up": true,
		"right": false,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(218,214),
		"up": true,
		"right": true,
		"down": true,
		"left": false
	},
	{
		"pos": Vector2(254,214),
		"up": true,
		"right": true,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(314,214),
		"up": false,
		"right": false,
		"down": false,
		"left": true
	},
# Sixth row
	{
		"pos": Vector2(110,251),
		"up": true,
		"right": true,
		"down": true,
		"left": false
	},
	{
		"pos": Vector2(218,251),
		"up": true,
		"right": false,
		"down": true,
		"left": true
	},
# Seventh row
	{
		"pos": Vector2(14,289),
		"up": false,
		"right": true,
		"down": true,
		"left": false
	},
	{
		"pos": Vector2(74,289),
		"up": true,
		"right": true,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(110,289),
		"up": true,
		"right": true,
		"down": false,
		"left": true
	},
	{
		"pos": Vector2(146,289),
		"up": false,
		"right": false,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(182,289),
		"up": false,
		"right": true,
		"down": true,
		"left": false
	},
	{
		"pos": Vector2(218,289),
		"up": true,
		"right": true,
		"down": false,
		"left": true
	},
	{
		"pos": Vector2(254,289),
		"up": true,
		"right": true,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(314,289),
		"up": false,
		"right": false,
		"down": true,
		"left": true
	},
# Eighth row
	{
		"pos": Vector2(14,326),
		"up": true,
		"right": true,
		"down": false,
		"left": false
	},
	{
		"pos": Vector2(38,326),
		"up": false,
		"right": false,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(74,326),
		"up": true,
		"right": true,
		"down": true,
		"left": false
	},
	{
		"pos": Vector2(110,326),
		"up": false,
		"right": true,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(146,326),
		"up": true,
		"right": true,
		"down": false,
		"left": true
	},
	{
		"pos": Vector2(182,326),
		"up": true,
		"right": true,
		"down": false,
		"left": true
	},
	{
		"pos": Vector2(218,326),
		"up": false,
		"right": true,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(254,326),
		"up": true,
		"right": false,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(290,326),
		"up": false,
		"right": true,
		"down": true,
		"left": false
	},
	{
		"pos": Vector2(314,326),
		"up": true,
		"right": false,
		"down": false,
		"left": true
	},
# Nineth
	{
		"pos": Vector2(14,363),
		"up": false,
		"right": true,
		"down": true,
		"left": false
	},
	{
		"pos": Vector2(38,363),
		"up": true,
		"right": true,
		"down": false,
		"left": true
	},
	{
		"pos": Vector2(74,363),
		"up": true,
		"right": false,
		"down": false,
		"left": true
	},
	{
		"pos": Vector2(110,363),
		"up": true,
		"right": true,
		"down": false,
		"left": false
	},
	{
		"pos": Vector2(146,363),
		"up": false,
		"right": false,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(182,363),
		"up": false,
		"right": true,
		"down": true,
		"left": false
	},
	{
		"pos": Vector2(218,363),
		"up": true,
		"right": false,
		"down": false,
		"left": true
	},
	{
		"pos": Vector2(254,363),
		"up": true,
		"right": true,
		"down": false,
		"left": false
	},
	{
		"pos": Vector2(290,363),
		"up": true,
		"right": true,
		"down": false,
		"left": true
	},
	{
		"pos": Vector2(314,363),
		"up": false,
		"right": false,
		"down": true,
		"left": true
	},
	{
		"pos": Vector2(14,401),
		"up": true,
		"right": true,
		"down": false,
		"left": false
	},
	{
		"pos": Vector2(146,401),
		"up": true,
		"right": true,
		"down": false,
		"left": true
	},
	{
		"pos": Vector2(182,401),
		"up": true,
		"right": true,
		"down": false,
		"left": true
	},
	{
		"pos": Vector2(314,401),
		"up": true,
		"right": false,
		"down": false,
		"left": true
	}
]

static func get_nodes():
	return list;
	
static func find_closest_node(pos: Vector2):
	var closest: int = -1;
	var distance: float = INF;
	for i in range(0,list.size()):
		var node: Dictionary = list[i];
		var dist_to_i = node.pos.distance_to(pos);
		if dist_to_i < distance:
			closest = i;
			distance = dist_to_i;
	return {"id":closest,"dist":distance};