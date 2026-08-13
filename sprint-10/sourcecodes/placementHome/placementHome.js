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

    // Handle Student Profile Saved Event
    handleProfileSaved() {
        console.log('Student profile was saved.');

        const eligibleJobs = this.template.querySelector('c-eligible-jobs');

        if (eligibleJobs) {
            eligibleJobs.refreshJobs();
        }
    }
handleApplicationSubmitted() {
    console.log('Application submitted. Refreshing My Applications.');

    const myApplications = this.refs.myApplications;

    if (myApplications) {
        myApplications.refreshApplications();
    }
}
}