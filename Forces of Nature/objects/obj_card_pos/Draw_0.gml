/// @description Insert description here
// You can write your code in this editor

if (abs(x - target_x) > 1){
	x = lerp(x, target_x, 0.2);
	depth = -1000;
} else{
	x = target_x;
	depth = target_depth;
}

if (abs(y - target_y) > 1){
	y = lerp(y, target_y, 0.2);
	depth = -1000;
} else{
	y = target_y;
	depth = target_depth;
}

if (face_index == 0) sprite_index = spr_east;
if (face_index == 1) sprite_index = spr_south;
if (face_index == 2) sprite_index = spr_west;
if (face_index == 3) sprite_index = spr_north;
if (face_index == 4) sprite_index = spr_center;
if (face_up == false) sprite_index = spr_pos_back;

draw_sprite(sprite_index, image_index, x, y);