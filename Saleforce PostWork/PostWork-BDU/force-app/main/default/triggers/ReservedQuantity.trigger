trigger ReservedQuantity on QuoteLineItem (before update) {
    QuoteLineItem qli = new QuoteLineItem();
    
    for(QuoteLineItem item:Trigger.new){
        qli = item;
    }
    
    system.debug('Quantity on item ' + qli.Quantity);
    
    QuotationHelper qth = new QuotationHelper();
    qth.availableReservedQuantity(qli.Product2Id, (double)qli.Quantity);
}