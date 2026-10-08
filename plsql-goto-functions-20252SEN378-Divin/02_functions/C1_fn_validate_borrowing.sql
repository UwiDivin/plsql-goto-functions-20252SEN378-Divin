-- C1 — Borrowing Validator Function
-- A borrowing is valid when:
-- 1. Member ID is present.
-- 2. Book ID is present.
-- 3. Due date is not before borrow date.
-- 4. Return date, when present, is not before borrow date.

CREATE OR REPLACE FUNCTION fn_validate_borrowing (
    p_member_id  IN NUMBER,
    p_book_id    IN NUMBER,
    p_borrow_date IN DATE,
    p_due_date   IN DATE,
    p_return_date IN DATE
) RETURN VARCHAR2
IS
BEGIN
    IF p_member_id IS NULL THEN
        RETURN 'INVALID: Member ID is required.';
    ELSIF p_book_id IS NULL THEN
        RETURN 'INVALID: Book ID is required.';
    ELSIF p_borrow_date IS NULL OR p_due_date IS NULL THEN
        RETURN 'INVALID: Borrow and due dates are required.';
    ELSIF p_due_date < p_borrow_date THEN
        RETURN 'INVALID: Due date cannot be before borrow date.';
    ELSIF p_return_date IS NOT NULL AND p_return_date < p_borrow_date THEN
        RETURN 'INVALID: Return date cannot be before borrow date.';
    ELSE
        RETURN 'VALID';
    END IF;
END;
/

SHOW ERRORS;
