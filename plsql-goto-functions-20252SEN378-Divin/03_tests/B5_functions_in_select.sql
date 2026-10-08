-- B5 — Functions in SQL
SET PAGESIZE 50;
SET LINESIZE 220;

SELECT
    m.member_id,
    m.member_name,
    m.membership_fee,
    fn_annual_membership(m.member_id) AS annual_membership,
    fn_borrowing_days(br.borrowing_id) AS borrowing_days,
    fn_book_title(br.borrowing_id) AS borrowed_book
FROM members m
JOIN borrowings br ON br.member_id = m.member_id
ORDER BY m.member_id;
