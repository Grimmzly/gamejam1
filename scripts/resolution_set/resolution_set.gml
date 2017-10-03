/// @description resolution_set(ID)
/// @function resolution_set
/// @param ID
//this script is used to change the size of the windowed resolution

with(obj_resolution)
{
    cur_res_id = argument0;
    cur_width = res_list[cur_res_id,0];
    cur_height = res_list[cur_res_id,1];
    resolution_configure();
}