import { LightningElement } from 'lwc';

import getHolidays from '@salesforce/apex/HolidayController.getHolidays';
import SystemModstamp from '@salesforce/schema/Account.SystemModstamp';

export default class Holiday extends LightningElement {
    
    holidays = [];
    isHoliday = false;
    daysUntil = 0;

    connectedCallback() {
        getHolidays()
        .then(result => {
            if (result) {
                this.holidays = result.holidays;
                this.isHoliday = result.isHoliday;
                this.daysUntil = result.daysUntil;
            }
        })
        .catch(error => {
            if (error) {
                console.log(error);
            }
        });
    }

}