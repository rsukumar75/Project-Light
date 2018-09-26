draw_set_color(c_white);
draw_text_transformed(50,80,"Coins: " + string(global.num_coins),1,1,0);
var health_pct = (global.curr_health/global.max_health) * 100;
draw_healthbar(50,150,150,180,health_pct,c_black,c_red,c_green,0,false,true);
draw_text(50,120,"Health");
draw_text(50,100,"Level: " + string(global.level));
draw_text(50,190,"Lives: " + string(global.num_lives));
draw_self();