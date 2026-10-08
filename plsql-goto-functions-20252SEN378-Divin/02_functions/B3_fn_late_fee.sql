-- B3 — Late Fee Function
-- Late fee rules for this project:
-- 0 late days       : 0
-- 1-3 late days     : 1000 per day
-- More than 3 days  : 1500 per day

CREATE OR REPLACE FUNCTION fn_late_fee (
    p_late_days IN NUMBER
) RETURN NUMBER
IS
BEGIN
    IF p_late_days IS NULL OR p_late_days < 0 THEN
        RAISE_APPLICATION_ERROR(-20011, 'Late days cannot be NULL or negative.');
    ELSIF p_late_days = 0 THEN
        RETURN 0;
    ELSIF p_late_days <= 3 THEN
        RETURN p_late_days * 1000;
    ELSE
        RETURN p_late_days * 1500;
    END IF;
END;
/

SHOW ERRORS;
