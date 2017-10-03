///@description Function for dropping objects when crate is destroyed.

with (obj_badCrate)
{
	switch (crateType)
	{
		case 0:
		instance_create_layer(x,y,"player_layer_D0", ds_list_find_value(crate_inventory.ds_crate0,0))
			break;
		
		case 1:
		instance_create_layer(x,y,"player_layer_D0", ds_list_find_value(crate_inventory.ds_crate1,0))
			break;
	}
}