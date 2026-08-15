import { LightningElement, api } from 'lwc';

export default class JobCard extends LightningElement {

    @api job;

    isSubmitting = false;

    get buttonLabel() {
        return this.isSubmitting ? 'Submitting...' : 'Apply';
    }

    handleApply() {

        if (this.isSubmitting) {
            return;
        }

        this.isSubmitting = true;

        const event = new CustomEvent('apply', {
            detail: {
                jobId: this.job.Id
            }
        });

        this.dispatchEvent(event);
    }
    handleViewDetails() {
        const event = new CustomEvent('viewdetails', {
            detail: {
                jobId: this.job.Id
            }
        });

        this.dispatchEvent(event);
    }

    @api
    resetButton() {
        this.isSubmitting = false;
    }
}