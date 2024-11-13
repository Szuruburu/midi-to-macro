
DisplayOutput(event, value) {
	Gui,14:default
	Gui,14:ListView, Out1 ; see the second listview midi out monitor
		LV_Add("",event,value)
		LV_ModifyCol(1,"center")
		LV_ModifyCol(2,"center")
		If (LV_GetCount() > 10)
		{
			LV_Delete(1)
		}
}

ConvertToAxis(value, maximum_axis_value) {
	return Floor(value * maximum_axis_value)
}

ConvertCCValueToScale(value, minimum_value, maximum_value) {
	if (value > maximum_value) {
		value := maximum_value
	} else if (value < minimum_value) {
		value := minimum_value
	}
	return (value - minimum_value) / (maximum_value - minimum_value)
}

ImageClick(path,off_x:=0,off_y:=0) {
	CoordMode, Mouse, Screen
	MouseGetPos, m_x, m_y
	CoordMode, Mouse, Window
	BlockInput, Mousemove
	ImageSearch, i_x, i_y, 0, 0, A_ScreenWidth, A_ScreenHeight, %path%
	Click, % i_x + off_x ", " i_y + off_y
	CoordMode, Mouse, Screen
	MouseMove, m_x, m_y
	BlockInput, MousemoveOff
}