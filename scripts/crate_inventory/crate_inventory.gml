/// @description Inventory data structure for crate drops
/// @param Crate_Index crate index to return.
// Modify the array to add new objects/items to the drop list.  
//Crate index 1 = 
//Crate index 2 = 
//Crate index 3 = 

//Data Structure Crate creation. 
ds_crate0 = ds_list_create();
ds_crate1 = ds_list_create();
ds_crate2 = ds_list_create();

//Data Structure inventory setup
ds_list_add(ds_crate0, obj_Bomb);
ds_list_add(ds_crate1, obj_Bomb);

switch argument0
{
	case 0: 
		return ds_crate0;
		break;
	case 1:
		return ds_crate1;
		break;
	case 2:
		return ds_crate2;
		break;
	default:
		break;
}	 
	

