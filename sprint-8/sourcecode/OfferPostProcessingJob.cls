public class OfferPostProcessingJob implements Queueable {

    private Id offerId;

    public OfferPostProcessingJob(Id offerId) {
        this.offerId = offerId;
    }

    public void execute(QueueableContext context) {

        Offer_Letter__c offer = [
            SELECT Id, Name
            FROM Offer_Letter__c
            WHERE Id = :offerId
            LIMIT 1
        ];

        System.debug('Post-offer processing started.');
        System.debug('Offer Letter: ' + offer.Name);
        System.debug('Offer Id: ' + offer.Id);
    }
}