SET SERVEROUTPUT ON;

CREATE OR REPLACE TYPE RECTANGLE AS OBJECT
(
    LENGTH NUMBER,
    WIDTH NUMBER,
    NOT INSTANTIABLE NOT FINAL MEMBER PROCEDURE DISPLAY
) NOT INSTANTIABLE NOT FINAL

--/

--CREATE OR REPLACE TYPE BODY RECTANGLE AS
--       MEMBER PROCEDURE display IS 
--            BEGIN 
--                dbms_output.put_line('Length: '|| length); 
--                dbms_output.put_line('Width: '|| width); 
--            END display;
--END;

/

CREATE OR REPLACE TYPE TABLETOP UNDER RECTANGLE
(
    MATERIAL VARCHAR2(20),
    OVERRIDING MEMBER PROCEDURE DISPLAY
);
/
CREATE OR REPLACE TYPE BODY TABLETOP AS
    OVERRIDING MEMBER PROCEDURE DISPLAY IS
        BEGIN
            DBMS_OUTPUT.PUT_LINE('LENGTH: ' || LENGTH);
            DBMS_OUTPUT.PUT_LINE('WIDTH: ' || WIDTH);
            DBMS_OUTPUT.PUT_LINE('MATERIAL: ' || MATERIAL);
        END DISPLAY;
END;
/
DECLARE 
    T1 TABLETOP;
    T2 TABLETOP;
    
    BEGIN
        T1 := TABLETOP(20,10, 'WOOD');
        T2 := TABLETOP(50,30, 'STEEL');
        T1.DISPLAY;
        T2.DISPLAY;
    END;
            
