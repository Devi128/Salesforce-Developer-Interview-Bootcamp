# Day 8 – Learning Notes

## Asynchronous Workflows

Day 8 focused on asynchronous processing in Salesforce Apex and understanding how work can be handled in the background.

## Synchronous vs Asynchronous Processing

Synchronous processing happens immediately and the user waits for the operation to complete.

Asynchronous processing allows secondary work to happen later without making the user wait.

The main question to ask is:

> Should this work happen now, later, in batches, or at a scheduled time?

## Future Methods

Future Methods are used when work can be performed asynchronously.

They are useful when the work does not need to block the current transaction.

In the practical work, a Future Method was created to process an Application record in the background.

## Queueable Apex

Queueable Apex provides a structured way to perform background processing.

A Queueable job can receive information such as an Id and retrieve the required records when the job executes.

In the practical work, `OfferPostProcessingJob` was created to demonstrate post-offer background processing.

## Batch Apex

Batch Apex is useful when a large number of records need to be processed.

The Batch Apex lifecycle contains three main methods:

- Start
- Execute
- Finish

The `start` method identifies the records to process.

The `execute` method processes records in smaller batches.

The `finish` method performs completion activities.

In the practical work, `ApplicationBatchProcessor` was created to process Application records.

## Scheduled Apex

Scheduled Apex is used when a process needs to run at a particular time or on a recurring schedule.

In the practical work, `JobDeadlineScheduler` was created to identify expired Job records.

The scheduler was registered using `System.schedule()`.

## Monitoring Asynchronous Jobs

Asynchronous processing should not be treated as invisible.

Salesforce provides information about asynchronous jobs that can be used to check:

- Job status
- Job type
- Number of errors
- Records processed
- Total records
- Completion time

`AsyncApexJob` was used to monitor the Queueable and Batch jobs.

`CronTrigger` was used to verify the scheduled job.

## Choosing the Right Tool

The main decision-making approach learned was:

| Requirement | Suitable Approach |
|---|---|
| Work can happen later | Future / Queueable |
| Structured background job | Queueable |
| Large dataset | Batch Apex |
| Work must happen at a particular time | Scheduled Apex |

## Key Takeaways

- Asynchronous processing helps move secondary work away from the immediate transaction.
- Queueable Apex is useful for structured background jobs.
- Batch Apex is suitable for processing large datasets.
- Scheduled Apex is suitable for time-based processing.
- Future Methods provide a simple way to perform asynchronous work.
- Asynchronous jobs should be monitored after they are submitted.
- The business requirement should determine which asynchronous technology is used.
