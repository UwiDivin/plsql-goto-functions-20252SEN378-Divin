-- B1 — Annual Membership Fee Function
CREATE OR REPLACE FUNCTION fn_annual_membership (
    p_member_id IN members.member_id%TYPE
) RETURN NUMBER
IS
    v_fee members.membership_fee%TYPE;
BEGIN
    SELECT membership_fee
    INTO v_fee
    FROM members
    WHERE member_id = p_member_id;

    RETURN v_fee * 12;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

SHOW ERRORS;
