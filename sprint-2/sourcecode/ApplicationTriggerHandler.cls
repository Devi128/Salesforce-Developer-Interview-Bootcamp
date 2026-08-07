public class ApplicationTriggerHandler {

    public static void beforeInsert(List<Application__c> newApplications) {

        Set<Id> studentIds = new Set<Id>();
        Set<Id> jobIds = new Set<Id>();

        for (Application__c app : newApplications) {

            if (app.Student__c != null && app.Job__c != null) {
                studentIds.add(app.Student__c);
                jobIds.add(app.Job__c);
            }
        }

        Map<Id, Student__c> studentMap = new Map<Id, Student__c>([
            SELECT Id, CGPA__c
            FROM Student__c
            WHERE Id IN :studentIds
        ]);

        Map<Id, Job__c> jobMap = new Map<Id, Job__c>([
            SELECT Id, Minimum_CGPA__c, Last_Date__c
            FROM Job__c
            WHERE Id IN :jobIds
        ]);

        List<Application__c> existingApplications = [
            SELECT Student__c, Job__c
            FROM Application__c
            WHERE Student__c IN :studentIds
            AND Job__c IN :jobIds
        ];

        Set<String> existingPairs = new Set<String>();

        for (Application__c app : existingApplications) {
            existingPairs.add(app.Student__c + '-' + app.Job__c);
        }

        for (Application__c app : newApplications) {

            String pair = app.Student__c + '-' + app.Job__c;

            // Duplicate prevention
            if (existingPairs.contains(pair)) {
                app.addError(
                    'Duplicate Application! Student has already applied for this job.'
                );
            }

            // CGPA validation
            Student__c stu = studentMap.get(app.Student__c);
            Job__c job = jobMap.get(app.Job__c);

            if (stu != null &&
                job != null &&
                stu.CGPA__c < job.Minimum_CGPA__c) {

                app.addError(
                    'Student CGPA is below the minimum CGPA required for this job.'
                );
            }

            // Last date validation
            if (job != null &&
                job.Last_Date__c != null &&
                Date.today() > job.Last_Date__c) {

                app.addError(
                    'Applications for this job are closed.'
                );
            }

            // Default status
            if (String.isBlank(app.Status__c)) {
                app.Status__c = 'Applied';
            }
        }
    }

    public static void afterUpdate(
        List<Application__c> updatedApplications
    ) {

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
