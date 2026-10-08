-- A1 — Number Classifier
SET SERVEROUTPUT ON;

DECLARE
    v_number NUMBER := 24;
BEGIN
    IF v_number > 0 THEN
        GOTO positive_number;
    ELSIF v_number < 0 THEN
        GOTO negative_number;
    ELSE
        GOTO zero_number;
    END IF;

    <<positive_number>>
    DBMS_OUTPUT.PUT_LINE('Number ' || v_number || ' is POSITIVE.');
    GOTO finished;

    <<negative_number>>
    DBMS_OUTPUT.PUT_LINE('Number ' || v_number || ' is NEGATIVE.');
    GOTO finished;

    <<zero_number>>
    DBMS_OUTPUT.PUT_LINE('Number is ZERO.');

    <<finished>>
    DBMS_OUTPUT.PUT_LINE('Number classification completed.');
END;
/
