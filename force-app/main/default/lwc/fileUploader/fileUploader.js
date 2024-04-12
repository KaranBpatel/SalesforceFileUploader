import { LightningElement,api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class FileUploader extends NavigationMixin(LightningElement) {

     myRecordId='0015h00001ezA2SAAU';

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