# Day 3 - Salesforce Automation

## Project
Placement Management System

## Objective

Implement business automation using Salesforce Flow and
Validation Rules.

## Automation Implemented

### 1. Application Date Automation

A Record-Triggered Flow automatically populates the
Application Date when a new Application record is created.

### 2. Email Notification

A Flow sends an email notification to the Placement Officer
when a new application is submitted.

### 3. Offer Letter Automation

When an Application Status changes to "Selected",
an Offer Letter record is automatically created.

### 4. Validation Rules

Validation Rules were created to maintain data quality.

Rules include:

- Student CGPA must satisfy the Job's minimum CGPA.
- Application Date cannot be after the Job closing date.
- Required information must be provided.

## Concepts Learned

- Record-Triggered Flow
- Flow Start Element
- Assignment Element
- Email Action
- Create Records
- Validation Rules
- Formula fields/formulas
- Flow debugging
- Declarative automation

## Flow Architecture

Application Created
        ↓
Record-Triggered Flow
        ↓
Set Application Date
        ↓
Send Email
        ↓
Application Completed

## Offer Letter Flow

Application Status = Selected
        ↓
Record-Triggered Flow
        ↓
Create Offer Letter
