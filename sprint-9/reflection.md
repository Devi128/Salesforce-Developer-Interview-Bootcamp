# Reflection – Sprint 09: Lightning Web Components

## What I Learned

In this sprint, I learned how to build an interactive user interface using Lightning Web Components.

I learned how the LWC connects the student interface with the existing Apex backend architecture.

## Understanding the Apply Workflow

I learned that a simple Apply button can involve multiple layers.

The complete flow is:

```text
Student
   ↓
Lightning Web Component
   ↓
Job Card
   ↓
Custom Event
   ↓
Apex Controller
   ↓
Service Layer
   ↓
Business Rules
   ↓
Salesforce Data
```

This helped me understand how frontend actions connect with backend business logic.

## Overall Reflection

- This sprint changed my understanding of LWC from simply creating a screen to designing a complete user interaction.

- I learned that a good LWC should have clear responsibilities, communicate properly with other components, reuse backend business logic, and provide clear feedback to the user.

- The main lesson I learned is that the UI should remain simple for the user while the complexity is handled properly by the architecture underneath it.
