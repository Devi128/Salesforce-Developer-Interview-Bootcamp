public class JobDeadlineScheduler implements Schedulable {

    public void execute(SchedulableContext context) {

        List<Job__c> jobs = [
            SELECT Id, Name, Last_Date__c
            FROM Job__c
            WHERE Last_Date__c < :Date.today()
        ];

        for (Job__c job : jobs) {
            System.debug(
                'Expired Job: ' +
                job.Name +
                ' | Deadline: ' +
                job.Last_Date__c
            );
        }

        System.debug('Expired job processing completed.');
    }
}