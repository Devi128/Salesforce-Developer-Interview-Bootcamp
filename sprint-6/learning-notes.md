# Chapter 6 – Learning Notes

## Topic: Apex Triggers

### 1. What is an Apex Trigger?

An Apex Trigger is a piece of Apex code that runs automatically when a specific Salesforce event occurs.

For example:

- A record is inserted.
- A record is updated.
- A record is deleted.

Triggers allow Salesforce to respond automatically to business events.

---

## 2. Why Do We Need Triggers?

Triggers are useful when an action should happen automatically without depending on the user to remember it.

For example, in the Placement Management System:

When an Application becomes `Selected`, the Student's placement status should automatically become `true`.

Without a Trigger, the Placement Officer would have to update the Student manually.

With a Trigger:

Application Updated  
↓  
Status = Selected  
↓  
Trigger Executes  
↓  
Student Placed__c = true

---

## 3. Event-Driven Software

I learned that enterprise applications often work based on events.

Examples:

- Student registers → registration-related actions happen.
- Student submits an Application → validation happens.
- Application becomes Selected → placement status is updated.
- Application becomes Rejected → rejection-related processing can happen.

The software observes the event and responds automatically.

---

## 4. Before Trigger

A Before Trigger runs before the record is saved.

It is useful for:

- Validation
- Setting default values
- Modifying field values
- Preventing invalid records

In my project, `before insert` is used for Application validation.

The Application is checked before Salesforce saves it.

---

## 5. After Trigger

An After Trigger runs after the record has been successfully saved.

It is useful when we need to work with the saved record or update related records.

In my project, `after update` is used when an Application becomes `Selected`.

The process is:

Application Status = Selected  
↓  
After Update Trigger  
↓  
ApplicationTriggerHandler  
↓  
Find Student  
↓  
Set Placed__c = true  
↓  
Update Student

---

## 6. Trigger Should Not Contain Business Logic

One important lesson I learned is that we should not put all business logic directly inside the Trigger.

A large Trigger can become difficult to understand and maintain.

Instead, I used a layered structure:

Trigger  
↓  
ApplicationTriggerHandler  
↓  
ApplicationService / Other Services

The Trigger identifies the event.

The Handler coordinates the process.

The Service performs the business logic.

---

## 7. Application Trigger

The Application Trigger responds to Application record events.

The important events I worked with are:

- `before insert`
- `after update`

The Trigger calls the appropriate methods in `ApplicationTriggerHandler`.

This keeps the Trigger short and readable.

---

## 8. ApplicationTriggerHandler

The Handler is responsible for coordinating the Trigger process.

For example, during `after update`, it checks whether an Application has the status:

`Selected`

If the condition is satisfied, it collects the related Student IDs and updates the Student placement status.

---

## 9. ApplicationService

The ApplicationService contains the business rules related to Applications.

The methods I worked with include:

- `setDefaultStatus()`
- `validateDuplicateApplications()`
- `validateCGPA()`
- `validateLastDate()`

These methods keep business logic outside the Trigger.

---

## 10. PlacementDataService

The PlacementDataService is responsible for retrieving and modifying Salesforce records.

It contains methods for:

- Retrieving Students
- Retrieving Jobs
- Retrieving existing Applications
- Creating Applications
- Updating Application status

This keeps data-access logic separate from business logic.

---

## 11. NotificationService

I also worked with a separate NotificationService.

The purpose of this service is to keep notification-related processing separate from the Trigger.

The Trigger does not need to know how the notification is handled.

It only needs to notify the appropriate service that an important business event occurred.

---

## 12. Before vs After

### Before

Used when the action should happen before the record is saved.

Examples:

- Validate CGPA.
- Check duplicate Application.
- Check application deadline.
- Set default status.

### After

Used when the action should happen after the record is saved.

Examples:

- Update a related Student.
- Send a notification.
- Update statistics.
- Perform post-save processing.

---

## 13. Trigger Testing

I tested the Trigger using the Placement Management App in Salesforce.

### Selected

When the Application status was changed to:

`Selected`

The Student's:

`Placed__c`

was changed to:

`true`

### Rejected

When the Application status was changed to:

`Rejected`

The Student's:

`Placed__c`

remained:

`false`

### Shortlisted

When the Application status was changed to:

`Shortlisted`

The Student's:

`Placed__c`

remained:

`false`

These tests confirmed that the automation works according to the business requirement.

---

## 14. Debug Logs

I learned how Debug Logs can be used to understand Apex execution.

The process was:

1. Create a User Trace Flag.
2. Perform the required action in Salesforce.
3. Generate the Debug Log.
4. Open the log.
5. Check the Apex execution.
6. Verify that the expected Trigger and classes executed.

Debug Logs are useful for finding errors and understanding the execution flow.

---

## 15. Main Lessons

The main things I learned from this sprint are:

- Triggers automate business processes.
- Triggers respond to events.
- Before and After Triggers have different purposes.
- Business logic should remain outside the Trigger.
- Handler classes help organize Trigger processing.
- Service classes should handle business responsibilities.
- Data access should be separated from business logic.
- Debug Logs are important for troubleshooting Apex.
- Good Trigger architecture makes applications easier to maintain.
- Automation reduces manual work and human error.

---

## 16. My Understanding

Before this sprint, I mainly thought of a Trigger as Apex code that runs automatically.

After completing this sprint, I understand that a Trigger is more than just code.

It represents a business event and starts an automated process.

The important architecture is:

Business Event  
↓  
Trigger  
↓  
Handler  
↓  
Service  
↓  
Business Action

This approach keeps the Salesforce application organized and maintainable.

---

## 17. Key Takeaway

The most important thing I learned is:

> A Trigger should observe an event and coordinate the process, while Service classes should handle the business logic.

This helps create Salesforce applications that are automated, reusable, and easier to maintain.
