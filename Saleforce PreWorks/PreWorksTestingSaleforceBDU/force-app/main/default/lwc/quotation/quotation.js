import { LightningElement, track } from 'lwc';
import getPricebookEntry from '@salesforce/apex/QuotationHandler.getPricebookEntry';
import Quote_OBJECT from '@salesforce/schema/Quote'
import getProducts from '@salesforce/apex/QuotationHandler.getProducts';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
export default class Quotation extends LightningElement {
    key;
    @track PricebookEntry;
    @track Product2;
    @track QuoteLineItem;

    updateKey(event){
        this.areDe
        this.key = event.target.value;
    }
    handleSearch(){
        if (this.key !== '') {
            getProducts({searchKey: this.key})
            .then(results =>{
                this.Product2 = results;
            })
            .catch(error =>{

                const event = new ShowToastEvent({
                    title: 'Error',
                    variant: 'error',
                    message: error.body.message,
                });
                this.dispatchEvent(event);
                // reset contacts var with null
                this.getProducts = null;
            });
        } else {
            // fire toast event if input field is blank
            const event = new ShowToastEvent({
                variant: 'error',
                message: 'Search text missing..',
            });
            this.dispatchEvent(event);
        }
        if (this.key !== '') {
            getPricebookEntry({searchKey: this.key})
            .then(result =>{
                this.PricebookEntry = result;
            })
            .catch(error =>{

                const event = new ShowToastEvent({
                    title: 'Error',
                    variant: 'error',
                    message: error.body.message,
                });
                this.dispatchEvent(event);
                // reset contacts var with null
                this.PricebookEntry = null;
            });
        } else {
            // fire toast event if input field is blank
            const event = new ShowToastEvent({
                variant: 'error',
                message: 'Search text missing..',
            });
            this.dispatchEvent(event);
        }
    }
    col1 = [
        {label: 'Product Name', fieldName: 'Name', type: 'text', hideDefaultActions: true, cellAttributes:{alignment:'right'}},
        {label: 'ExternalId', fieldName: 'ExternalId', type: 'text', hideDefaultActions: true, cellAttributes:{alignment:'right'}}
    ]
    col2 = [
        {label: 'List Price', fieldName: 'UnitPrice', type: 'currency', hideDefaultActions: true, typeAttributes: {currencyCode:'USD'}},
        {label: 'Quantity', fieldName: 'Quantity__c', type: 'number', hideDefaultActions: true},
        {label: 'Reserved', fieldName: 'Reserved__c', type: 'number', editable: 'true', hideDefaultActions: 'true'}
    ]

}