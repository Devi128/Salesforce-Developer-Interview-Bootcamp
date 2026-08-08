public class ApplicationTriggerHandler {

    public static void beforeInsert(List<Application__c> newApplications) {

        Set<Id> studentIds = new Set<Id>();
        Set<Id> jobIds = new Set<Id>();

        // Collect Student and Job IDs
        for (Application__c app : newApplications) {
            if (app.Student__c != null && app.Job__c != null) {
                studentIds.add(app.Student__c);
                jobIds.add(app.Job__c);
            }
        }

        // Query Students
        Map<Id, Student__c> studentMap = new Map<Id, Student__c>([
            SELECT Id, CGPA__c
            FROM Student__c
            WHERE Id IN :studentIds
        ]);

        // Query Jobs
        Map<Id, Job__c> jobMap = new Map<Id, Job__c>([
            SELECT Id, Minimum_CGPA__c, Last_Date__c
            FROM Job__c
            WHERE Id IN :jobIds
        ]);

        // Query Existing Applications
        List<Application__c> existingApplications = [
            SELECT Student__c, Job__c
            FROM Application__c
            WHERE Student__c IN :studentIds
            AND Job__c IN :jobIds
        ];

        // Call Service Methods
        ApplicationService.setDefaultStatus(newApplications);

        ApplicationService.validateDuplicateApplications(
            newApplications,
            existingApplications
        );

        ApplicationService.validateCGPA(
            newApplications,
            studentMap,
            jobMap
        );

        ApplicationService.validateLastDate(
            newApplications,
            jobMap
        );
    }

    public static void afterUpdate(List<Application__c> updatedApplications) {

        Set<Id> studentIds = new Set<Id>();

        for (Application__c app : updatedApplications) {
            if (app.Status__c == 'Selected') {
                studentIds.add(app.Student__c);
            }
        }

        if (studentIds.isEmpty()) {
            return;
        }

        List<Student__c> students = [
            SELECT Id, Placed__c
            FROM Student__c
            WHERE Id IN :studentIds
        ];

        for (Student__c s : students) {
            s.Placed__c = true;
        }

        update students;
    }
}