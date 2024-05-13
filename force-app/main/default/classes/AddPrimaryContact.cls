public without sharing class AddPrimaryContact implements Queueable{

    private Contact contact;
    private String state;

    public AddPrimaryContact(Contact inputContact,String inputState) {
        this.contact=inputContact;
        this.state=inputState;
    }

    public void execute(QueueableContext context) {
        //Retrieve the 200 account record in the state
        List<Account> accounts = [SELECT Id FROM Account WHERE BillingState = :state LIMIT 200];
        
        //craete a empty list to Contatact records
        List<Contact> contacts = new List<Contact>();

        //Iterate over the account records
        for(Account acc : accounts){
            //Create a new contact record
            Contact contactClone = contact.clone();
            contactClone.AccountId = acc.Id;
            contacts.add(contactClone);
        }
        insert contacts;
    }
}