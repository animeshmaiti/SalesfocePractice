public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numberOfContacts, String lastName) {
        List<Contact> contactList = new List<Contact>();
        
        for (Integer i = 0; i < numberOfContacts; i++) {
            String firstName = 'Test ' + i;
            Contact newContact = new Contact(FirstName = firstName, LastName = lastName);
            contactList.add(newContact);
        }
        return contactList;
    }
}
