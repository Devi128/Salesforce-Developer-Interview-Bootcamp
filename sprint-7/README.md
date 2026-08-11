# Day 7 – Bulk Processing and Governor Limits

## Objective

Learn how to write Apex code that can safely process multiple records.

## Topics Covered

- Bulk Processing
- Governor Limits
- Lists
- Sets
- Maps
- Bulk SOQL
- Bulk DML
- Avoiding SOQL inside loops
- Avoiding DML inside loops

## Practical Work

Used **Salesforce Developer Console → Execute Anonymous** to test bulk processing with `Application__c` records.

The process followed this pattern:

Applications  
↓  
Collect Student IDs using Set  
↓  
Query Students once  
↓  
Store Students in Map  
↓  
Process Applications  
↓  
Collect records in List  
↓  
Perform one bulk DML

## Result

The bulk-processing test was executed successfully in the Developer Console.

The Debug Log was checked to observe SOQL queries, DML statements, and Governor Limits.

## Key Learning

I learned that Apex should be designed to handle multiple records instead of processing records one at a time.

Using Sets, Maps, bulk SOQL, and bulk DML helps avoid unnecessary database operations and makes Apex more scalable.


- Execute Anonymous screenshot
- Successful execution screenshot
- Debug Log / Governor Limits screenshot
