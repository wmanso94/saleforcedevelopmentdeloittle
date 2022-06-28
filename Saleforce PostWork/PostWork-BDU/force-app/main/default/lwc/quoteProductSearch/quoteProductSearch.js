import { LightningElement } from 'lwc';
import serachAccs from '@salesforce/apex/QuotationHelper.retriveAccs';

const columns = [
    {
        label: 'Product Name',
        fieldName: 'Product_Name__c',
        type: 'text',
        hideDefaultActions: true,
        cellAttributes:{alignment:'right'}
    }, {
        label: 'ExternalId',
        fieldName: 'ExternalId__c',
        type: 'text',
        hideDefaultActions: true,
        cellAttributes:{alignment:'right'}
    }, {
        label: 'List Price',
        fieldName: 'UnitPrice',
        type: 'currency',
        hideDefaultActions: true,
    }, {
        label: 'Quantity',
        fieldName: 'Quantity__c',
        type: 'number',
        hideDefaultActions: true,
        editable: true
    },
];

export default class QuoteProductSearch extends LightningElement {

    searchData;
    columns = columns;
    errorMsg = '';
    strSearchAccName = '';


    handleAccountName(event) {
        this.errorMsg = '';
        this.strSearchAccName = event.currentTarget.value;
    }

    handleSearch() {
        if(!this.strSearchAccName) {
            this.errorMsg = 'Please enter account name to search.';
            this.searchData = undefined;
            return;
        }

        serachAccs({strAccName : this.strSearchAccName})
        .then(result => {
            this.searchData = result;
        })
        .catch(error => {
            this.searchData = undefined;
            if(error) {
                if (Array.isArray(error.body)) {
                    this.errorMsg = error.body.map(e => e.message).join(', ');
                } else if (typeof error.body.message === 'string') {
                    this.errorMsg = error.body.message;
                }
            }
        })
    }
}