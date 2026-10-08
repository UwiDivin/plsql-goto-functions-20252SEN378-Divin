-- B4 — Book Title Function
CREATE OR REPLACE FUNCTION fn_book_title (
    p_borrowing_id IN borrowings.borrowing_id%TYPE
) RETURN VARCHAR2
IS
    v_title books.title%TYPE;
BEGIN
    SELECT b.title
    INTO v_title
    FROM borrowings br
    JOIN books b ON b.book_id = br.book_id
    WHERE br.borrowing_id = p_borrowing_id;

    RETURN v_title;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'UNKNOWN BOOK';
END;
/

SHOW ERRORS;
