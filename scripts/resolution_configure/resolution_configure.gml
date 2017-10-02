/// @description resolution_configure()
/// @function resolution_configure
//this script is automatically called whenever a change is made to the resolution settings

if window_get_fullscreen()
{
    scale = 1+floor(dsp_width/1000);
    __view_set( e__VW.WView, 0, dsp_width/scale );
    __view_set( e__VW.HView, 0, dsp_height/scale );
    surface_resize(application_surface,dsp_width,dsp_height);
}
else
{
    scale = 1+floor(cur_width/1000);
    __view_set( e__VW.WView, 0, cur_width/scale );
    __view_set( e__VW.HView, 0, cur_height/scale );
    window_set_size(cur_width,cur_height);
    surface_resize(application_surface,cur_width,cur_height);
    alarm[0] = 1;
}

/*Scale based on display width
------------------------------
2x = <1000
3x = 1000-1499
4x = 1500-1999
etc...