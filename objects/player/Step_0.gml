/// @description Insert description here
// You can write your code in this editor

if keyboard_check(ord("A")) && x > 35 {
	x -= 5;
	sx = -3;
}
if keyboard_check(ord("W")) && y > 20{
	y -= 5;
}
if keyboard_check(ord("S")) && y < room_height - 80 {
	y += 5;
}
if keyboard_check(ord("D")) && x < room_width - 40 {
	x += 5;
	sx = 3;
}
if mouse_check_button_pressed(mb_left) {
	if (global.text == 5)
		global.text = 6;
	else if (global.text == 6)
		global.text = 7;
	else if (global.text == 3) && global.haveTreasure == true
		global.text = 8;
	else if (global.text != 0)
		global.text = 0;
	
    if collision_point(mouse_x, mouse_y, mouse, true, true) { //Arguments are (x, y, obj, prec, notme)
        global.text = 1;
    }
	if collision_point(mouse_x, mouse_y, human, true, true) { //Arguments are (x, y, obj, prec, notme)
        global.text = 2;
    }
	if collision_point(mouse_x, mouse_y, scruff, true, true) { //Arguments are (x, y, obj, prec, notme)
        global.text = 3;
    }
	if collision_point(mouse_x, mouse_y, glasses, true, true) { //Arguments are (x, y, obj, prec, notme)
        global.text = 4;
		global.haveGlasses = true;
		sprite_delete(spr_glasses);
    }
}