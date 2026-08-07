# Day 1 - Salesforce Foundation & Data Modeling

## Project

Placement Management System

## Objective

Build the foundation of a Salesforce application for managing
students, companies, job opportunities, applications, and
placement offers.

The main focus of Day 1 was understanding Salesforce data
modeling and creating the required objects and relationships.

---

# 1. What I Learned

## Salesforce Objects

A Salesforce Object is similar to a database table.

Objects store records and organize related business information.

Examples in the Placement Management System:

- Student
- Company
- Job
- Application
- Offer Letter

---

# 2. Custom Objects

We created custom objects to represent the business entities
of the Placement Management System.

### Student

Stores information about students.

Examples:

- Student Name
- CGPA
- Placement Status
- Other student information

### Company

Stores information about companies participating in placements.

### Job

Stores job opportunities published by companies.

Examples:

- Job Name
- Minimum CGPA
- Last Date
- Company

### Application

Stores applications submitted by students for jobs.

Examples:

- Student
- Job
- Application Date
- Status

### Offer Letter

Stores offer information when a student is selected.

---

# 3. Fields

Fields are used to store individual pieces of information
inside Salesforce records.

For example:

Student:

- Name
- CGPA

Job:

- Minimum CGPA
- Last Date

Application:

- Student
- Job
- Application Date
- Status

---

# 4. Relationships

Relationships connect records between Salesforce objects.

For example:

Student → Application

Job → Application

Application → Offer Letter

This allows Salesforce to understand how different
business records are connected.

---

# 5. Lookup Relationships

A Lookup Relationship creates a relationship between
two objects without making the child completely dependent
on the parent.

Example:

Application → Student

Application → Job

An Application record can therefore identify:

- Which student applied
- Which job the student applied for

---

# 6. Master-Detail Relationship

A Master-Detail Relationship creates a stronger dependency
between the parent and child records.

The child record depends on the parent record.

Master-Detail relationships can also support features such as:

- Roll-up summary fields
- Parent-controlled security
- Cascading deletion

---

# 7. Record

A record represents one instance of an object.

For example, a Student object may contain:

Student:

Name: Rahul  
CGPA: 8.5

This is one Student record.

---

# 8. Salesforce App

A Salesforce App provides a user interface for accessing
related objects and records.

The Placement Management App contains the objects required
for the placement system.

Navigation items include:

- Students
- Companies
- Jobs
- Applications
- Offer Letters

---

# 9. Required Fields

A required field must contain a value before a record
can be saved.

Required fields help maintain data quality.

For example:

An Application should have:

- Student
- Job

so that the system knows who applied for which job.

---

# 10. Placement Management System Data Model

The basic relationship is:

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

When a student is selected:

Application
   |
   | selected
   ↓
Offer Letter

---

# 11. Important Salesforce Concepts Learned

- Salesforce Organization (Org)
- Salesforce App
- Standard Objects
- Custom Objects
- Fields
- Records
- Lookup Relationships
- Master-Detail Relationships
- Required Fields
- Object Manager
- App Navigation
- Data Modeling

---

# 12. Business Understanding

The most important lesson from Day 1 was:

> Before building automation or writing code, understand
> the business entities and how they are related.

The Placement Management System needs to represent real
business entities before business logic can be implemented.

---

# 13. Engineering Lesson

## Data comes before business logic.

Before asking:

"What code should I write?"

I should first understand:

- What information does the business need?
- Which objects represent that information?
- Which fields are required?
- How are the objects related?

A good data model makes future automation and Apex development
much easier.

---

# 14. Day 1 Outcome

By the end of Day 1, I had created the foundation of the
Placement Management System.

The system can store:

- Student information
- Company information
- Job opportunities
- Student applications
- Offer letters

This foundation was used in later sprints to implement
business automation using Flow, Validation Rules, and Apex.
