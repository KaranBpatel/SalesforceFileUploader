import { LightningElement,api, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getUploadedFiles from '@salesforce/apex/FileController.getFiles';

export default class FileUploader extends NavigationMixin(LightningElement) {

    @api
    recordId
     myRecordId='0015h00001ezA2SAAU';
     allFilesWireData
     allFiles


     @wire(getUploadedFiles,{recoardId : recordId})
     getAllFiles(value){
        this.allFilesWireData = value
        if (value.data) {
            this.allFiles = value.data
        }else if(value.err){
            console.log('error',value.err);
        }
     }

    get acceptedFormats() {
        return ['.pdf', '.png'];
    }
    handleUploadFinished(ev){
        const file= ev.detail.files;
        console.log('Files >7>',file.length);
    }


    // file preview
    navigateToFiles(ContentDocumentId) {
        this[NavigationMixin.Navigate]({
          type: 'standard__namedPage',
          attributes: {
              pageName: 'filePreview'
          },
          state : {
              selectedRecordId:ContentDocumentId
          }
        })
      }
}