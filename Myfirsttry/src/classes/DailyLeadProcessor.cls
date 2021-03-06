global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext ctx){
        
        List<Lead> leads = new List<Lead>();
        
        for(Lead ld:[SELECT Id, LeadSource FROM Lead
                    WHERE LeadSource = ''
                    LIMIT 200]){
            ld.LeadSource = 'Dreamforce';
            leads.add(ld);
        }
        
        update leads;
    }

}