# Salesforce Bootcamp Day 2 Assignment – Apex Triggers & Governor Limits

## Architectural Decisions

### 1. Why Apex Trigger?
Apex was chosen over declarative solutions because the scenario requires multi-object cross-record validation (comparing `Student__c.CGPA__c` against `Job__c.Minimum_CGPA__c`) along with querying existing database records to enforce composite uniqueness (`Student__c` + `Job__c`) in a single execution context.

### 2. Why Before Insert?
- **Validation:** Calling `addError()` during `before insert` stops invalid records from saving to the database without consuming DML operations.
- **Defaulting Values:** Direct field mutations (`app.Status__c = 'Applied'`) inside a `before insert` context auto-persist without requiring additional `update` DML calls.

### 3. Bulkification Strategy
- **Zero SOQL/DML in Loops:** All SOQL queries run outside loops using `IN` clause binding.
- **Set Data Structures:** `Set<Id>` collects parent keys; `Set<String>` tracks unique composite keys (`StudentId-JobId`) for duplicate identification across database records and in-batch duplicates.
- **Map Lookups:** Extracted `Student__c` and `Job__c` records into `Map<Id, SObject>` for fast $O(1)$ record retrieval inside the loop.

## Key Learnings
1. **Governor Limits Awareness:** Always write code expecting batches of up to 200–10,000 records.
2. **Trigger Handler Architecture:** Keep triggers lean by delegating execution flow to Handler and Service classes (`Trigger` → `Handler` → `Service`).
3. **Data Structure Power:** Combining `Set` and `Map` collections enables efficient $O(N)$ data processing while adhering strictly to execution limits.
