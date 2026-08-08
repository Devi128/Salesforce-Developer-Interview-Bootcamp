# Chapter 6 – Challenges

## 1. Understanding Apex Triggers

At first, it was difficult to understand why a Trigger is needed when we can already write Apex classes and methods.

I learned that a Trigger is useful when a business action should happen automatically whenever a Salesforce event occurs.

---

## 2. Understanding Before and After Triggers

One challenge was understanding the difference between `before insert` and `after update`.

I learned that:

- `before insert` is useful for validation before a record is saved.
- `after update` is useful for actions that should happen after a record has been updated.

Understanding the business timing helped me understand the difference.

---

## 3. Keeping Business Logic Outside the Trigger

Another challenge was understanding why the Trigger should not contain all the business logic.

Initially, it was easy to put SOQL, DML, validation, and other logic directly inside the Trigger.

I learned to separate the responsibilities:

```text
Trigger
   ↓
Handler
   ↓
Service
   ↓
Business Logic
