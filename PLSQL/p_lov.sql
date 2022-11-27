PROCEDURE P_LOV IS
	v_lov	boolean;
BEGIN
		if name_in(:system.cursor_item) is null or name_in(:system.cursor_item) = ' ' then
		v_lov := show_lov(substr(:system.trigger_item,instr(:system.trigger_item,'.')+1));			
		if not v_lov then
		  Message('You have not selected a value.');
		  Bell;
		  RAISE Form_Trigger_Failure;
		else
			null;
		end if;		
		end if;
		next_item;
exception
	when others then
	null;  
END;