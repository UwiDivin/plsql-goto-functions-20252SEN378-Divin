-- Function tests
SET SERVEROUTPUT ON;

DECLARE
    v_annual_fee NUMBER;
    v_days NUMBER;
    v_late_fee NUMBER;
    v_title VARCHAR2(150);
BEGIN
    v_annual_fee := fn_annual_membership(204);
    v_days := fn_borrowing_days(4002);
    v_late_fee := fn_late_fee(5);
    v_title := fn_book_title(4002);

    DBMS_OUTPUT.PUT_LINE('B1 Annual membership for member 204: ' || v_annual_fee);
    DBMS_OUTPUT.PUT_LINE('B2 Borrowing days for borrowing 4002: ' || v_days);
    DBMS_OUTPUT.PUT_LINE('B3 Late fee for 5 late days: ' || v_late_fee);
    DBMS_OUTPUT.PUT_LINE('B4 Book for borrowing 4002: ' || v_title);

    IF v_annual_fee = 480000 THEN
        DBMS_OUTPUT.PUT_LINE('B1 TEST: PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('B1 TEST: FAIL');
    END IF;

    IF v_late_fee = 7500 THEN
        DBMS_OUTPUT.PUT_LINE('B3 TEST: PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('B3 TEST: FAIL');
    END IF;

    IF v_title = 'Clean Code' THEN
        DBMS_OUTPUT.PUT_LINE('B4 TEST: PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('B4 TEST: FAIL');
    END IF;
END;
/
