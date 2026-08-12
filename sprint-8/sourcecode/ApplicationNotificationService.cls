public class ApplicationNotificationService {

    @future
    public static void processApplication(Id applicationId) {

        Application__c application = [
            SELECT Id, Name, Status__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        System.debug('Future Method executed.');
        System.debug('Application: ' + application.Name);
        System.debug('Status: ' + application.Status__c);
    }
}