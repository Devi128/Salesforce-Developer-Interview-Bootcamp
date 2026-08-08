# Challenges Faced – Sprint 5

## 1. Understanding Where SOQL Should Be Placed

Initially, SOQL queries were directly inside `ApplicationTriggerHandler`.

I learned that it is better to move data-access operations into `PlacementDataService`.

This made the responsibilities clearer.

---

## 2. Avoiding Duplicate Code

I already had an `ApplicationService` from the previous sprint.

Instead of creating another service with the same business logic, I reused the existing methods and connected them with the new data-access service.

---

## 3. Understanding Bulkification

I had to understand why we use:

```text
Set<Id>
Map<Id, Record>
```

instead of querying records individually.

This helped me understand how Salesforce handles multiple records and governor limits.

---

## 4. Refactoring `afterUpdate()`

The `afterUpdate()` method was directly performing SOQL and DML.

We moved these operations into `PlacementDataService` so that data retrieval and updates were handled in one place.

---

## 5. Testing Business Rules

We tested different scenarios through the Placement Management App:

* Successful application
* Duplicate application
* Low CGPA
* Expired application deadline
* Selected student

Testing each scenario helped me understand how the trigger, service classes, SOQL, and DML work together.

### Main Challenge

The main challenge was understanding how the existing Day 4 business logic should be combined with the new Day 5 SOQL and DML concepts without rewriting the entire application.

I learned that new functionality should build on existing working code instead of unnecessarily replacing it.
