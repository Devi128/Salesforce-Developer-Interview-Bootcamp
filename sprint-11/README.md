# Day 11 – External API Integration

## Overview

In Day 11, I implemented external API integration in the Salesforce Placement Management System.

The main goal was to synchronize selected candidates with an external recruitment API using Salesforce asynchronous Apex and secure API configuration.

## Topics Covered

* Named Credentials
* External Credentials
* External Credential Principals
* Permission Set access
* Queueable Apex
* HTTP Callouts
* JSON request handling
* API response handling
* Integration status tracking
* Retry mechanism
* Automatic Queueable retry
* Trigger-based integration

## Practical Work Completed

### 1. Created Integration Fields

Added integration-related fields to the `Application__c` object:

* Integration Status
* Integration Error
* Last Integration Attempt
* Integration Retry Count
* External Candidate ID

### 2. Configured External API

Created:

* External Credential
* External Credential Principal
* Named Credential

The Named Credential was used to securely reference the external recruitment API from Apex.

### 3. Created Queueable Apex

Created:

`CandidateSyncQueueable.cls`

The Queueable class:

* Implements `Queueable`
* Implements `Database.AllowsCallouts`
* Sends an HTTP POST request
* Creates a JSON request body
* Calls the external recruitment API
* Processes the API response
* Updates integration fields on the Application

### 4. Implemented Response Handling

The integration handles successful and unsuccessful API responses.

Successful responses update the Application as:

```text
Integration Status = Success
Integration Retry Count = 0
Integration Error = blank
```

### 5. Implemented Retry Mechanism

For failed API responses, the system automatically retries the integration.

The retry count is increased for each failed attempt.

After the maximum number of attempts, the integration is marked as:

```text
Integration Status = Failed
```

### 6. Connected Integration with Application Trigger

Updated the Application trigger and `ApplicationTriggerHandler`.

When an Application changes from:

```text
Applied → Selected
```

the system automatically starts `CandidateSyncQueueable`.

The Queueable then sends the candidate information to the external recruitment API.

### 7. Existing Placement Logic

The existing Selected status logic continues to work.

When an Application becomes `Selected`:

* The candidate synchronization is triggered.
* The student is marked as placed.
* The existing notification logic is executed.

## Final Flow

```text
Application Status
       ↓
Applied → Selected
       ↓
Application Trigger
       ↓
ApplicationTriggerHandler
       ↓
CandidateSyncQueueable
       ↓
HTTP POST Callout
       ↓
Recruitment API
       ↓
Integration Status
       ↓
Success / Retry Required / Failed
```

## Testing

The integration was tested successfully.

### Successful Integration

Verified:

* Integration Status = `Success`
* Integration Retry Count = `0`
* Integration Error = blank
* Last Integration Attempt is populated

### Retry Testing

Tested an invalid API endpoint to verify the retry mechanism.

Verified:

* Retry Required status
* Retry counter increment
* Automatic Queueable retry
* Maximum retry handling

### End-to-End Testing

Changed an Application status to `Selected`.

Verified:

* Queueable executed automatically
* External API integration succeeded
* Integration Status became `Success`
* Retry Count was reset to `0`
* Student `Placed__c` became `true`

## Key Learning

Day 11 helped me understand how Salesforce can securely communicate with external systems using Named Credentials, External Credentials, Queueable Apex, and HTTP Callouts.

I also learned how to implement retry handling and connect asynchronous integration logic with Salesforce triggers.
