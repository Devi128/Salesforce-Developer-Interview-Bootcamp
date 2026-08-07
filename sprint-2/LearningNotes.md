# Day 2 - Apex Triggers & Governor Limits

## Project

Placement Management System

## Objective

Implement business automation using Apex Triggers and understand
how Salesforce Governor Limits influence Apex development.

---

# What I Learned

## 1. Apex Trigger

An Apex Trigger is Apex code that executes automatically when
specific changes occur to Salesforce records.

A trigger can execute during events such as:

- Before Insert
- Before Update
- After Insert
- After Update
- Before Delete
- After Delete

---

# 2. Before Trigger

A Before Trigger is useful when we want to modify or validate
records before they are saved.

In our Placement Management System, we used a Before Insert
trigger to:

- Prevent duplicate applications
- Validate CGPA
- Validate application deadline
- Set the default Application Status

---

# 3. After Trigger

An After Trigger is useful when we need to perform actions after
the record has been saved.

We used an After Update trigger to detect when an application
becomes `Selected`.

When an application is selected:

```text
Application Status = Selected
             ↓
Student.Placed__c = true
