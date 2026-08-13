# Learning Notes – Day 10: Lightning Web Components

## 1. Component Communication

LWC components can communicate with each other using different communication patterns.

The main patterns learned are:

- Parent-to-child communication
- Child-to-parent communication
- Sibling communication through a common parent

Good component communication keeps responsibilities clear and reduces unnecessary coupling.

## 2. Parent-to-Child Communication

A parent component can pass information to a child component using `@api`.
The child receives the value using:
-@api job;
The parent provides the data, while the child uses the data it receives.

## 3. Child-to-Parent Communication

A child component can communicate with its parent using Custom Events.

The parent listens for the event:

The child reports what happened, while the parent decides what to do.

## 4. Custom Events

Custom Events are useful when a child component needs to notify its parent about a user action.

Examples used in the project include:

apply
applicationsubmitted
profilesaved

A good event should communicate a clear business or UI intention.

## 5. Sibling Component Communication

Two child components should not directly manipulate each other.

Instead, a common parent coordinates their communication.

Example:
```text
EligibleJobs
      ↓
applicationsubmitted
      ↓
PlacementHome
      ↓
MyApplications
```

This keeps the components loosely coupled.

## 6. JobCard Communication

The jobCard component receives job information from eligibleJobs.

It provides an Apply button and dispatches an event when the student applies.

The flow is:
```text
JobCard
   ↓
Apply Button
   ↓
Custom Event
   ↓
EligibleJobs
```

The jobCard also uses @api to expose the resetButton() method.

## 7. Student Profile

A studentProfile component was created to allow students to update their profile information.

The profile form uses Salesforce Lightning base components.

The component handles:

User input
Validation
Saving data
Success messages
Error messages
## 8. Client-Side and Server-Side Validation

Client-side validation improves user experience.

For example, the UI can check whether a CGPA is within a valid range.

However, client-side validation should not be considered business security.

Server-side validation remains responsible for enforcing business rules.
```text
Client Validation
       ↓
Better User Experience

Server Validation
       ↓
Business Integrity
```
## 9. Lightning Data Service

Lightning Data Service can be used for standard Salesforce record operations.

It can reduce the need for custom Apex when the requirement can be handled using Salesforce platform capabilities.

The important principle is:

Use Salesforce platform capabilities
when they fit the requirement.
## 10. Reactive Data

Reactive data allows the UI to stay synchronized with changing Salesforce data.

For example, when a student's CGPA changes, the list of eligible jobs may also change.

The system should refresh dependent data when necessary.

## 11. Refreshing Wired Data

refreshApex() was used to refresh wired Apex data.

Example:

await refreshApex(this.wiredJobsResult);

This ensures that the component displays updated Salesforce data instead of stale information.

## 12. My Applications

A myApplications component was created to display the student's applications.

The component retrieves real Application__c records using Apex.

```text
The data flow is:

MyApplications
      ↓
StudentController
      ↓
PlacementDataService
      ↓
Application__c
```
## 13. ApplicationCard

The applicationCard component displays information about one application.

It receives the application from the parent using @api.

Example:

@api application;

The component displays:

Job Name
Application Status
## 14. Reusable StatusBadge

A reusable statusBadge component was created to display application status.

The component accepts public properties such as:

@api status;
@api label;

It can be reused by different components that need to display status information.

The architecture is:
```text
ApplicationCard
      ↓
StatusBadge
```
This avoids duplicating status display logic.

## 15. Application Submission Flow

The complete application flow developed during Day 10 is:
```text
Student
   ↓
JobCard
   ↓
Apply Event
   ↓
EligibleJobs
   ↓
StudentController
   ↓
PlacementDataService
   ↓
Application__c
   ↓
Application Created
   ↓
applicationsubmitted Event
   ↓
PlacementHome
   ↓
MyApplications Refresh
   ↓
New Application Appears
```
## 16. Duplicate Application Handling

The existing business rule prevents a student from applying for the same job more than once.

If the student tries to apply again, the system displays an appropriate error message.

This business rule remains in the backend.

## 17. Loading and Error States

The components provide feedback to the user during different operations.

Examples include:

Loading...
Submitting...
Success
Error

This improves the user experience and makes the application state clear.

## 18. Component Architecture

The Placement Portal now follows a component-based architecture.

PlacementHome
│
├── StudentProfile
│
├── EligibleJobs
│   └── JobCard
│
└── MyApplications
    └── ApplicationCard
        └── StatusBadge

Each component has a focused responsibility.

## 19. Separation of Responsibilities

The project follows a clear separation between UI and backend responsibilities.
```text
LWC
 ↓
Controller
 ↓
Service Layer
 ↓
Salesforce Data
```

The LWC manages presentation and user interaction.

The Apex controller exposes functionality to the LWC.

The service layer handles business and data operations.

## 20. Key Takeaways
- @api is used for parent-to-child communication.
- Custom Events are used for child-to-parent communication.
- Sibling components can communicate through a common parent.
- Components should have clear responsibilities.
- Business logic should remain in the backend.
- Lightning Data Service can reduce unnecessary Apex.
- @wire is useful for reactive data retrieval.
- refreshApex() helps keep wired data up to date.
- Reusable components reduce code duplication.
- Loading, success, empty, and error states improve user experience.
- Good component architecture reduces coupling.
- The parent should coordinate communication between child components.
- UI components and Apex services should work together as one application.
