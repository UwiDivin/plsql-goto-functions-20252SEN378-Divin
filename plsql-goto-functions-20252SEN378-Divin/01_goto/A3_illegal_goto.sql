-- A3 — Illegal GOTO and Fix
-- Run the invalid example separately to capture Oracle's compilation error.
-- Corrected version follows.

SET SERVEROUTPUT ON;

-- INTENTIONALLY INVALID EXAMPLE:
-- DECLARE
-- BEGIN
--     GOTO inside_if;
--     IF 1 = 1 THEN
--         <<inside_if>>
--         DBMS_OUTPUT.PUT_LINE('Illegal jump.');
--     END IF;
-- END;
-- /

-- CORRECTED VERSION:
DECLARE
    v_copies NUMBER := 4;
BEGIN
    IF v_copies > 0 THEN
        GOTO available_book;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Book is unavailable.');
    GOTO finished;

    <<available_book>>
    DBMS_OUTPUT.PUT_LINE('Book is available for borrowing.');

    <<finished>>
    DBMS_OUTPUT.PUT_LINE('Corrected GOTO completed.');
END;
/
