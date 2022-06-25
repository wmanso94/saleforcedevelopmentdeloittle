import { LightningElement, track } from 'lwc';
//import getContactList from '@salesforce/apex/customSearchsObjectsLWC.getContactList';
//import {ShowToastEvent} from 'lightning/platformToastEvent'

export default class TestPreWork extends LightningElement {
    @track contactRecord;
    searchValue = '';

    searchKeyword(event) {
        this.searchValue = event.target.value;
    }

    handleSearchKeyword() {

        if(this.searchValue !== '') {
            getContactList({
                searchKey: this.searchValue
            })
            .then(result => {
                this.contactRecord = result;
            })
            .catch(error => {
                const event = new ShowToastEvent({
                    title: 'Error',
                    variant: 'error',
                    message: error.body.message,
                });
                this.dispatchEvent(event);
                this.contactRecord = null;
            });
        }else{
            const event = new ShowToastEvent({
                variant: 'error',
                message: 'Search text missing...',
            });
            this.dispatchEvent(event);
        }
    }
}