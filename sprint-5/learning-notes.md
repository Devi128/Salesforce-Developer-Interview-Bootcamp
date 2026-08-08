# Learning Notes – Sprint 5

## What I Learned

### 1. SOQL

I learned that **SOQL is used to retrieve data from Salesforce**.

For example, we used SOQL to retrieve:

* Student CGPA
* Job minimum CGPA
* Job last date
* Existing Applications

### 2. DML

I learned that **DML is used to create, update, and modify Salesforce records**.

In this project, we used DML to:

* Create an Application.
* Update Application Status.
* Update the Student's `Placed__c` field.

### 3. Data Before Decision

Before making a business decision, the application must first retrieve the required information.

```text
Retrieve Data
     ↓
Validate
     ↓
Make Decision
     ↓
Change Data
```

### 4. Service Classes

I learned why we separate responsibilities between classes.

`PlacementDataService` handles data retrieval and DML.

`ApplicationService` handles business rules.

`ApplicationTriggerHandler` coordinates the process.

### 5. Bulkification

I learned to collect record IDs using `Set<Id>` and retrieve multiple records using one SOQL query instead of querying inside loops.

### 6. Testing

I learned that deployment success does not mean the functionality is correct. We also need to test the actual business scenarios in Salesforce.

### Key Learning

**SOQL is used to read Salesforce data, while DML is used to change Salesforce data.**
