import { LightningElement, wire } from 'lwc';
import { refreshApex } from '@salesforce/apex';

import getEligibleJobs from '@salesforce/apex/StudentController.getEligibleJobs';
import applyForJob from '@salesforce/apex/StudentController.applyForJob';
export default class EligibleJobs extends LightningElement {

    studentId = 'a00dL00003bbD13QAE';

    jobs;
    error;
    isLoading = true;
    successMessage;
    errorMessage;
    wiredJobsResult;

@wire(getEligibleJobs, { studentId: '$studentId' })
wiredJobs(result) {

    this.wiredJobsResult = result;

    const { data, error } = result;

    if (data) {
        this.jobs = data;
        this.error = undefined;
        this.isLoading = false;
    }
    else if (error) {
        this.error = error;
        this.jobs = undefined;
        this.isLoading = false;

        console.error('Error loading jobs:', error);
    }
}

    async handleApply(event) {

        const jobId = event.detail.jobId;

        console.log('Student Id:', this.studentId);
        console.log('Job Id:', jobId);

        this.successMessage = undefined;
        this.errorMessage = undefined;

        try {

            const applicationId = await applyForJob({
                studentId: this.studentId,
                jobId: jobId
            });

            console.log(
                'Application submitted successfully:',
                applicationId
            );

            this.successMessage =
                'Application submitted successfully.';
                await refreshApex(this.wiredJobsResult);

        }
        catch (error) {

            console.error('Error applying for job:', error);

            if (error.body && error.body.message) {
                this.errorMessage = error.body.message;
            }
            else {
                this.errorMessage =
                    'Duplicate Application! Student has already applied for this job.';
            }

        }
        finally {

            const jobCard =
                [...this.template.querySelectorAll('c-job-card')]
                .find(card => card.job && card.job.Id === jobId);

            if (jobCard) {
                jobCard.resetButton();
            }
        }
        
    }
}