Database 19c Location set app\oracle\product\19.0.0\dbhome_1

CREATE TABLESPACE apex DATAFILE 'app\oracle\product\apex01.dbf' SIZE 100M AUTOEXTEND ON NEXT 1M;


@apexins.sql APEX APEX TEMP /i/

@apxchpwd.sql

@apex_rest_config.sql

Unlock the ANONYMOUS account.

SQL> CONN sys@cdb1 AS SYSDBA

DECLARE
  l_passwd VARCHAR2(40);
BEGIN
  l_passwd := DBMS_RANDOM.string('a',10) || DBMS_RANDOM.string('x',10) || '1#';
  -- Remove CONTAINER=ALL for non-CDB environments.
  EXECUTE IMMEDIATE 'ALTER USER anonymous IDENTIFIED BY ' || l_passwd || ' ACCOUNT UNLOCK CONTAINER=ALL';
END;
/





ALTER USER APEX_LISTENER IDENTIFIED BY 123 ACCOUNT UNLOCK;
ALTER USER APEX_LISTENER IDENTIFIED BY 123 ACCOUNT UNLOCK;
ALTER USER APEX_REST_PUBLIC_USER IDENTIFIED BY 123 ACCOUNT UNLOCK;
ALTER USER APEX_PUBLIC_USER IDENTIFIED BY 123 ACCOUNT UNLOCK;
ALTER USER APEX_210200 IDENTIFIED BY 123 ACCOUNT UNLOCK;
ALTER USER APEX_220100 IDENTIFIED BY 123 ACCOUNT UNLOCK;




BEGIN
DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE(
  host => '*',
  ace  =>  xs$ace_type(privilege_list => xs$name_list('connect'),
                       principal_name => 'APEX_210200',
                       principal_type => xs_acl.ptype_db)); 


END;



BEGIN
DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE(
  host => 'localhost',
  ace  =>  xs$ace_type(privilege_list => xs$name_list('connect'),
                       principal_name => 'APEX_210200',
                       principal_type => xs_acl.ptype_db)); 


END;



EXEC DBMS_XDB.sethttpport(0)






java -jar ords.war