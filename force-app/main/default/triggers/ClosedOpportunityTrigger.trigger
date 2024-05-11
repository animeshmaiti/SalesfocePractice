trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    List<Opportunity> craeteTaskList = new List<Opportunity>();
    for (Opportunity oppt : trigger.new) {
        if (oppt.StageName == 'Closed Won') {
            Task t = new Task();
            t.Subject = 'Follow Up Test Task';
            t.WhatId = oppt.Id;
            t.ActivityDate = Date.today().addDays(7);
            t.OwnerId = UserInfo.getUserId();
            craeteTaskList.add(t);
        }
    }
    insert craeteTaskList;
}