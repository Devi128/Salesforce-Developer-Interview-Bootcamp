# Day 10 – Lightning Web Components

## Overview

Day 10 focused on building an interactive Placement Management interface using Lightning Web Components (LWC).

## Topics Covered

- Parent-to-child communication using `@api`
- Child-to-parent communication using Custom Events
- Communication between sibling components through a parent
- Lightning Data Service
- Apex integration with LWC
- `@wire` for retrieving data
- `refreshApex()` for refreshing data
- Reusable LWC components
- Client-side and server-side validation
- Application management

## Components Developed

- `placementHome`
- `studentProfile`
- `eligibleJobs`
- `jobCard`
- `jobDetails`
- `myApplications`
- `applicationCard`
- `statusBadge`
- `studentList`

## Main Features

### Student Profile

Students can view and update:

- CGPA
- Branch
- Graduation Year

Profile updates are saved to Salesforce and the eligible jobs list is refreshed.

### Eligible Jobs

The system displays jobs based on:

- Student CGPA
- Job minimum CGPA
- Job application last date

Students can apply for eligible jobs.

### Job Application

When a student applies:

1. The application is created using Apex.
2. Duplicate applications are prevented.
3. The application status is set to `Applied`.
4. Eligible jobs are refreshed.
5. My Applications is automatically refreshed.

### My Applications

The `myApplications` component retrieves real `Application__c` records through Apex.

Each application is displayed using the reusable `applicationCard` component.

### Status Badge

Created a reusable `statusBadge` component to display application statuses.

## Apex Integration

The LWC components communicate with Apex through:

- `StudentController`
- `PlacementDataService`

The service layer handles database operations and business logic.

## Communication Flow

```text
Student Profile
      ↓
Custom Event
      ↓
Placement Home
      ↓
Refresh Eligible Jobs
      ↓
Eligible Jobs
      ↓
Application Created
      ↓
Custom Event
      ↓
Placement Home
      ↓
Refresh My Applications
```

## Day 10 Outcome

Successfully built an interactive Salesforce Placement Portal using LWC with reusable components, Apex integration, component communication, validation, and automatic data refreshing.
