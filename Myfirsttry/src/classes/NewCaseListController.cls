public class NewCaseListController {
    
    public List<Case> getNewCases(){
        
        List<Case> caseList = [SELECT Id,CaseNumber,Status FROM Case WHERE Status = 'New'];
                                             
        return caseList;
    }
}