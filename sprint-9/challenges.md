# Challenges – Sprint 09: Lightning Web Components

## 1. Handling the Apply Button

Initially, clicking the Apply button needed to correctly identify which job the student wanted to apply for.

The Job Id had to be passed from the HTML to JavaScript so that the correct job could be processed.

## 2. Passing Data Between Components

After separating the interface into `eligibleJobs` and `jobCard`, communication between the parent and child components was required.

The child component needed to send the selected Job Id back to the parent using a Custom Event.

## 3. Preventing Multiple Clicks

One challenge was handling repeated clicks on the Apply button.

The button was changed to a submitting state while the application was being processed so that the student could not accidentally submit the same request multiple times.

## 4. Handling Duplicate Applications

The backend already contained duplicate application validation.

When the student tried to apply for the same job again, the application was rejected by the existing business logic.

This helped maintain data integrity without duplicating the validation in JavaScript.

## 5. Handling Success and Failure

The component needed to clearly communicate whether the application was successful or failed.

A success message was displayed when the application was created, and an error message was displayed when the request failed.

## 6. Debugging the Apply Workflow

During testing, the Apply button initially caused issues where more than one button appeared to be affected.

The problem was investigated by checking the Job Id, event handling, component communication, and Apex request flow.

The component was then updated so that the correct job card handled its own submitting state.

## 7. Salesforce Deployment Issues

While deploying the LWC and Apex files, connection errors occurred during metadata deployment.

The Salesforce connection was checked and restored, after which the files were successfully deployed.

## 8. Keeping Business Logic in Apex

Another challenge was deciding where the application validation should happen.

Instead of putting CGPA, deadline, and duplicate validation in JavaScript, the existing Apex Service Layer was reused.

This kept the business rules centralized and reusable.

## Key Challenge Learned

The main challenge was connecting the user interface with the existing backend architecture without duplicating business logic.

The final flow became:

```text
Student
   ↓
Job Card
   ↓
Custom Event
   ↓
Eligible Jobs
   ↓
Imperative Apex
   ↓
StudentController
   ↓
PlacementDataService
   ↓
ApplicationService
   ↓
Application
