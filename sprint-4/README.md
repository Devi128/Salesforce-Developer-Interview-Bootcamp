
# Day 4 - Building Business Logic with Apex

## Project
Placement Management System

## Objective

Implement business logic using Apex Service Classes
and separate business responsibilities from the Trigger Handler.

## Architecture

ApplicationTrigger
        ↓
ApplicationTriggerHandler
        ↓
ApplicationService
        ↓
Salesforce Database

## ApplicationService Responsibilities

### setDefaultStatus()
Automatically sets Application Status to "Applied".

### validateDuplicateApplications()
Prevents a student from applying for the same job more than once.

### validateCGPA()
Checks whether the student's CGPA satisfies the minimum CGPA
requirement of the job.

### validateLastDate()
Prevents applications after the job closing date.

## ApplicationTriggerHandler Responsibilities

The Trigger Handler:

- Collects record IDs
- Performs bulk SOQL queries
- Calls the appropriate service methods
- Handles after-update processing

## Business Rules

1. Duplicate applications are rejected.
2. Student CGPA must satisfy the job requirement.
3. Applications after the deadline are rejected.
4. New applications receive the status "Applied".
5. When an application becomes "Selected", the student is marked as placed.

## Concepts Learned

- Apex Classes
- Methods
- Parameters
- Return/processing logic
- Service Layer
- Trigger Handler Pattern
- Separation of Responsibilities
- SOQL
- Collections
- Bulkification
- addError()
- Business Logic

## Engineering Principle

Business logic should be organized according to
business responsibilities rather than putting everything
inside one large Trigger.
