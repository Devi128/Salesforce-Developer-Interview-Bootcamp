public class PlacementDataService {

    public static Student__c getStudent(Id studentId) {

        Student__c student = [
            SELECT Id, Name, CGPA__c, Branch__c, Gradution_Year__c
            FROM Student__c
            WHERE Id = :studentId
            LIMIT 1
        ];

        return student;
    }


    public static Job__c getJob(Id jobId) {

        Job__c job = [
            SELECT Id, Name, Minimum_CGPA__c, Last_Date__c
            FROM Job__c
            WHERE Id = :jobId
            LIMIT 1
        ];

        return job;
    }


    public static List<Application__c> getExistingApplications(
        Id studentId,
        Id jobId
    ) {

        List<Application__c> applications = [
            SELECT Id, Name, Student__c, Job__c, Status__c
            FROM Application__c
            WHERE Student__c = :studentId
            AND Job__c = :jobId
        ];

        return applications;
    }


    public static Application__c createApplication(
        Id studentId,
        Id jobId
    ) {

        Application__c application = new Application__c();

        application.Student__c = studentId;
        application.Job__c = jobId;
        application.Status__c = 'Applied';

        insert application;

        return application;
    }


    public static Application__c updateApplicationStatus(
        Id applicationId,
        String newStatus
    ) {

        Application__c application = [
            SELECT Id, Status__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        application.Status__c = newStatus;

        update application;

        return application;
    }


    public static Map<Id, Student__c> getStudents(
        Set<Id> studentIds
    ) {

        return new Map<Id, Student__c>([
            SELECT Id, CGPA__c
            FROM Student__c
            WHERE Id IN :studentIds
        ]);
    }


    public static Map<Id, Job__c> getJobs(
        Set<Id> jobIds
    ) {

        return new Map<Id, Job__c>([
            SELECT Id, Minimum_CGPA__c, Last_Date__c
            FROM Job__c
            WHERE Id IN :jobIds
        ]);
    }

    public static List<Application__c> getExistingApplications(
        Set<Id> studentIds,
        Set<Id> jobIds
    ) {

        return [
            SELECT Student__c, Job__c
            FROM Application__c
            WHERE Student__c IN :studentIds
            AND Job__c IN :jobIds
        ];
    }

    public static List<Student__c> getStudentsForPlacement(
        Set<Id> studentIds
    ) {

        return [
            SELECT Id, Placed__c
            FROM Student__c
            WHERE Id IN :studentIds
        ];
    }

    public static void updateStudents(
        List<Student__c> students
    ) {

        update students;
    }
}
