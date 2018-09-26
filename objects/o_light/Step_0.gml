if global.level == 1
	x += irandom_range(1,6)*dsin(t);

if global.level >= 2
{
	x += irandom_range(1,6)*dsin(t/2);
	y += dsin(t);
}
t++;