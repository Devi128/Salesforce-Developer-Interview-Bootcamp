# Day 4 – Learning Notes

## Lightning Web Components (LWC)

### 1. What is LWC?

Lightning Web Components (LWC) is Salesforce's modern framework for building user interfaces.

It is based on standard web technologies such as:

* HTML
* JavaScript
* CSS

LWC is used to create reusable, maintainable, and interactive components in Salesforce.

---

## 2. Why Salesforce Introduced LWC

Salesforce introduced LWC as a modern alternative to Aura Components.

LWC is based on web standards and modern JavaScript.

### Advantages of LWC

* Uses standard web technologies.
* Uses modern JavaScript.
* Supports reusable components.
* Provides better maintainability.
* Allows modular UI development.
* Works naturally with Salesforce Lightning Experience.
* Can communicate with Apex for server-side operations.

---

## 3. LWC vs Aura

| LWC                               | Aura                                        |
| --------------------------------- | ------------------------------------------- |
| Modern Salesforce UI framework    | Older Salesforce component framework        |
| Based on web standards            | Uses Salesforce-specific framework concepts |
| Uses modern JavaScript            | Uses Aura-specific programming model        |
| Generally simpler to develop      | More complex component structure            |
| Uses standard HTML and JavaScript | Uses Aura markup and controllers            |

### Interview Answer

LWC is Salesforce's modern UI framework based on web standards such as HTML, JavaScript, and CSS. Aura is the older Salesforce component framework. LWC provides a more modern and standard web development approach.

---

## 4. Structure of an LWC

A Lightning Web Component generally contains three important files:

```text
componentName/
│
├── componentName.html
├── componentName.js
└── componentName.js-meta.xml
```

For the Day 4 project:

```text
placementHome/
│
├── placementHome.html
├── placementHome.js
└── placementHome.js-meta.xml
```

---

## 5. HTML File

The `.html` file defines the user interface of the component.

### Responsibilities

* Page structure
* Text
* Buttons
* Layout
* Displaying data
* Lightning Base Components

Example:

```html
<template>
    <h1>Welcome to Vishnu Placement Portal</h1>
</template>
```

The HTML file controls what the user sees on the screen.

---

## 6. JavaScript File

The `.js` file contains the logic of the component.

### Responsibilities

* Variables
* Methods
* Events
* Button click handling
* Data manipulation
* Component behaviour
* Communication with Apex

Example:

```javascript
import { LightningElement } from 'lwc';

export default class PlacementHome extends LightningElement {
    studentName = 'Devi';

    handleClick() {
        console.log('Button clicked');
    }
}
```

---

## 7. Meta XML File

The `.js-meta.xml` file contains metadata and configuration for the component.

It is used to:

* Expose the component to Salesforce.
* Make the component available in Lightning App Builder.
* Define where the component can be used.
* Configure component targets.

Example:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<LightningComponentBundle xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>65.0</apiVersion>
    <isExposed>true</isExposed>

    <targets>
        <target>lightning__HomePage</target>
        <target>lightning__RecordPage</target>
        <target>lightning__AppPage</target>
    </targets>
</LightningComponentBundle>
```

---

## 8. Creating an LWC

An LWC can be created using Salesforce CLI.

Example command:

```text
sf lightning generate component --name placementHome --type lwc
```

This creates the basic component structure.

```text
placementHome/
├── placementHome.html
├── placementHome.js
└── placementHome.js-meta.xml
```

---

## 9. Deploying an LWC

After creating and developing the component, it needs to be deployed to the Salesforce org.

After deployment, the component can be exposed through its Meta XML configuration and added to a supported Lightning Page using Lightning App Builder.

---

## 10. Data Binding

Data binding is the process of displaying JavaScript data in the HTML template.

Example JavaScript:

```javascript
studentName = 'Devi';
```

HTML:

```html
<template>
    <p>Hello {studentName}</p>
</template>
```

Output:

```text
Hello Devi
```

If the value of `studentName` changes, the displayed value can also update.

---

## 11. JavaScript Variables in LWC

Variables can be created inside the JavaScript class.

Example:

```javascript
studentName = 'Devi';
rollNumber = '23PA1A0540';
department = 'CSE';
```

These values can be displayed in the HTML template.

Example:

```html
<template>
    <p>Student Name: {studentName}</p>
    <p>Roll Number: {rollNumber}</p>
    <p>Department: {department}</p>
</template>
```

---

## 12. Event Handling

Events allow the component to respond to user actions.

For example, a button click can trigger a JavaScript method.

HTML:

```html
<lightning-button
    label="Show Welcome Message"
    onclick={handleClick}>
</lightning-button>
```

JavaScript:

```javascript
handleClick() {
    this.message = 'Welcome to Salesforce Development.';
}
```

When the button is clicked, the `handleClick()` method executes.

---

## 13. Changing Component State

JavaScript can be used to change values displayed by the component.

Example:

```javascript
status = 'Not Applied';

handleApply() {
    this.status = 'Applied';
}
```

HTML:

```html
<p>Status: {status}</p>

<lightning-button
    label="Apply"
    onclick={handleApply}>
</lightning-button>
```

Initially:

```text
Status: Not Applied
```

After clicking the button:

```text
Status: Applied
```

This activity does not require Apex or a database.

---

## 14. LWC and Salesforce Data

LWC itself is responsible mainly for the user interface and client-side behaviour.

When Salesforce data needs to be retrieved or modified, LWC can communicate with Apex.

The architecture is:

```text
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

---

## 15. Can LWC Directly Execute SOQL?

No.

LWC cannot directly execute SOQL.

If an LWC needs to retrieve or modify Salesforce data through Apex, the typical flow is:

```text
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

---

## 16. Why Does LWC Need Apex?

Apex is required when server-side processing or Salesforce database operations are needed.

Apex can be used for:

* SOQL queries
* DML operations
* Business logic
* Complex calculations
* Data processing
* Accessing Salesforce records

For example:

```text
Placement Portal
       |
       v
LWC
       |
       v
Apex
       |
       v
SOQL
       |
       v
Company / Job / Application Records
```

---

## 17. LWC Responsibilities vs Apex Responsibilities

### LWC

LWC mainly handles:

* User interface
* User interaction
* Buttons
* Events
* Displaying data
* Client-side behaviour

### Apex

Apex mainly handles:

* Server-side logic
* SOQL
* DML
* Business rules
* Database operations
* Complex processing

A simple way to remember this is:

```text
LWC = User Interface

Apex = Server-side Logic

Salesforce Database = Data Storage
```

---

## 18. Hard-Coded Data vs Dynamic Data

During Day 4, some Placement Portal values were hard-coded.

Example:

```text
Number of Companies : 25
Number of Jobs : 63
Applications Submitted : 5
```

This is acceptable for learning the UI.

However, a real application should retrieve these values from Salesforce.

Future architecture:

```text
LWC
 |
 v
Apex
 |
 v
SOQL
 |
 v
Salesforce Records
```

This will allow the UI to display real-time data.

---

## 19. Placement Portal UI

The first screen of the Placement Management System contains:

```text
Placement Portal

Today's Date

Welcome Student

Number of Companies : 25

Number of Jobs : 63

Applications Submitted : 5
```

The purpose of this screen is to provide students with a simple overview of placement information.

---

## 20. Important Interview Questions

### What is LWC?

LWC is Salesforce's modern UI framework for building reusable components using HTML, JavaScript, CSS, and modern web standards.

### What are the three main files in an LWC?

The three main files are:

* `.html`
* `.js`
* `.js-meta.xml`

### Why is JavaScript used in LWC?

JavaScript is used for component logic, variables, event handling, user interactions, and communication with Apex.

### What is data binding?

Data binding allows JavaScript values to be displayed dynamically in the HTML template using expressions such as `{studentName}`.

### Can LWC directly execute SOQL?

No. LWC cannot directly execute SOQL. Apex can be used to access Salesforce data when server-side processing is required.

### Why is Apex used with LWC?

Apex is used when the component needs server-side business logic, SOQL queries, DML operations, or complex data processing.

### Where can an LWC be used?

An exposed LWC can be added to supported Lightning pages such as:

* Home Page
* Record Page
* App Page

---

## 21. Key Takeaways

* LWC is used to build the Salesforce user interface.
* LWC is based on modern web standards.
* HTML defines the UI.
* JavaScript controls component logic and behaviour.
* Meta XML controls component configuration and exposure.
* Data binding connects JavaScript values with HTML.
* Events allow components to respond to user actions.
* LWC cannot directly execute SOQL.
* Apex handles server-side logic and database operations.
* Hard-coded values can be used while developing the UI, but real applications should retrieve data dynamically.
* LWC, Apex, SOQL, and the Salesforce Database work together to build complete Salesforce applications.

---

## 22. Day 4 Summary

Day 4 introduced the frontend development layer of the Placement Management System.

I learned how to create an LWC, understand its three main files, display data using data binding, handle button events, change component values using JavaScript, and deploy the component to a Lightning Page.

I also understood the relationship between LWC and Apex and how the frontend can eventually communicate with Salesforce data through Apex and SOQL.
