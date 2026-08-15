public with sharing class StudentController {

    @AuraEnabled(cacheable=true)
    public static List<Student__c> getStudents() {

        return [
            SELECT Id,
                   Name,
                   CGPA__c
            FROM Student__c
            ORDER BY Name
        ];
    }
    @AuraEnabled(cacheable=true)
public static List<Job__c> getEligibleJobs(Id studentId) {

    return PlacementDataService.getEligibleJobs(studentId);
}
@AuraEnabled
public static Application__c applyForJob(Id studentId, Id jobId) {
    return PlacementDataService.createApplication(studentId, jobId);
}
@AuraEnabled(cacheable=true)
public static List<Application__c> getMyApplications(Id studentId) {
    return PlacementDataService.getMyApplications(studentId);
}
}