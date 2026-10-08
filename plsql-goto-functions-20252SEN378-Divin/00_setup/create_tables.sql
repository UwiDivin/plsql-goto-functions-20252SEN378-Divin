-- Student: UWINGENEYE DIVIN
-- ID: 20252SEN378
-- Project: Library Management Database

SET SERVEROUTPUT ON;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE borrowings CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE books CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE members CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN
    IF SQLCODE != -942 THEN RAISE; END IF;
END;
/

CREATE TABLE members (
    member_id NUMBER PRIMARY KEY,
    member_name VARCHAR2(100) NOT NULL,
    membership_type VARCHAR2(30) NOT NULL,
    join_date DATE NOT NULL,
    membership_fee NUMBER(10,2) NOT NULL CHECK (membership_fee > 0)
);

CREATE TABLE books (
    book_id NUMBER PRIMARY KEY,
    title VARCHAR2(150) NOT NULL,
    category VARCHAR2(60) NOT NULL,
    daily_fee NUMBER(10,2) NOT NULL CHECK (daily_fee > 0),
    available_copies NUMBER NOT NULL CHECK (available_copies >= 0)
);

CREATE TABLE borrowings (
    borrowing_id NUMBER PRIMARY KEY,
    member_id NUMBER NOT NULL,
    book_id NUMBER NOT NULL,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    late_fee NUMBER(10,2) DEFAULT 0 NOT NULL CHECK (late_fee >= 0),
    CONSTRAINT fk_borrowing_member FOREIGN KEY (member_id) REFERENCES members(member_id),
    CONSTRAINT fk_borrowing_book FOREIGN KEY (book_id) REFERENCES books(book_id)
);

INSERT INTO members VALUES (201, 'Kevin', 'Student', DATE '2025-02-10', 15000);
INSERT INTO members VALUES (202, 'Mireille', 'Standard', DATE '2023-08-21', 25000);
INSERT INTO members VALUES (203, 'Samuel', 'Student', DATE '2024-01-15', 15000);
INSERT INTO members VALUES (204, 'Aline', 'Premium', DATE '2022-05-03', 40000);
INSERT INTO members VALUES (205, 'Eric', 'Standard', DATE '2025-06-11', 25000);

INSERT INTO books VALUES (301, 'Database Systems', 'Technology', 1200, 4);
INSERT INTO books VALUES (302, 'The River Between', 'Literature', 800, 2);
INSERT INTO books VALUES (303, 'Introduction to Economics', 'Business', 1000, 3);
INSERT INTO books VALUES (304, 'Clean Code', 'Technology', 1500, 1);
INSERT INTO books VALUES (305, 'Things Fall Apart', 'Literature', 900, 5);

INSERT INTO borrowings VALUES (4001, 201, 301, DATE '2026-10-01', DATE '2026-10-08', DATE '2026-10-07', 0);
INSERT INTO borrowings VALUES (4002, 202, 304, DATE '2026-09-20', DATE '2026-09-27', DATE '2026-10-02', 7500);
INSERT INTO borrowings VALUES (4003, 203, 302, DATE '2026-10-02', DATE '2026-10-09', NULL, 0);
INSERT INTO borrowings VALUES (4004, 204, 303, DATE '2026-09-10', DATE '2026-09-17', DATE '2026-09-17', 0);
INSERT INTO borrowings VALUES (4005, 205, 305, DATE '2026-09-25', DATE '2026-10-02', DATE '2026-10-04', 1800);

COMMIT;

SELECT 'Library setup completed successfully.' AS message FROM dual;
SELECT COUNT(*) AS member_count FROM members;
SELECT COUNT(*) AS book_count FROM books;
SELECT COUNT(*) AS borrowing_count FROM borrowings;
