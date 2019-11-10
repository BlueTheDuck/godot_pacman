extends Node

signal update_score(amount);
signal change_node(node,name);
signal move_player(direction);

var BIGGEST_DISTANCE: int = 66*12; # Max distance that can be travelled in one direction
var score: int = 0;
var resets: int = 0;