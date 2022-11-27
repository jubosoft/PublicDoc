PROCEDURE Fill_Combo(cmb varchar,SQL1 varchar) IS
	rg	RecordGroup;
	err_No		NUMBER;
	fi item;
BEGIN
	fi := find_item(cmb);
	rg := Find_Group('rg');
	IF Id_Null(rg) THEN
		rg := Create_Group_From_Query('rg',SQL1);
	ELSE
		Delete_Group(RG);
		RG:=Create_Group_From_Query('RG',SQL1);
	END IF;
	err_No := Populate_Group(rg);
	Clear_List(fi);
	Populate_List(fi,rg);
END;
