# District Housing / Salesforce Integration
React form app + Visualforce page

> Integration between [District Housing App](https://github.com/codefordc/districthousing) and [Bread for the City's](http://breadforthecity.org) Salesforce instance.

#### [Demo](https://lomaxrx.github.io/districthousing-force/)


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
