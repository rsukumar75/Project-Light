if(global.curr_health < global.max_health)
{
	global.curr_health += 3;
	if global.curr_health > global.max_health
		global.curr_health = global.max_health;
	sprite_index = s_bananaEaten;
	alarm[0] = 5;
}