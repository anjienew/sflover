trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
    List<Task> actList= new List<Task>();
    
    for (Opportunity a:[SELECT Id,StageName FROM Opportunity
                       WHERE Id IN :Trigger.New AND
                       StageName = 'Closed Won']){
                 actList.add(New Task(Subject='Follow Up Test Task',
                                          WhatId=a.Id));
                      }
    if(actList.size()>0) 
    insert actList;

}