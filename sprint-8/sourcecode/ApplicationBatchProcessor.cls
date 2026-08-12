public class ApplicationBatchProcessor
    implements Database.Batchable<SObject> {

    public Database.QueryLocator start(
        Database.BatchableContext context
    ) {
        return Database.getQueryLocator([
            SELECT Id, Name, Status__c
            FROM Application__c
        ]);
    }

    public void execute(
        Database.BatchableContext context,
        List<Application__c> applications
    ) {
        for (Application__c app : applications) {
            System.debug(
                'Processing Application: ' +
                app.Name +
                ' | Status: ' +
                app.Status__c
            );
        }
    }

    public void finish(
        Database.BatchableContext context
    ) {
        System.debug('Batch processing completed.');
    }
}