# Day 8 – Challenges

## 1. Understanding Asynchronous Processing

One of the initial challenges was understanding the difference between synchronous and asynchronous processing.

It was necessary to identify which work should happen immediately and which work could be performed in the background.

## 2. Understanding Queueable Apex

Understanding how Queueable Apex works was a challenge, especially how the job is created, submitted, and executed separately from the original transaction.

## 3. Understanding Future Methods

It was challenging to understand when a Future Method should be used and how it performs work asynchronously.

## 4. Understanding Batch Apex

Understanding the Batch Apex lifecycle was another challenge.

The three stages were:

- Start
- Execute
- Finish

It was also important to understand that records are processed in smaller batches rather than all at once.

## 5. Understanding Scheduled Apex

Understanding how to schedule an Apex class and verify that it was registered correctly was challenging.

The `CronTrigger` object was used to verify the scheduled job.

## 6. Monitoring Asynchronous Jobs

Another challenge was understanding how to verify whether asynchronous jobs were successfully submitted and completed.

The `AsyncApexJob` object was used to monitor Queueable and Batch jobs.

## 7. Choosing the Correct Asynchronous Tool

It was challenging at first to decide which asynchronous mechanism should be used for different business requirements.

The main learning was to consider the type of workload before choosing Future, Queueable, Batch, or Scheduled Apex.

## How I Overcame These Challenges

- Followed the Day 8 practical steps one at a time.
- Tested each asynchronous feature separately.
- Used Debug Logs to verify execution.
- Used `AsyncApexJob` and `CronTrigger` to monitor jobs.
- Connected each Apex feature with a practical Placement Management System scenario.

## Overall Challenge

The biggest challenge was understanding that asynchronous Apex is not just about running code in the background. The correct technology must be selected based on the business requirement, data volume, and timing of the work.
