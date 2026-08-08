import { LightningElement } from 'lwc';

export default class PlacementHome extends LightningElement {

    // Student Details
    studentName = 'DEVI';
    rollNumber = '23PA1A0540';
    department = 'CSE';

    // Welcome Message
    welcomeMessage = '';

    // Application Status
    status = 'Not Applied';

    // Placement Statistics
    todayDate = '07 August 2026';
    numberOfCompanies = 25;
    numberOfJobs = 63;
    applicationsSubmitted = 5;

    // Show Welcome Message
    showWelcome() {
        this.welcomeMessage = 'Welcome to Salesforce Development.';
    }

    // Change Application Status
    applyStatus() {
        this.status = 'Applied';
    }
}