-- A2 — Member Review
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
        GOTO premium_member;
    ELSIF v_fee >= 20000 THEN
        GOTO standard_member;
    ELSE
        GOTO basic_member;
    END IF;

    <<premium_member>>
    DBMS_OUTPUT.PUT_LINE(v_name || ': PREMIUM MEMBERSHIP - ' || v_fee);
    GOTO finished;

    <<standard_member>>
    DBMS_OUTPUT.PUT_LINE(v_name || ': STANDARD MEMBERSHIP - ' || v_fee);
    GOTO finished;

    <<basic_member>>
    DBMS_OUTPUT.PUT_LINE(v_name || ': BASIC MEMBERSHIP - ' || v_fee);

    <<finished>>
    DBMS_OUTPUT.PUT_LINE('Member review completed.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Member not found.');
END;
/
