public class ApplicationService {

    public static void setDefaultStatus(List<Application__c> newApplications) {

        for (Application__c app : newApplications) {

            if (String.isBlank(app.Status__c)) {
                app.Status__c = 'Applied';
            }

        }

    }
    public static void validateDuplicateApplications(
    List<Application__c> newApplications,
    List<Application__c> existingApplications
) {

    Set<String> existingPairs = new Set<String>();

    for (Application__c app : existingApplications) {
        existingPairs.add(app.Student__c + '-' + app.Job__c);
    }

    for (Application__c app : newApplications) {
        String pair = app.Student__c + '-' + app.Job__c;

        if (existingPairs.contains(pair)) {
            app.addError('Duplicate Application! Student has already applied for this job.');
        }
    }
}
public static void validateCGPA(
    List<Application__c> newApplications,
    Map<Id, Student__c> studentMap,
    Map<Id, Job__c> jobMap
) {

    for (Application__c app : newApplications) {

        Student__c stu = studentMap.get(app.Student__c);
        Job__c job = jobMap.get(app.Job__c);

        if (stu != null &&
            job != null &&
            stu.CGPA__c < job.Minimum_CGPA__c) {

            app.addError('Student CGPA is below the minimum CGPA required for this job.');
        }
    }
}
public static void validateLastDate(
    List<Application__c> newApplications,
    Map<Id, Job__c> jobMap
) {

    for (Application__c app : newApplications) {

        Job__c job = jobMap.get(app.Job__c);

        if (job != null &&
            job.Last_Date__c != null &&
            Date.today() > job.Last_Date__c) {

            app.addError('Applications for this job are closed.');
        }

    }

}

}
