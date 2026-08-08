# Day 4 – Reflection

## What I Learned

Today I learned the basics of **Lightning Web Components (LWC)** and how Salesforce applications can have a proper user interface.

I learned that LWC is Salesforce's modern UI framework based on web technologies such as HTML, JavaScript, and CSS.

I also learned about the three main files of an LWC:

* `.html` – Used to create the user interface.
* `.js` – Used to write the component logic and handle events.
* `.js-meta.xml` – Used to configure and expose the component in Salesforce.

---

## What I Practiced

Today I created my first LWC named `placementHome`.

I practiced:

* Creating an LWC.
* Deploying an LWC to Salesforce.
* Adding the component to a Lightning Page.
* Creating JavaScript variables.
* Displaying variables in HTML.
* Using data binding.
* Handling button click events.
* Changing the application status dynamically.
* Creating a basic Placement Portal home page.

---

## What I Understood Better

Before Day 4, I mainly focused on the backend side of the Placement Management System.

Today I understood how the frontend fits into the overall Salesforce architecture.

The basic flow is:

```text
User
  ↓
LWC
  ↓
Apex
  ↓
SOQL / DML
  ↓
Salesforce Database
```

I understood that LWC is mainly responsible for the user interface and user interactions, while Apex handles server-side logic and Salesforce data operations.

---

## Challenges I Faced

The main difficulties I faced were understanding:

* The purpose of each LWC file.
* Data binding between JavaScript and HTML.
* How button click events work.
* How to change component values dynamically.
* The purpose of the Meta XML file.
* The difference between LWC responsibilities and Apex responsibilities.

By practicing each activity step by step, I was able to understand these concepts better.

---

## My Key Takeaway

My biggest takeaway from Day 4 is that building a Salesforce application is not only about backend development.

The user interface is an important part of the application because it allows users to interact with the system.

I also understood that LWC provides the frontend, Apex provides the server-side logic, and Salesforce provides the database.

---

## What I Need to Improve

I need more practice with:

* LWC syntax.
* JavaScript in LWC.
* Data binding.
* Event handling.
* Lightning Base Components.
* Connecting LWC with Apex.
* Retrieving real Salesforce data instead of using hard-coded values.

---

## Final Reflection

Day 4 was an important step because I moved from mainly working with the backend to building the frontend of the Placement Management System.

Creating my first LWC helped me understand how a Salesforce user interface is built and how different layers of the application work together.

I am now more comfortable with the basic structure of LWC and ready to learn how to connect the component with Apex and real Salesforce data in the upcoming days.
