# Chapter 6 – Making Software Respond Automatically

## Sprint 6 – Discovering the Power of Apex Triggers

### Overview

In this sprint, I learned about Apex Triggers and how Salesforce can automatically respond to important business events.

Instead of requiring the user to perform every action manually, a Trigger can automatically execute the required process when a record is created or updated.

The main focus of this sprint was to understand how Triggers work and how they can be connected with Service classes.

## What I Worked On

I implemented Trigger-based automation for the Application object in the Placement Management System.

The main flow was:

Application Status Updated  
↓  
Application Trigger  
↓  
ApplicationTriggerHandler  
↓  
Check Application Status  
↓  
If Status = Selected  
↓  
Update Student Placed__c = true

## Trigger Events Implemented

I worked with two Trigger events:

- `before insert`
- `after update`

### Before Insert

The `before insert` event is used when a new Application record is created.

It calls the `ApplicationTriggerHandler` and performs the required application validations before the record is saved.

The validations include:

- Setting the default Application Status to `Applied`
- Checking duplicate applications
- Validating Student CGPA
- Checking the Job application deadline

### After Update

The `after update` event is used when an existing Application record is updated.

When the Application Status becomes `Selected`, the related Student record is updated automatically.

The Student's `Placed__c` field is changed to:

`true`

## Trigger Architecture

I followed a Trigger → Handler → Service architecture.

The responsibilities are separated as follows:

### Trigger

The Trigger detects the Salesforce event and calls the appropriate handler method.

### ApplicationTriggerHandler

The Handler coordinates the process and calls the required services.

### ApplicationService

The Service class contains the application business logic and validation rules.

### PlacementDataService

The Data Service is responsible for retrieving and updating Salesforce records.

### NotificationService

The Notification Service is responsible for notification-related processing.

This separation keeps the code clean, readable, and easier to maintain.

## Business Automation

The main automation implemented was:

Application Status changes  
↓  
Trigger executes  
↓  
ApplicationTriggerHandler runs  
↓  
Check if Status is `Selected`  
↓  
Find related Student  
↓  
Set `Placed__c = true`  
↓  
Update Student

This allows the system to automatically update the student's placement status without requiring the Placement Officer to do it manually.

## Testing

I tested the Trigger automation inside the Placement Management App in the Salesforce Org.

### Test 1 – Selected

Application Status:

`Applied → Selected`

Expected Result:

`Student Placed__c = true`

Result:

Passed

### Test 2 – Rejected

Application Status:

`Applied → Rejected`

Expected Result:

`Student Placed__c = false`

Result:

Passed

### Test 3 – Shortlisted

Application Status:

`Applied → Shortlisted`

Expected Result:

`Student Placed__c = false`

Result:

Passed

These tests confirmed that the placement status is updated only when the Application Status becomes `Selected`.

## Debugging

I used Salesforce Debug Logs to verify the execution of the Trigger and related Apex classes.

The debugging process included:

1. Creating a User Trace Flag.
2. Updating an Application record.
3. Generating the Apex Debug Log.
4. Checking the Trigger execution.
5. Checking the Handler and Service execution.
6. Verifying the expected result.

This helped me understand how Salesforce executes Apex code during a transaction.

## Before Trigger and After Trigger

### Before Trigger

A Before Trigger is useful when something needs to happen before the record is saved.

Examples:

- Validating data
- Setting default values
- Preventing invalid records

In this project, `before insert` is used for Application validation.

### After Trigger

An After Trigger is useful when something needs to happen after the record has been successfully saved.

Examples:

- Updating related records
- Performing post-save processing
- Starting additional business processes

In this project, `after update` is used to update the Student placement status when an Application becomes `Selected`.

## What I Learned

During this sprint, I learned that:

- Apex Triggers allow Salesforce to respond automatically to business events.
- Triggers can execute before or after database operations.
- `before insert` can be used for validation before saving a record.
- `after update` can be used for processing after a record is updated.
- A Trigger should be small and readable.
- Business logic should be kept inside Service classes.
- A Handler can coordinate Trigger processing.
- Different responsibilities should be separated into different classes.
- Debug Logs help in understanding Apex execution.
- Good Trigger architecture makes future changes easier.

## Technologies Used

- Salesforce
- Apex
- Apex Triggers
- Apex Classes
- SOQL
- DML
- VS Code
- Salesforce CLI
- Salesforce Debug Logs

## Final Outcome

After completing Sprint 6, the Placement Management System can respond automatically to important business events.

The system can now:

- Automatically validate new Applications.
- Automatically respond when an Application is updated.
- Detect when an Application becomes `Selected`.
- Automatically update the related Student's `Placed__c` field.
- Keep business logic separated from the Trigger.
- Use a Trigger → Handler → Service architecture.
- Verify Trigger execution using Debug Logs.

The main lesson from this sprint was:

> A Trigger should observe an event and coordinate the process, while Service classes should handle the business logic.

The Placement Management System is now more automated, maintainable, and closer to a real enterprise Salesforce application.
