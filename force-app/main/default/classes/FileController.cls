public with sharing class FileController {
   // FileController.getFileNames('0015h00001ezA2SAAU');
    @AuraEnabled(cacheable=true)
    public static List<String> getFileNames(Id id) {
        List<String> fileNames = new List<String>();
        
        // Query ContentDocumentLinks associated with the Account
        List<ContentDocumentLink> documentLinks = [SELECT ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = :id];
        
        // Retrieve ContentDocumentIds
        Set<Id> contentDocumentIds = new Set<Id>();
        for(ContentDocumentLink link : documentLinks) {
            contentDocumentIds.add(link.ContentDocumentId);
        }
        
        // Query ContentDocuments to get file names
        List<ContentDocument> documents = [SELECT Title FROM ContentDocument WHERE Id IN :contentDocumentIds];
        
        // Extract file names
        for(ContentDocument doc : documents) {
            fileNames.add(doc.Title);
            System.debug('doc.Title: ' + doc.Title);
        }
        
        return fileNames;
    }



    @AuraEnabled(cacheable=true)
    public static List<ContentDocument> getAllFiles(recordId id) {
        List<String> fileNames = new List<String>();
        
        // Query ContentDocumentLinks associated with the Account
        List<ContentDocumentLink> documentLinks = [SELECT ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = :id];
        
        // Retrieve ContentDocumentIds
        Set<Id> contentDocumentIds = new Set<Id>();
        for(ContentDocumentLink link : documentLinks) {
            contentDocumentIds.add(link.ContentDocumentId);
        }
        
        // Query ContentDocuments to get file names
        List<ContentDocument> documents = [SELECT Title FROM ContentDocument WHERE Id IN :contentDocumentIds];
        
       
        return documents;
    }
    
}