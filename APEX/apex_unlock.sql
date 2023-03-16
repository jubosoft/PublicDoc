alter session set container = orclpdb;
/
alter pluggable database orclpdb open;
/
alter pluggable database all open;
/


alter user sys identified by DHAKA_123 container=all;
/


alter user apex_210100 identified by DHAKA_123 account unlock;
/



BEGIN
   apex_util.set_security_group_id(p_security_group_id => 10);
   apex_util.unlock_account(p_user_name => 'ADMIN');
END;
/
COMMIT;
/


UPDATE wwv_flow_fnd_user
SET web_password = 'Dhaka_123'
WHERE user_name = 'ADMIN';
/
COMMIT;
/
