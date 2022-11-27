PROCEDURE P_MESSAGE (V_Msg VARCHAR2) IS
msg	number;
BEGIN
  set_alert_property('ALERT',alert_message_text,V_Msg);

		msg := show_alert('ALERT');
END;