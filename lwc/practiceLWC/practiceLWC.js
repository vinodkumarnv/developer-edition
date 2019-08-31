import { LightningElement, track, wire } from "lwc";
import getString from "@salesforce/apex/ParentTestController.getString";
import getStringByParam from "@salesforce/apex/ParentTestController.getStringByParam";

export default class PracticeLWC extends LightningElement {
  @track error;
  @track funcData;
  @track wiredToFuncData;
  @track wiredToPropData;

  handleLoad() {
    getStringByParam({ a: "parameter" })
      .then(result => {
        this.funcData = result;
      })
      .catch(error => {
        this.error = error;
      });
  }

  @wire(getString)
  wiredAcc({ error, data }) {
    if (data) {
      this.wiredToFuncData = data;
    } else if (error) {
      this.error = error;
    }
  }

  @wire(getStringByParam) wiredToPropData;
}
