List<Application__c> applications = [
    SELECT Id, Student__c, Job__c, Status__c
    FROM Application__c
    LIMIT 200
];

Set<Id> studentIds = new Set<Id>();

for (Application__c app : applications) {
    if (app.Student__c != null) {
        studentIds.add(app.Student__c);
    }
}

Map<Id, Student__c> studentsById = new Map<Id, Student__c>([
    SELECT Id, Name, CGPA__c
    FROM Student__c
    WHERE Id IN :studentIds
]);

List<Application__c> applicationsToUpdate =
    new List<Application__c>();

for (Application__c app : applications) {

    Student__c student = studentsById.get(app.Student__c);

    if (student != null) {

        System.debug(
            'Processing: ' +
            student.Name +
            ' | CGPA: ' +
            student.CGPA__c
        );

        applicationsToUpdate.add(app);
    }
}

if (!applicationsToUpdate.isEmpty()) {
    update applicationsToUpdate;
}

System.debug('Applications to update: ' +
             applicationsToUpdate.size());

System.debug('Bulk update completed.');