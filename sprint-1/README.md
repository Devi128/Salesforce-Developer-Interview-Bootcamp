# Day 1 - Salesforce Foundation & Data Modeling

## Project

Placement Management System

## Objective

Build the Salesforce foundation for a Placement Management System
by creating the required objects, fields, relationships, and
application navigation.

## What I Built

Created the following custom objects:

- Student
- Company
- Job
- Application
- Offer Letter

Configured important fields such as:

- Student CGPA
- Job Minimum CGPA
- Job Last Date
- Application Date
- Application Status
- Student Placement Status

Configured relationships between the objects to represent the
placement process.

## Data Model

```text
Student
   |
   | applies
   ↓
Application
   |
   | for
   ↓
Job
   |
   | belongs to
   ↓
Company

Application
   |
   | selected
   ↓
Offer Letter
