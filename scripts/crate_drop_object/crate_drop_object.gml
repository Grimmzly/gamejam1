///@description Function for dropping objects when crate is destroyed.
//Crate index 1 = 
//Crate index 2 = 
//Crate index 3 = 

	switch (obj_badCrate.crateType)
	{
		case 0:
		instance_create_layer(x,y-50,"player_layer_D0", ds_list_find_value(crate_inventory(0),irandom(ds_list_size(crate_inventory(0))- 1)))
			break;
		
		case 1:
		instance_create_layer(x,y-50,"player_layer_D0", ds_list_find_value(crate_inventory(1),irandom(ds_list_size(crate_inventory(1)) - 1)))
			break;
	}

