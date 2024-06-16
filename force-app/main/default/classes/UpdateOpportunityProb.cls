public with sharing class UpdateOpportunityProb implements Database.Batchable <SObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        System.debug('Batch Job Start');
        return Database.getQueryLocator([SELECT Id,Probabilty FROM Opportunity where isClosed = FALSE]);
    }

    public void execute(Database.BatchableContext bc,List<Opportunity> oppList){
        List<Opportunity> oppRec=new List<Opportunity>();
        for (Opportunity opp : oppList) {
            if (opp.StageName=='Qualification') {
                opp.Probability=20;
            }else if (opp.StageName=='Value Proposition') {
                opp.Probability=60;
            }
            else if (opp.StageName=='Preception Analysis') {
                opp.Probability=75;
            }
            else if (opp.StageName=='Negotiation/Review') {
                opp.Probability=95;
            }
            oppRec.add(opp);
            System.debug('Opportunity Id: '+opp.Id+' Opportunity Name: '+opp.Name+' Opportunity Stage: '+opp.StageName+' Opportunity Probability: '+opp.Probability);
        }
        update oppRec;
    }

    public void finish(Database.BatchableContext bc) {
        System.debug('Batch Job Complete');
    }
}