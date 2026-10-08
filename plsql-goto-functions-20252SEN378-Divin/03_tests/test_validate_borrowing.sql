-- C1 Borrowing Validator Tests
SET SERVEROUTPUT ON;

DECLARE
    v_result VARCHAR2(200);
BEGIN
    v_result := fn_validate_borrowing(204, 304, DATE '2026-09-20', DATE '2026-09-27', DATE '2026-09-26');
    DBMS_OUTPUT.PUT_LINE('Valid borrowing test: ' || v_result);

    v_result := fn_validate_borrowing(204, 304, DATE '2026-09-27', DATE '2026-09-20', DATE '2026-09-26');
    DBMS_OUTPUT.PUT_LINE('Invalid due-date test: ' || v_result);

    v_result := fn_validate_borrowing(204, 304, DATE '2026-09-20', DATE '2026-09-27', DATE '2026-09-18');
    DBMS_OUTPUT.PUT_LINE('Invalid return-date test: ' || v_result);
END;
/
