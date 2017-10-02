/// @description resolution_get_default()
/// @function resolution_get_default
//this script chooses a default windowed resolution that fits the display well

switch(dsp_width)
{
    case 1024: cur_res_id = 0; break;
    case 1152:
    {
        switch(dsp_height)
        {
            case 720: cur_res_id = 0; break;
            case 864: cur_res_id = 1; break;
            default: cur_res_id = 0; break;
        }
        break;
    }
    case 1280:
    {
        switch(dsp_height)
        {
            case 720:  cur_res_id = 0; break;
            case 768:  cur_res_id = 2; break;
            case 800:  cur_res_id = 2; break;
            case 960:  cur_res_id = 3; break;
            case 1024:  cur_res_id = 4; break;
            default: cur_res_id = 0; break;
        }
        break;
    }
    case 1360: cur_res_id = 2; break;
    case 1366: cur_res_id = 2; break;
    case 1440: cur_res_id = 6; break;
    case 1600:
    {
        switch(dsp_height)
        {
            case 900: cur_res_id = 11; break;
            case 1024: cur_res_id = 12; break;
            default: cur_res_id = 11; break;
        }
        break;
    }
    case 1680: cur_res_id = 12; break;
    case 1920: cur_res_id = 13; break;
    default: cur_res_id = 0; break;
}

cur_width = res_list[cur_res_id,0];
cur_height = res_list[cur_res_id,1];