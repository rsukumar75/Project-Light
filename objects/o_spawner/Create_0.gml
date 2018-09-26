spawn_rate_birds = 180;
if global.level == 1
{
	spawn_rate_projectiles = 240;
}
else if global.level >= 2
{
	spawn_rate_projectiles = 210;
	spawn_rate_birds = 150;
}
alarm[0] = spawn_rate_birds;
alarm[1] = spawn_rate_projectiles;