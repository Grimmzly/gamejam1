/// @description RESOLUTION LIST

res_list[0,0] = 800; res_list[0,1] = 600;
res_list[1,0] = 1024; res_list[1,1] = 768;
res_list[2,0] = 1152; res_list[2,1] = 648;
res_list[3,0] = 1152; res_list[3,1] = 720;
res_list[4,0] = 1152; res_list[4,1] = 864;
res_list[5,0] = 1280; res_list[5,1] = 720;
res_list[6,0] = 1280; res_list[6,1] = 768;
res_list[7,0] = 1280; res_list[7,1] = 800;
res_list[8,0] = 1280; res_list[8,1] = 960;
res_list[9,0] = 1280; res_list[9,1] = 1024;
res_list[10,0] = 1360; res_list[10,1] = 768;
res_list[11,0] = 1366; res_list[11,1] = 768;
res_list[12,0] = 1440; res_list[12,1] = 900;
res_list[13,0] = 1600; res_list[13,1] = 900;
res_list[14,0] = 1600; res_list[14,1] = 1024;
res_list[15,0] = 1680; res_list[15,1] = 1050;
res_list[16,0] = 1920; res_list[16,1] = 1080;

///DISPLAY SETUP

dsp_width = display_get_width();
dsp_height = display_get_height();

//UNCOMMENT THIS TO START IN FULLSCREEN
resolution_switch();

//CHOOSE A DEFAULT WINDOWED RESOLUTION THAT FITS THE DISPLAY WELL
resolution_get_default();

//PROCEED
room_goto_next();

