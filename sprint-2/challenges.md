# Day 2 – Challenges Faced During Apex Triggers & Governor Limits

## 1. Understanding When to Use Validation Rule, Flow, or Trigger

- Initially, I was confused about whether a requirement should be implemented using a Validation Rule, Flow, or Apex Trigger.
- I learned that:
  - Validation Rules are used to prevent incorrect data entry.
  - Flows are used for simple automation without code.
  - Triggers are used for complex business logic that cannot be handled by declarative tools.

---

## 2. Understanding Trigger Events

- I faced difficulty in deciding when to use:
  - `before insert`
  - `after insert`
  - `before update`
  - `after update`

- I understood that:
  - Before triggers are used when we need to modify the same record before saving.
  - After triggers are used when we need to update related records.

---

## 3. Writing Bulkified Trigger Code

- Initially, I wrote logic that worked only for one record.
- I learned that Salesforce processes records in bulk, so triggers should handle multiple records together.

Challenges:
- Avoiding SOQL queries inside loops.
- Using Collections like:
  - List
  - Set
  - Map

---

## 4. Understanding Governor Limits

- Understanding Salesforce Governor Limits was challenging because Salesforce restricts resource usage.

I learned about:

- Maximum SOQL queries per transaction.
- DML statement limits.
- Record processing limits.

The main challenge was understanding why Salesforce needs these limits and how bad code can exceed them.

---

## 5. Creating Trigger Handler Classes

- Initially, I wrote all logic directly inside the trigger.
- Later, I understood the importance of separating logic into handler classes.

Challenges:
- Designing proper trigger structure.
- Calling handler methods correctly.
- Maintaining clean and reusable code.

---

## 6. Working with SOQL Queries

- Writing SOQL queries was challenging when retrieving related records.
- I faced difficulty in:
  - Using relationship queries.
  - Filtering records correctly.
  - Handling empty query results.

---

## 7. Implementing Duplicate Record Prevention

- Creating logic to prevent duplicate issue records was challenging.

I learned how to:

- Collect record IDs using Set.
- Query existing records.
- Compare new records with existing records.
- Use `addError()` to stop invalid records.

---

## 8. Debugging Trigger Errors

- While testing triggers, I faced errors related to:
  - Incorrect field names.
  - Query mistakes.
  - Trigger execution order.
  - Flow and Trigger conflicts.

I learned how to debug using:

- Debug Logs.
- Error messages.
- Testing with different scenarios.

---

## 9. Understanding Trigger Execution Flow

- Understanding when triggers execute in Salesforce order of execution was challenging.

I learned that:

- Before triggers execute before records are saved.
- After triggers execute after records are saved.
- Flows and triggers can interact with each other.

---

## 10. Testing Trigger Logic

- Creating test scenarios for different conditions was challenging.

I practiced testing:

- Single record insertion.
- Multiple record insertion.
- Duplicate record scenarios.
- Update scenarios.

---

# Key Learning

After completing Day 2, I improved my understanding of:

- Apex Trigger architecture.
- Bulkification concepts.
- Governor Limit handling.
- Trigger Handler patterns.
- Real-world Salesforce automation design.

The main challenge was changing my thinking from writing normal code to writing Salesforce-specific code that works efficiently for thousands of records.
