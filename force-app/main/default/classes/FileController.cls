public with sharing class FileController {
    
    public static List<String> getFileNames(Account acc) {
        List<String> fileNames = new List<String>();
        
        // Query ContentDocumentLinks associated with the Account
        List<ContentDocumentLink> documentLinks = [SELECT ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = :acc.Id];
        
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
        }
        
        return fileNames;
    }
    
}