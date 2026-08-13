import { LightningElement, wire, api } from 'lwc';
import { refreshApex } from '@salesforce/apex';

import getMyApplications
    from '@salesforce/apex/StudentController.getMyApplications';

export default class MyApplications extends LightningElement {

    studentId = 'a00dL00003bbD13QAE';

    applications;
    error;
    isLoading = true;
    wiredApplicationsResult;

    @wire(getMyApplications, { studentId: '$studentId' })
    wiredApplications(result) {

        this.wiredApplicationsResult = result;

        const { data, error } = result;

        if (data) {
            this.applications = data;
            this.error = undefined;
            this.isLoading = false;

            console.log('Applications:', data);
        }
        else if (error) {
            this.error = error;
            this.applications = undefined;
            this.isLoading = false;

            console.error('Error loading applications:', error);
        }
    }

    @api
    async refreshApplications() {
        await refreshApex(this.wiredApplicationsResult);
    }
}