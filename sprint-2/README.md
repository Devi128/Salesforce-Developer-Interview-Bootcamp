# Day 2 - Apex Triggers & Governor Limits

## Project
Placement Management System

## Objective
Implement business automation using Apex Triggers and understand
Governor Limits and bulkified Apex.

## Business Requirements

1. Prevent duplicate applications.
2. Validate student's CGPA against the job's minimum CGPA.
3. Reject applications after the job's last date.
4. Automatically set application Status to "Applied".
5. When an application becomes "Selected", mark the student as Placed.

## Apex Components

### ApplicationTrigger
Handles:
- before insert
- after update

### ApplicationTriggerHandler
Contains the application business logic and keeps the trigger lightweight.

## Trigger Events

### Before Insert
- Prevent duplicate applications
- Validate CGPA
- Validate application deadline
- Set default Status

### After Update
- When Status becomes Selected
- Update Student.Placed__c = true

## Important Concepts Learned

- Apex Trigger
- Before Trigger
- After Trigger
- Trigger.new
- Trigger Context Variables
- SOQL
- DML
- Collections
- Bulkification
- Governor Limits
- Trigger Handler Pattern
- addError()

## Bulkification

The code collects Student and Job IDs into Sets and performs
SOQL queries outside loops.

This avoids SOQL inside loops and makes the trigger safer for
processing multiple records.

## Architecture

ApplicationTrigger
        ↓
ApplicationTriggerHandler
        ↓
Salesforce Database
