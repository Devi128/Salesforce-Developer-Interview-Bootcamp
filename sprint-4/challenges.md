# Day 4 – Challenges Faced

## Lightning Web Components (LWC)

During Day 4, I worked on creating my first Lightning Web Component and building the initial user interface for the Placement Management System. While completing the activities, I faced a few challenges.

---

## 1. Understanding the LWC File Structure

Initially, it was slightly confusing to understand the purpose of the three files in an LWC.

The component contains:

* `placementHome.html`
* `placementHome.js`
* `placementHome.js-meta.xml`

I had to understand that each file has a different responsibility.

### How I Overcame It

I understood the separation of responsibilities:

* HTML → User Interface
* JavaScript → Logic and behaviour
* Meta XML → Component configuration

This helped me understand the overall LWC structure.

---

## 2. Understanding Data Binding

Initially, I found it difficult to understand how JavaScript variables are displayed inside the HTML template.

For example:

`{studentName}`

was initially unfamiliar.

### How I Overcame It

I practiced by creating variables in JavaScript and displaying them in HTML.

For example:

```text
studentName = 'Devi';
```

and:

```text
Hello {studentName}
```

This helped me understand how data from JavaScript is displayed dynamically in the UI.

---

## 3. Handling Button Click Events

Another challenge was understanding how a button in HTML can execute a JavaScript method.

I learned that the `onclick` event is used to call a JavaScript method.

Example:

```text
onclick={handleClick}
```

### How I Overcame It

I created a simple button and connected it to a JavaScript method.

When the button was clicked, the method executed and displayed the welcome message.

This helped me understand event handling in LWC.

---

## 4. Changing Application Status

I needed to change the application status from:

`Not Applied`

to:

`Applied`

when the button was clicked.

Initially, I was unsure how to update the displayed value dynamically.

### How I Overcame It

I created a JavaScript variable for the status and changed its value inside the button click method.

This helped me understand how JavaScript can control the state of an LWC.

---

## 5. Understanding the Role of the Meta XML File

Initially, I was not fully clear about why the Meta XML file was required.

I learned that it controls the component's metadata and determines whether the component can be exposed in Salesforce and where it can be used.

### How I Overcame It

I studied the `isExposed` property and the Lightning page targets in the Meta XML file.

This helped me understand how an LWC becomes available in Lightning App Builder.

---

## 6. Deploying the LWC to Salesforce

Another challenge was understanding the process of deploying the component from the development environment to Salesforce.

I learned that creating the component locally is not enough. It must be deployed to the Salesforce org before it can be used there.

### How I Overcame It

I followed the deployment process and verified the component inside Salesforce after deployment.

---

## 7. Understanding LWC and Apex Responsibilities

Initially, it was slightly confusing to understand which tasks should be handled by LWC and which should be handled by Apex.

### How I Overcame It

I understood the basic separation:

```text
LWC
↓
User Interface and Client-side Behaviour

Apex
↓
Server-side Logic and Salesforce Data Operations

SOQL / DML
↓
Database Operations
```

This helped me understand how the frontend and backend will be connected in future development.

---

## 8. Working with Hard-Coded Values

For the Placement Portal home page, values such as:

* Number of Companies
* Number of Jobs
* Applications Submitted

were hard-coded.

Initially, I thought these values should come directly from Salesforce records.

### How I Overcame It

I understood that hard-coded values are acceptable for the initial UI development.

In future stages, these values can be retrieved dynamically using Apex and SOQL.

---

## 9. Overall Challenge

The biggest challenge was understanding how different parts of an LWC work together.

The component involves:

* HTML
* JavaScript
* Meta XML
* Data binding
* Events
* Component state
* Salesforce deployment

After completing the activities, I understood how these parts work together to create an interactive Salesforce user interface.

---

## Conclusion

The challenges faced during Day 4 helped me understand LWC more practically rather than only learning its theory.

The most important lesson I learned was that a Salesforce application separates responsibilities between the user interface, business logic, and database.

This understanding will help me when I connect the LWC with Apex and Salesforce data in the upcoming stages.
