# Day 7 – Challenges

## Challenge 1: Understanding Bulk Processing

The main challenge was understanding how to process multiple records together instead of processing each record individually.

## Challenge 2: Using Collections

Understanding when to use Lists, Sets, and Maps was challenging at first.

I learned that:

- Lists are useful for storing records.
- Sets are useful for storing unique IDs.
- Maps are useful for quickly accessing records using their IDs.

## Challenge 3: Avoiding Repeated Queries

I learned that SOQL should not be placed inside loops.

The solution was to collect the required IDs first and retrieve the records using one bulk query.

## Challenge 4: Understanding Bulk DML

Another challenge was understanding why records should be collected first and updated together instead of performing DML inside a loop.

## Key Takeaway

The practical work helped me understand how bulkification reduces unnecessary database operations and helps Apex work safely within Salesforce Governor Limits.
