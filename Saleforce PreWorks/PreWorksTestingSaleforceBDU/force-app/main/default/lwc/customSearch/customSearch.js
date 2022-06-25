import { LightningElement, track } from 'lwc';
import getAccounts from '@salesforce/apex/accountController.getAccounts';
export default class CustomSearch extends LightningElement {
    key;
    @track accounts;
    updateKey(event){
        this.key = event.target.value;
    }
    handleSearch(){
        getAccounts({searchKey: this.key})
        .then(result =>{
            this.accounts = result;
        })
        .catch(error =>{
            this.accounts = null;
        })
    }
    cols = [
        {label: 'Account Name', fieldName: 'Name', type: 'text'},
        {label: 'Phone', fieldName: 'Phone', type: 'Phone'},
        {label: 'Industry', fieldName: 'Industry', type: 'text'},
        {label: 'Website', fieldName: 'Website', type: 'website'}
    ]

}