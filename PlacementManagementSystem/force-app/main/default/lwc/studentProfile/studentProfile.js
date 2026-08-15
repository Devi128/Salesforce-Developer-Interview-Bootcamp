import { LightningElement } from 'lwc';

export default class StudentProfile extends LightningElement {
    studentId = 'a00dL00003bbD13QAE';

    successMessage;
    errorMessage;

    handleSuccess() {
        this.errorMessage = undefined;
        this.successMessage = 'Profile updated successfully.';
        this.dispatchEvent(new CustomEvent('profilesaved'));
        this.dispatchEvent(
            new CustomEvent('profilesaved')
        );
    }

    handleError(event) {
        this.successMessage = undefined;
        this.errorMessage = 'We could not update your profile. Please try again.';

        console.error('Error updating student profile:', event.detail);
    }
}