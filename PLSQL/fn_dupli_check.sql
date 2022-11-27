FUNCTION fnc_dupli_check (P_ITEM1 VARCHAR2, P_VAL1 VARCHAR2, 
													P_ITEM2 VARCHAR2 DEFAULT NULL, P_VAL2 VARCHAR2 DEFAULT NULL, 
													P_ITEM3 VARCHAR2 DEFAULT NULL, P_VAL3 VARCHAR2 DEFAULT NULL) 
RETURN NUMBER 
IS
	V_RTN NUMBER := 0;
	V_REC NUMBER := :SYSTEM.CURSOR_RECORD;
BEGIN
  --GO_ITEM(P_ITEM1);
  FIRST_RECORD;
  
  LOOP
  	IF nvl(NAME_IN(P_ITEM1),'``') = nvl(P_VAL1,'``') THEN --------1ST
  		
  			IF P_ITEM2 IS NOT NULL THEN ----------- 2ND
  					
  				IF nvl( NAME_IN(P_ITEM2),'``') = nvl(P_VAL2,'``') THEN ------3RD
  						 
  						 IF P_ITEM3 IS NOT NULL THEN --------4TH
  								
  								IF nvl(NAME_IN(P_ITEM3),'``') = nvl(P_VAL3,'``') THEN ------- 5TH
  										V_RTN := V_RTN + 1;  							
  								END IF; ----------5TH
  								
  						 ELSE --------4TH
  								V_RTN := V_RTN + 1;  											
  						 END IF; ---------4TH
  						 
  				END IF; ---------- 3RD
  					
  			ELSE ------2ND
  				
  				V_RTN := V_RTN + 1;
  				
  			END IF; --------2ND
  	END IF; -------------- 1ST
  EXIT WHEN :SYSTEM.LAST_RECORD = 'TRUE' OR V_RTN > 1;
  	NEXT_RECORD;
  END LOOP;
  first_record;
  GO_RECORD(V_REC);
  IF V_RTN > 1 THEN
  	RETURN 1;
  ELSE
  	RETURN 0;
  END IF;
  EXCEPTION
  	WHEN OTHERS THEN NULL;
END;