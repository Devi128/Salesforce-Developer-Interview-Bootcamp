# Sprint 09 – Lightning Web Components

## Objective

Build an interactive student placement interface using Lightning Web Components.

## Work Completed

- Created the **Eligible Jobs** component.
- Displayed eligible jobs for a student.
- Added an **Apply** button.
- Created a reusable **Job Card** child component.
- Implemented parent-to-child communication using `@api`.
- Implemented child-to-parent communication using Custom Events.
- Used imperative Apex for the Apply action.
- Reused the existing Apex Service Layer and business rules.
- Prevented duplicate applications.
- Added success and failure messages.
- Added a submitting state to prevent repeated clicks.
- Refreshed the job data after a successful application.

## Component Structure

```text
eligibleJobs
    |
    └── jobCard
