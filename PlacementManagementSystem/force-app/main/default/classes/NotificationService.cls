public class NotificationService {

    public static void notifySelectedStudents(
        List<Application__c> applications
    ) {

        for (Application__c app : applications) {

            if (app.Status__c == 'Selected') {

                System.debug(
                    'Notification: Student selected for Application ' +
                    app.Id
                );
            }
        }
    }
}