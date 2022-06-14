## Retrieving Information from a Table

- Selecting All Data
- Selecting Particular Rows
- Selecting Particular Columns
- Sorting Rows
- Date Calculations
- Working with NULL Values
- Pattern Matching
- Counting Rows
- Using More Than one Table

The SELECT statement is used to pull information from a table. The general form of the statement is:
```mysql
SELECT what_to_select
FROM which_table
WHERE conditions_to_satisfy;
```
what_to_select indicates what you want to see. This can be a list of columns, or * to indicate “all columns.” which_table indicates the table from which you want to retrieve data. The WHERE clause is optional. If it is present, conditions_to_satisfy specifies one or more conditions that rows must satisfy to qualify for retrieval.
