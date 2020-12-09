/// @description Insert description here
// You can write your code in this editor
if room == MouseRoom {
	if global.scruffs == true {
		room_goto(targetRoom);
		player.x = targetX;
		player.y = targetY;
	}
}
else {
	room_goto(targetRoom);
	player.x = targetX;
	player.y = targetY;
}

