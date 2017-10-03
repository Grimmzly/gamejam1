/// @description Camera creation and param
// The following code creates, initilizes, and inserts custom params for the camera viewport.

//The Width and height of the camera viewport. 
camLength = 960
camHeight = 540

//Create the camera.Make x_speed and y_speed -1 for instant follow.
view_camera[0] = camera_create_view(0,0,camLength,camHeight,0,obj_Player,-1,-1,camLength/2,camHeight/2);
display_reset(0,true);
