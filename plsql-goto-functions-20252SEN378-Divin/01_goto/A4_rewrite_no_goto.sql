-- A4 — Rewrite Without GOTO
SET SERVEROUTPUT ON;

DECLARE
    v_member_id members.member_id%TYPE := 204;
    v_name members.member_name%TYPE;
    v_fee members.membership_fee%TYPE;
BEGIN
    SELECT member_name, membership_fee
    INTO v_name, v_fee
    FROM members
    WHERE member_id = v_member_id;

    IF v_fee >= 35000 THEN
        DBMS_OUTPUT.PUT_LINE(v_name || ': PREMIUM MEMBERSHIP - ' || v_fee);
    ELSIF v_fee >= 20000 THEN
        DBMS_OUTPUT.PUT_LINE(v_name || ': STANDARD MEMBERSHIP - ' || v_fee);
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_name || ': BASIC MEMBERSHIP - ' || v_fee);
    END IF;

    DBMS_OUTPUT.PUT_LINE('Member review completed without GOTO.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Member not found.');
END;
/
