/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(spr_player, -1, x, y, sx, sy, 0, c_white, 1);

if (global.dropNecklace == 1) {
	draw_sprite_ext(kneelingAnimation, -1, 0, 0, 2.2, 2.2, 0, c_white, 1);
}
else if (global.dropNecklace == 2) && room == MainRoom 
	draw_sprite_ext(spr_afterGlasses, -1, 1000, 370, 7, 7, 0, c_white, 1);

if (global.catUnlocked) && room == MainRoom {
	catRoom = instance_create_layer(1260, 140, layer, obj_warp);
	catRoom.targetRoom = CatRoom;
	catRoom.targetX = 150;
	catRoom.targetY = 340;
}

if (global.text != 0){
	if room == MainRoom {
		draw_set_colour(c_orange);
		draw_rectangle(370, 620, 1000, 730, false);
		draw_set_colour(c_black);
		draw_rectangle(370, 620, 1000, 730, true);
	}
	else if room == CatRoom {
		draw_set_colour(c_orange);
		draw_rectangle(370, 60, 1000, 150, false);
		draw_set_colour(c_black);
		draw_rectangle(370, 60, 1000, 150, true);
	}
	
	if (global.text == 1)
		draw_text(450, 650, "I need a key to open this sewer");
		
	else if ((global.text == 2) && (global.haveGlasses = true) || global.text ==5) {
		draw_text(450, 650, "You found my glasses!");
		global.text = 5;
	}
	else if (global.text == 2) && (global.haveGlasses = false)
		draw_text(450, 650, "I can't find my glasses");
		
	else if (global.text == 3) && global.haveTreasure == false
		draw_text(450, 650, "You gotta bring me treasure if you wanna pass");
		
	else if (global.text == 3) && global.haveTreasure == true {
		draw_text(450, 650, "Sweet! That gold necklace will do nicely");
	}
	
	if (global.text == 8) {
		global.haveTreasure = false;
		sprite_delete(spr_scruff);
		draw_text(450, 650, "*New area unlocked*");
		global.catUnlocked = true;
	}
		
		
	if (global.text == 4)
		draw_text(450, 650, "Glasses found!");
		
	if (global.text == 6){
		draw_text(450, 650, "*As the man reaches down to pet you, \nhis gold necklace falls to the floor*");
		sprite_delete(spr_beforeGlasses);
		global.dropNecklace = 1;
	}
	if (global.text == 7) {
		draw_text(450, 650, "Gold necklace received!");
		global.haveTreasure = true;
		sprite_delete(kneelingAnimation);
		global.dropNecklace = 2;
	}
	
	
	
	if (global.text == 10) {
		draw_text(450, 85, "I lost my compass in the grass fields to the west, \nwhich way should I go to get it back?");
		draw_set_colour(c_orange);
		draw_rectangle(370, 160, 1000, 285, false);
		draw_set_colour(c_black);
		draw_rectangle(370, 160, 1000, 285, true);
		
		draw_text(620, 175, "(Click one)");
		draw_text(500, 215, "Up");
		draw_text(600, 215, "Down");
		draw_text(700, 215, "Left");
		draw_text(800, 215, "Right");
		draw_text(620, 255, "I'm not sure..");
	}
	if (global.text == 11) {
		draw_text(450, 85, "I need to make a meeting before the sun sets at 6:35, \nwhich direction is the grass field?");
		draw_set_colour(c_orange);
		draw_rectangle(370, 160, 1000, 285, false);
		draw_set_colour(c_black);
		draw_rectangle(370, 160, 1000, 285, true);
		
		draw_text(620, 175, "(Click one)");
		draw_text(500, 215, "North");
		draw_text(600, 215, "South");
		draw_text(700, 215, "East");
		draw_text(800, 215, "West");
		draw_text(620, 255, "I'm not sure..");
	}
	if (global.text == 12) {
		draw_text(450, 85, "I’m meeting my buddy at the sewer a bit north of here \nat dusk, what time does the sun set?");
		draw_set_colour(c_orange);
		draw_rectangle(370, 160, 1000, 285, false);
		draw_set_colour(c_black);
		draw_rectangle(370, 160, 1000, 285, true);
		
		draw_text(620, 175, "(Click one)");
		draw_text(500, 215, "4:51");
		draw_text(600, 215, "7:23");
		draw_text(700, 215, "6:35");
		draw_text(800, 215, "8:01");
		draw_text(620, 255, "I'm not sure..");
	}
	
	if (global.text == 50) { //2
		draw_set_colour(c_orange);
		draw_rectangle(370, 160, 1000, 285, false);
		draw_set_colour(c_black);
		draw_rectangle(370, 160, 1000, 285, true);
		if (response[4] == 1)
			draw_text(450, 85, "That's ok...");
		else if (response[1] == 1) {
			draw_text(450, 85, "Yes!! Thank you!!");
			global.catAnswers[0] = 1;
		}
		else
			draw_text(450, 85, "I'm not sure about that...");
		
	}
	else if (global.text == 51) { //4
		draw_set_colour(c_orange);
		draw_rectangle(370, 160, 1000, 285, false);
		draw_set_colour(c_black);
		draw_rectangle(370, 160, 1000, 285, true);
		if (response[4] == 1)
			draw_text(450, 85, "That's ok...");
		else if (response[3] == 1) {
			draw_text(450, 85, "Yes!! Thank you!!");
			global.catAnswers[1] = 1;
		}
		else
			draw_text(450, 85, "I'm not sure about that...");
	}
	else if (global.text == 52) { //3
		draw_set_colour(c_orange);
		draw_rectangle(370, 160, 1000, 285, false);
		draw_set_colour(c_black);
		draw_rectangle(370, 160, 1000, 285, true);
		if (response[4] == 1)
			draw_text(450, 85, "That's ok...");
		else if (response[2] == 1) {
			draw_text(450, 85, "Yes!! Thank you!!");
			global.catAnswers[2] = 1;
		}
		else
			draw_text(450, 85, "I'm not sure about that...");
	}
	
	if global.text == 55
		draw_text(450, 85, "Thanks, I'll head down to reach the western\ngrass fields.");
	else if global.text == 56
		draw_text(450, 85, "Thanks, when the sun sets at 6:35\nI'll head west.");
	else if global.text == 57
		draw_text(450, 85, "Thanks, I'll head north toward the\nsewer at 6:35");
	
	if (global.text == 13) {
		draw_text(450, 85, "The treasure room behind me might have something that can \nhelp you, but not just anyone can enter.");
	}
	if (global.text == 14) {
		draw_text(450, 85, "Help out all my friends here to gain their trust, \nthen I'm sure you'll be welcomed as one of us");
	}
	if (global.text == 15) {
		draw_text(450, 85, "Wow! Looks like you've helped everyone out. \nWhy don't you take a look inside");
	}
	if (global.text == 16) {		
		cat1.visible = false;
		cat2.visible = false;
		cat3.visible = false;
		
		draw_sprite_ext(treasureAnim, -1, 0, 0, 2.2, 2.2, 0, c_white, 1);
		
		draw_set_colour(c_orange);
		draw_rectangle(370, 60, 1000, 150, false);
		draw_set_colour(c_black);
		draw_rectangle(370, 60, 1000, 150, true);

		sprite_delete(spr_scruff2);
		draw_text(450, 75, "As you marvel at the cats' treasure, you\nspot a small golden key and decide to\nbring it with you.");
	}
	
	
	
}


	