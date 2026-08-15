public class CandidateSyncQueueable implements Queueable, Database.AllowsCallouts {

    private Id applicationId;

    public CandidateSyncQueueable(Id applicationId) {
        this.applicationId = applicationId;
    }

    public void execute(QueueableContext context) {

        Application__c application = [
            SELECT Id,
                   Integration_Status__c,
                   Integration_Error__c,
                   Last_Integration_Attempt__c,
                   Integration_Retry_Count__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        application.Integration_Status__c = 'Pending';
        application.Last_Integration_Attempt__c = Datetime.now();

        try {

            HttpRequest request = new HttpRequest();

            request.setEndpoint('callout:Recruitment_API/posts');
            request.setMethod('POST');
            request.setHeader('Content-Type', 'application/json');

            Map<String, Object> candidateData = new Map<String, Object>();

            candidateData.put('applicationId', applicationId);
            candidateData.put(
                'source',
                'Salesforce Placement Management'
            );

            request.setBody(JSON.serialize(candidateData));

            Http http = new Http();

            HttpResponse response = http.send(request);

            Integer statusCode = response.getStatusCode();

            System.debug('Status Code: ' + statusCode);
            System.debug('Response Body: ' + response.getBody());

            // Success
            if (statusCode == 200 || statusCode == 201) {

                application.Integration_Status__c = 'Success';
                application.Integration_Error__c = null;
                application.Integration_Retry_Count__c = 0;

            }
            // Any non-success response
            else {

                if (application.Integration_Retry_Count__c == null) {
                    application.Integration_Retry_Count__c = 0;
                }

                if (application.Integration_Retry_Count__c < 3) {

                    application.Integration_Retry_Count__c++;

                    application.Integration_Status__c = 'Retry Required';

                    application.Integration_Error__c =
                        'External API returned status: ' + statusCode;

                    System.enqueueJob(
                        new CandidateSyncQueueable(applicationId)
                    );                        

                } 
                else {

                    application.Integration_Status__c = 'Failed';

                    application.Integration_Error__c =
                        'Maximum retry attempts reached. Status: '
                        + statusCode;
                }
            }

        } catch (Exception e) {

            if (application.Integration_Retry_Count__c == null) {
                application.Integration_Retry_Count__c = 0;
            }

            if (application.Integration_Retry_Count__c < 3) {

                application.Integration_Retry_Count__c++;

                application.Integration_Status__c = 'Retry Required';

                application.Integration_Error__c =
                    e.getMessage();
                System.enqueueJob(
                    new CandidateSyncQueueable(applicationId)
                );

            } 
            else {

                application.Integration_Status__c = 'Failed';

                application.Integration_Error__c =
                    'Maximum retry attempts reached. '
                    + e.getMessage();
            }
        }

        update application;
    }
}