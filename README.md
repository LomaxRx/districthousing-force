# District Housing / Salesforce Integration
React form app + Visualforce page

### [Demo](https://lomaxrx.github.io/districthousing-force/)

Integration between [District Housing App](https://github.com/codefordc/districthousing) and [Bread for the City's](http://breadforthecity.org) Salesforce instance.

1. From the a Social Services Case record in Salesforce, a staff member clicks a button for `MegaApp` and is redirected to the form
2. Existing client data is queried and converted to a DistrictHousing-compatible model which populates the form
3. From the form, a staff member selects the buildings the client is applying to and edits or adds client information to form
4. This data is used to update client records in Salesforce and create a new Application record for each building
5. The data is sent to DistrictHousing endpoint which returns, for each building, a list of objects that include the url of the filled in PDF, the building id, and the building name
6. Social service staff is shown links to all PDFs to preview or download and prompted to upload all PDFs to Box. If it doesn't look right, they can change the data and re-submit.
7. PDFs are downloaded from the urls and uploaded to the Box folder associated with the Social Services Case record

## Maintaining

### Adding Field Mapping
You might at some point add data to your Salesforce objects and need to map it to this housing application integration.

- In [HousingApplication.cls](https://github.com/LomaxRx/districthousing-force/blob/master/src/classes/HousingApplication.cls) find the `Form` class near the bottom of the code
- find the SOQL query for the Salesforce object you want to add data from. For example, if you're adding data form the Household Member object, the block looks like:
```java
private void mapHouseholdMember(Id clientId){
  client.household_members = [
    SELECT Id, Name, DOB__c, Relationship__c
    FROM Household_Members__c
    WHERE Client__c=:clientId
  ];
  ...
}
```
- Add the new field to the query. For example, if you added a Social Security number field, the `SELECT` statement should look like `SELECT Id, Name, DOB__c, Relationship__c, SSN__c`
- Then, inside the forloop block, set the field value to the query result
```java
for(Household_Members__c client_household_member :client.household_members){
  HouseholdMember member = new HouseholdMember();
  member.member.ssn = client_household_member.SSN__c;
  ...
}
```
