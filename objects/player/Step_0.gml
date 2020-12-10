/// @description Insert description here
// You can write your code in this editor

if room == MainRoom && global.artPieces == 4 && global.text < 60 || room == MainRoom && global.artPieces == 4 && global.text == 100{
	global.text = 60;
}


if keyboard_check(ord("A")) && x > 35 {
	x -= 5;
	sx = -3;
	if room == MouseRoom
		sx = -4;
}
if keyboard_check(ord("D")) && x < room_width - 40 {
	x += 5;
	sx = 3;
	if room == MouseRoom
		sx = 4;
}

if room == MainRoom || room == MouseRoom {
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

if room == ScruffsRoom && global.artFound[3] == 0 && global.text < 100
	global.text = 101;
else if room == ScruffsRoom && global.text < 100
	global.text = 106;

if room == MouseRoom {
	if global.clogged == true
		obj_cheese.visible = true;
	else
		obj_cheese.visible = false;
}

if mouse_check_button_pressed(mb_left) {		
	
	if global.text == -5 {
		global.text = 0
		glasses.visible = true;
	}
	else if global.text == 90
		global.text = 0;
	else if global.text == 62
		global.text = 62;
	else if global.text > 59 && global.text < 100
		global.text += 1;
	else if global.text < 0 
		global.text -= 1;
	else if global.text == 103 {
		global.text = 104;
		global.artPieces += 1;
	}
	else if global.text == 105 {
		global.text = 0;
		room_goto(MouseRoom);
	}
	else if global.text == 106
		global.text = 107;
	else if global.text == 107 {
		room_goto(MouseRoom);
		global.text = 0;
	}
	else if global.text > 100 {
		global.text += 1;
	}
	else if (global.text == 5)
		global.text = 6;
	else if (global.text == 6)
		global.text = 7;
	else if (global.text == 30)
		global.text = 31;
	else if global.text == 29  && global.clogged == true {
		global.text = 33;
		global.clogged = false;
		mouse2.visible = true;
	}
	else if (global.text == 3) && global.haveTreasure == true
		global.text = 8;
	else if (global.text == 13)
		global.text = 14;
	else if global.text > 9 && global.text < 13 || global.text == 21 || global.text == 23 || global.text == 22 || global.text == 27 || global.text == 28 || global.text == 63 {
	}
	else if global.text == 15 
		global.text = 16;
	else if global.text == 16 {
		cat1.visible = true;
		cat2.visible = true;
		cat3.visible = true;
		global.text = 17;
	}
	else if (global.text == 50) || (global.text == 51) || (global.text == 52) {
		for (i=0; i<5; i+=1)
			response[i] = 0;
		global.text = 0;
	}
	else if (global.text != 0)
		global.text = 0;
	
    
	if collision_point(mouse_x, mouse_y, obj_artpiece, true, true) { //Arguments are (x, y, obj, prec, notme)
        global.text = 90;
		instance_destroy(obj_artpiece);
		global.artPieces += 1;
		if room == MainRoom
			global.artFound[0] = 1;
		else if room == CatRoom
			global.artFound[1] = 1;
		else if room == MouseRoom && global.cutscene == false
			global.artFound[2] = 1;
		else if global.cutscene == true
			global.artFound[3] = 1;
    }
	else if collision_point(mouse_x, mouse_y, mouse, true, true) && global.haveKey == false { //Arguments are (x, y, obj, prec, notme)
        global.text = 1;
    }
	else if collision_point(mouse_x, mouse_y, mouse, true, true) && global.haveKey == true
		global.text = 20;
	
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
	if room == MainRoom && point_in_rectangle(mouse_x, mouse_y, 575, 0, 695, 69) && global.text != 21 && global.sewer == true{
		global.text = 21;
	}
	else if point_in_rectangle(mouse_x, mouse_y, 575, 0, 695, 69) && global.text == 21{
		room_goto(MouseRoom);
		global.text = 0;
	}
	else if global.text == 21 
		global.text = 0;
		
	//0 nothing, 1 house, 2 pipe, 3 ladder, 4 wood
	if room == MouseRoom {
			
		if collision_point(mouse_x, mouse_y, mouse2, true, true) && global.kicked == false || collision_point(mouse_x, mouse_y, mouse2, true, true) && global.scruffs == true
			global.text = 26;
		else if collision_point(mouse_x, mouse_y, mouse2, true, true) && global.kicked == true
			global.text = 27;
		
		if collision_point(mouse_x, mouse_y, collisions, true, true) && mouse_x < 237
			global.text = 24;
		else if collision_point(mouse_x, mouse_y, collisions, true, true) && mouse_x < 471 && global.haveCheese == false
			global.text = 22;
		else if collision_point(mouse_x, mouse_y, collisions, true, true) && mouse_x < 471 && global.haveCheese == true
			global.text = 28;
		else if collision_point(mouse_x, mouse_y, collisions, true, true) && mouse_x < 700 && global.text != 23
			global.text = 23;
		else if collision_point(mouse_x, mouse_y, collisions, true, true) && mouse_x < 700 && global.text == 23 {
			room_goto(MainRoom);
			global.text = 0;
		}
		else if global.text == 23
			global.text = 0;
		else if global.text == 22 && point_in_rectangle(mouse_x, mouse_y, 770, 75, 805, 90)
			global.text = 29;
		else if global.text == 22
			global.text = 0;
		else if global.text == 27 && point_in_rectangle(mouse_x, mouse_y, 780, 95, 815, 120)
			global.text = 30;
		else if global.text == 28 && point_in_rectangle(mouse_x, mouse_y, 449, 99, 481, 118)
			global.text = 32;
		else if collision_point(mouse_x, mouse_y, collisions, true, true)
			global.text = 25;
		
	}
}