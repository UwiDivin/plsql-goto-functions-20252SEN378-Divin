# PL/SQL GOTO Statements and Functions

**Student ID:** 20252SEN378
**Student name:** UWINGENEYE DIVIN
**Course:** Database Development with PL/SQL (INSY 8311)  
**Scenario:** Library Management Database

## Overview

This project applies PL/SQL GOTO statements, stored functions, validation, exception handling, and functions used inside SQL queries to a library management scenario.

The database contains members, books, and borrowing records. The project demonstrates how procedural PL/SQL can be combined with relational data.

## Repository Structure

- `00_setup/` — creates and populates the library database tables.
- `01_goto/` — A1 through A4 GOTO exercises.
- `02_functions/` — reusable stored functions and the combined validator.
- `03_tests/` — function and validation tests.
- `screenshots/` — required output screenshots. The files currently supplied as previews must be replaced by screenshots from the actual SQL*Plus execution before submission.
- `docs/REFLECTION.md` — personal reflection.

## How to Run

1. Run `00_setup/create_tables.sql`.
2. Run every function in `02_functions/`.
3. Run the four programs in `01_goto/`.
4. Run `03_tests/test_functions.sql` and `03_tests/B5_functions_in_select.sql`.
5. Run `03_tests/test_validate_borrowing.sql`.
6. Run the intentionally illegal GOTO example separately for A3 and capture the Oracle compilation error, then run `A3_illegal_goto.sql` for the corrected version.

## Notes

AI assistance was used to help plan the database scenario, draft SQL examples, organize the repository, and explain PL/SQL concepts. I am responsible for testing the code, understanding the logic, and being able to explain the submitted work.

Before submission, all preview screenshots in `screenshots/` should be replaced with screenshots taken from the actual SQL*Plus execution.
