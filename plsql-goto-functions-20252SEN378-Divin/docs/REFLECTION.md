# Reflection — UWINGENEYE DIVIN

Working on this assignment helped me understand how PL/SQL can be used to solve practical database problems instead of only writing simple SQL queries. I worked with a library management scenario containing members, books, and borrowing records, which made the examples easier for me to relate to.

One of the main things I learned was how the `GOTO` statement works in PL/SQL. I learned that it can transfer control to a labelled statement, but that there are restrictions on where a GOTO can jump. The illegal GOTO example was useful because the Oracle error showed me that a label inside a control structure cannot simply be entered from outside that structure.

I also learned why structured programming can sometimes be clearer than using GOTO. In A4, I rewrote the member review using `IF`, `ELSIF`, and `ELSE`. The result was easier to follow because the decision logic stayed in one place without jumping between labels.

The functions section helped me understand how reusable PL/SQL code works. I created functions for annual membership fees, borrowing duration, late fees, and book titles. I also learned that stored functions can be called from a `SELECT` statement, which makes them useful for applying the same calculation or lookup to many rows.

Testing was another important part of the assignment for me. Running the scripts in SQL*Plus allowed me to see whether the functions compiled and whether the returned results matched the expected values. The validation tests also showed me how a function can return useful messages when invalid borrowing information is supplied.

Overall, this assignment improved my understanding of PL/SQL control flow, stored functions, validation, and testing. I also learned that writing the code is only part of the work; I need to test it carefully and understand why each part works so that I can explain it confidently.

## AI Use Note

I used an AI assistant to help me plan the library scenario, draft and explain parts of the SQL/PLSQL code, and organize the project. I remain responsible for testing the scripts, understanding the logic, and explaining the final work.
