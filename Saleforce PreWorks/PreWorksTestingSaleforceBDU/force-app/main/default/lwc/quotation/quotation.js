import { LightningElement, track } from 'lwc';
import getPricebookEntry from '@salesforce/apex/QuotationHandler.getPricebookEntry';
export default class Quotation extends LightningElement {
    key;
    @track PricebookEntry;
    updateKey(event){
        this.key = event.target.value;
    }
    handleSearch(){
        getPricebookEntry({searchKey: this.key})
        .then(result =>{
            this.PricebookEntry = result;
        })
        .catch(error =>{
            this.PricebookEntry = null;
        })
    }
    cols = [
        {label: 'Product Name', fieldName: 'Product2.Name', type: 'text', hideDefaultActions: true},
        {label: 'List Price', fieldName: 'UnitPrice', type: 'currency', hideDefaultActions: true},
        {label: 'ExternalId', fieldName: 'ExternalId__c', type: 'text', hideDefaultActions: true},
        {label: 'Reserved', fieldName: 'Reserved__c', type: 'number', editable: "true", hideDefaultActions: true},
        {label: 'Quantity', fieldName: 'Quantity__c', type: 'number', hideDefaultActions: true}
    ]

}