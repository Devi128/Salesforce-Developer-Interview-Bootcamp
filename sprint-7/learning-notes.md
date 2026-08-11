# Day 7 – Learning Notes

## Bulk Processing

Salesforce can process multiple records at the same time.

Apex code should therefore be designed to work with collections instead of assuming that only one record will be processed.

## Collections

The main collections used in bulk processing are:

- **List** – stores multiple records.
- **Set** – stores unique values such as record IDs.
- **Map** – stores records using a key such as an Id.

## Bulk SOQL

Instead of querying records separately inside a loop, the required records should be collected first and retrieved using a single SOQL query.

This reduces unnecessary database operations.

## SOQL Inside Loops

SOQL should not be placed inside loops because the loop may process many records.

The better approach is:

Collect IDs  
↓  
Query once  
↓  
Store the results  
↓  
Process the records

## Bulk DML

Records that need to be changed should first be collected into a List.

Then a single DML operation can be performed on the collection.

This is more efficient than performing DML separately for every record.

## Governor Limits

Salesforce has Governor Limits to control the use of platform resources.

Important limits include:

- SOQL queries
- Query rows
- DML statements
- DML rows

The Debug Log can be used to check how many resources are being used.

## Key Learning

The main lesson from Day 7 is:

**Think in collections, not individual records.**

Bulkified Apex helps the application process multiple records efficiently and safely within Salesforce Governor Limits.
