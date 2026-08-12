# Day 8 – Asynchronous Workflows

## Sprint Objective

The objective of Day 8 was to understand and implement asynchronous processing in Salesforce using Apex.

The practical work focused on understanding when work should happen immediately and when it can be moved to background processing.

## Topics Covered

- Synchronous vs Asynchronous Processing
- Future Methods
- Queueable Apex
- Batch Apex
- Scheduled Apex
- Monitoring Asynchronous Jobs
- Choosing the appropriate asynchronous approach

## Practical Work Completed

### 1. Queueable Apex

Created a Queueable Apex class:

- `OfferPostProcessingJob`

The job receives an Offer Letter Id and performs post-offer processing asynchronously.

### 2. Future Method

Created:

- `ApplicationNotificationService`

Implemented a Future Method to demonstrate background processing of an Application record.

### 3. Batch Apex

Created:

- `ApplicationBatchProcessor`

Used Batch Apex to process Application records in batches using the Start, Execute, and Finish lifecycle.

### 4. Scheduled Apex

Created:

- `JobDeadlineScheduler`

The scheduler identifies expired Job records and runs at a scheduled time.

### 5. Asynchronous Job Monitoring

Used Salesforce asynchronous job information to check:

- Job type
- Status
- Number of errors
- Records processed
- Total records
- Completion time

## Key Learnings

- Not every operation needs to happen immediately.
- Future Methods can perform work asynchronously.
- Queueable Apex provides a structured way to run background jobs.
- Batch Apex is useful when processing large datasets.
- Scheduled Apex is useful when work needs to run at a particular time.
- Asynchronous jobs should be monitored to identify successful and failed executions.
- The choice of asynchronous tool should depend on the business requirement.

## Tools Used

- Salesforce Developer Console
- Apex
- SOQL
- Execute Anonymous
- `AsyncApexJob`
- `CronTrigger`

## Outcome

Successfully implemented and tested the main asynchronous Apex concepts required for Day 8 and gained practical understanding of how Salesforce handles background processing.
