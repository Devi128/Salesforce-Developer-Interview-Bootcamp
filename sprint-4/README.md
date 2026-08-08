# Salesforce Interview Readiness Bootcamp – Day 4
## Building Your First Lightning Web Component (LWC)

## Overview

Day 4 focused on building the **user interface layer** of the Placement Management System using **Lightning Web Components (LWC)**.

Until Day 3, the project mainly focused on the backend, including:

- Data Model
- SOQL Queries
- Apex Triggers
- Business Rules

In Day 4, the focus shifted to the frontend by creating a reusable Lightning Web Component and understanding how the UI will eventually communicate with Apex.

---

## Objectives

By completing Day 4, I learned how to:

- Explain what Lightning Web Components are.
- Create my first LWC.
- Understand the structure of an LWC.
- Deploy an LWC to a Lightning Page.
- Use basic data binding.
- Handle button click events.
- Use JavaScript to manage component behaviour.
- Understand how LWC can communicate with Apex.
- Build the first UI screen of the Placement Management System.

---

## What is Lightning Web Components?

**Lightning Web Components (LWC)** is Salesforce's modern UI framework for building reusable and maintainable user interfaces using standard web technologies such as:

- HTML
- JavaScript
- CSS

LWC is based on modern web standards and allows developers to create fast, reusable, and maintainable Salesforce user interfaces.

---

## Salesforce Application Architecture

The Placement Management System follows a layered architecture:

```text
User
 │
 ▼
Lightning Web Component
 │
 ▼
Apex Classes
 │
 ▼
SOQL / DML
 │
 ▼
Salesforce Database

## LWC Structure
### A Lightning Web Component consists of three important file:
### Example : 
placementHome/
│
├── placementHome.html
├── placementHome.js
└── placementHome.js-meta.xml

## placementHome.html
Responsible for the user interface.
##placementHome.js
Responsible for the component's logic.
##placementHome.js-meta.xml
Responsible for component configuration.

## Activities Completed

### 1. Created the First LWC

Created a Lightning Web Component named:

`placementHome`

The component displays:

`Welcome to Vishnu Placement Portal`

The component was deployed and added to a Lightning Page.

### 2. Displayed Student Information

Created variables for:

- Student Name
- Roll Number
- Department

Example:

```text
Student Name : Devi
Roll Number  : 23pa1a0540
Department   : CSE

### 3. Implemented Button Click

Created a button with the label:

`Show Welcome Message`

When clicked, it displays:

`Welcome to Salesforce Development.`

### 4. Implemented Application Status

Initially:

`Status : Not Applied`

After clicking the button:

`Status : Applied`

This functionality was implemented using JavaScript without Apex or database interaction.

### 5. Created Placement Portal Home Page

Created the initial UI for the Placement Management System.

The page displays:

```text
Placement Portal

Today's Date

Welcome Student

Number of Companies : 25
Number of Jobs : 63
Applications Submitted : 5


The future architecture will be:

```text
User
  |
  v
LWC
  |
  v
Apex
  |
  v
SOQL / DML
  |
  v
Salesforce Database
```

Currently, the Placement Portal uses hard-coded values. In future development, these values will be retrieved dynamically from Salesforce using Apex.

## Repository Structure

```text
Day-4-LWC/
│
├── README.md
│
├── force-app/
│   └── main/
│       └── default/
│           └── lwc/
│               └── placementHome/
│                   ├── placementHome.html
│                   ├── placementHome.js
│                   └── placementHome.js-meta.xml
│
└── screenshots/
    ├── placement-home.png
    ├── student-details.png
    ├── welcome-message.png
    ├── application-status.png
    └── placement-portal.png
```

## Technologies Used

* Salesforce
* Lightning Web Components
* HTML
* JavaScript
* CSS
* Salesforce Lightning App Builder
* VS Code
* Salesforce CLI

## Future Enhancements

* Connect LWC with Apex
* Retrieve real Salesforce data
* Display actual company, job, and application counts
* Display student-specific information
* Add navigation to Jobs and Applications
* Connect the UI with the existing Placement Management System business logic
* Improve the Placement Portal UI

## Conclusion

Day 4 introduced the frontend development layer of the Placement Management System using Lightning Web Components.

The activities helped me understand how Salesforce applications can combine a user interface built with LWC, server-side logic using Apex, and data stored in the Salesforce database.

The next step is to connect the LWC with Apex and replace the hard-coded values with real Salesforce data.
