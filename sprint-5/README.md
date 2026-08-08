# Chapter 5 – Making Software Talk to Data

## Sprint 5 – SOQL and DML

### What we did

In this sprint, we connected our Placement Management System with Salesforce data using **SOQL and DML**.

we already had the business validation logic from the previous sprint. In this sprint, we improved the application by separating **data retrieval** from **business logic**.

### Main work completed

* Retrieved Student records using SOQL.
* Retrieved Job records using SOQL.
* Retrieved existing Applications to check duplicates.
* Used `PlacementDataService` for data retrieval and DML operations.
* Used `ApplicationService` for business validations.
* Created Applications using DML.
* Updated Application Status using DML.
* Updated `Student__c.Placed__c` when an Application was marked as `Selected`.
* Used bulkified SOQL with Sets and Maps.
* Tested the complete process through the **Placement Management App** in Salesforce.

### Application Flow

```text
Student applies for a Job
        ↓
Retrieve Student
        ↓
Retrieve Job
        ↓
Check Existing Applications
        ↓
Validate CGPA
        ↓
Validate Last Date
        ↓
Set Status = Applied
        ↓
Create Application
        ↓
Save using DML
```

When a student is selected:

```text
Application Status → Selected
        ↓
Update Student
        ↓
Placed__c = true
```

### Testing

The following scenarios were tested successfully:

* Valid application → Application created successfully.
* Duplicate application → Rejected.
* CGPA below minimum → Rejected.
* Application after deadline → Rejected.
* Application status changed to Selected → Student marked as Placed.

### Result

Sprint 5 successfully connected the Placement Management System with Salesforce data using **SOQL, DML, Apex services, and triggers**.

