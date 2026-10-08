-- B2 — Borrowing Days Function
CREATE OR REPLACE FUNCTION fn_borrowing_days (
    p_borrowing_id IN borrowings.borrowing_id%TYPE
) RETURN NUMBER
IS
    v_borrow_date borrowings.borrow_date%TYPE;
    v_end_date borrowings.return_date%TYPE;
BEGIN
    SELECT borrow_date, NVL(return_date, SYSDATE)
    INTO v_borrow_date, v_end_date
    FROM borrowings
    WHERE borrowing_id = p_borrowing_id;

    RETURN TRUNC(v_end_date - v_borrow_date);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

SHOW ERRORS;
