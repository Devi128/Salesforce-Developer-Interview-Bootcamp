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

    // Retrieve Students through Data Service
    Map<Id, Student__c> studentMap =
        PlacementDataService.getStudents(studentIds);

    // Retrieve Jobs through Data Service
    Map<Id, Job__c> jobMap =
        PlacementDataService.getJobs(jobIds);

    // Retrieve Existing Applications through Data Service
    List<Application__c> existingApplications =
        PlacementDataService.getExistingApplications(
            studentIds,
            jobIds
        );

    // Business Logic
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

    public static void afterUpdate(
    List<Application__c> updatedApplications,
    Map<Id, Application__c> oldApplicationMap
) {

    Set<Id> studentIds = new Set<Id>();

    for (Application__c app : updatedApplications) {

        Application__c oldApp = oldApplicationMap.get(app.Id);

        // Run only when status changes to Selected
        if (
            app.Status__c == 'Selected' &&
            oldApp.Status__c != 'Selected' &&
            app.Student__c != null
        ) {
            studentIds.add(app.Student__c);

            // Queue candidate for external recruitment system
            System.enqueueJob(
                new CandidateSyncQueueable(app.Id)
            );
        }
    }

    if (studentIds.isEmpty()) {
        return;
    }

    NotificationService.notifySelectedStudents(updatedApplications);

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