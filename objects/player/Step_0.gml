/// @description Insert description here
// You can write your code in this editor

if keyboard_check(ord("A")) && x > 35 {
	x -= 5;
	sx = -3;
}
if keyboard_check(ord("D")) && x < room_width - 40 {
	x += 5;
	sx = 3;
}

if room == MainRoom {
	if keyboard_check(ord("W")) && y > 20{
		y -= 5;
	}
	if keyboard_check(ord("S")) && y < room_height - 80 {
		y += 5;
	}
}
else if room == CatRoom {
	if keyboard_check(ord("W")) && y > room_height/2 + 20{
		y -= 5;
	}
	if keyboard_check(ord("S")) && y < room_height - 80 {
		y += 5;
	}
}


if mouse_check_button_pressed(mb_left) {
	if (global.text == 5)
		global.text = 6;
	else if (global.text == 6)
		global.text = 7;
	else if (global.text == 3) && global.haveTreasure == true
		global.text = 8;
	else if (global.text == 13)
		global.text = 14;
	else if global.text > 9 && global.text < 13{
	}
	else if global.text == 15 
		global.text = 16;
	else if global.text == 16 {
		cat1.visible = true;
		cat2.visible = true;
		cat3.visible = true;
		global.text = 0;
	}
	else if (global.text == 50) || (global.text == 51) || (global.text == 52) {
		for (i=0; i<5; i+=1)
			response[i] = 0;
		global.text = 0;
	}
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
	
	//---------------------------------------------------------------------------
	
	if collision_point(mouse_x, mouse_y, cat1, true, true) { //Arguments are (x, y, obj, prec, notme)
        if (global.catAnswers[0] == 0)
			global.text = 10;
		else
			global.text = 55;
    }
	if collision_point(mouse_x, mouse_y, cat2, true, true) { //Arguments are (x, y, obj, prec, notme)
        if (global.catAnswers[1] == 0)
			global.text = 11;
		else
			global.text = 56;
    }
	if collision_point(mouse_x, mouse_y, cat3, true, true) { //Arguments are (x, y, obj, prec, notme)
        if (global.catAnswers[2] == 0)
			global.text = 12;
		else
			global.text = 57;
    }
	if collision_point(mouse_x, mouse_y, scruff2, true, true) { //Arguments are (x, y, obj, prec, notme)
        complete = true;
		for (i=0; i<2; i++){
			if (global.catAnswers[i] == 0)
				complete = false;
		}
		if (complete == true)
			global.text = 15; //welcome!
		else
			global.text = 13; //speech on trust
    }
	
	if global.text > 9 && global.text < 13 {
		if point_in_rectangle(mouse_x, mouse_y, 500, 215, 580, 245) { 
			response[0] = 1;
			global.text += 40;
	    }
		else if point_in_rectangle(mouse_x, mouse_y, 600, 215, 680, 245) { 
			response[1] = 1;
			global.text += 40;
	    }
		else if point_in_rectangle(mouse_x, mouse_y, 700, 215, 780, 245) { 
			response[2] = 1;
			global.text += 40;
	    }
		else if point_in_rectangle(mouse_x, mouse_y, 800, 215, 880, 245) { 
			response[3] = 1;
			global.text += 40;
	    }
		else if point_in_rectangle(mouse_x, mouse_y, 620, 255, 700, 285) { 
			response[4] = 1;
			global.text += 40;
	    }
		
	}
}