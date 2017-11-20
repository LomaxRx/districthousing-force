# District Housing / Salesforce Integration
React form app + Visualforce page

### [Demo](https://lomaxrx.github.io/districthousing-force/)

Integration between [District Housing App](https://github.com/codefordc/districthousing) and [Bread for the City's](http://breadforthecity.org) Salesforce instance.

1. From the a Social Services Case record in Salesforce, a staff member clicks a button for `MegaApp` and is redirected to the form
2. Existing client data is queried and converted to a DistrictHousing-compatible model which populates the form
3. From the form, a staff member selects the buildings the client is applying to and edits or adds client information to form
4. After updating information, staff clicks [Submit] which sends the data to a [DistrictHousing endpoint](https://github.com/LomaxRx/districthousing-lambda) for each building.
5. Filled pdfs are saved to the Social Services Case as an attachment

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
  member.ssn = client_household_member.SSN__c;
  ...
}
```

### Reference

#### [HousingApplication](https://github.com/LomaxRx/districthousing-force/blob/master/src/classes/HousingApplication.cls)
Defines a data model for an housing application that replicates Code for DC's [District Housing schema](https://github.com/codefordc/districthousing/blob/master/db/schema.rb) as Apex Classes. This allows us to easily turn Salesforce Objects into JSON-serializable classes with the same fieldnames as the District Housing database. This also allows us to more easily [define an initial state](https://github.com/LomaxRx/districthousing-force/blob/master/src/classes/HousingApplicationController.cls#L36-L40) that we can [pass to the React/Redux form](https://github.com/LomaxRx/districthousing-force/blob/master/src/pages/housing_application.page#L40) as JSON.

#### [HousingApplication#Form](https://github.com/LomaxRx/districthousing-force/blob/master/src/classes/HousingApplication.cls#L224)
Maps SOQL queries for a client's demographics, address, household members, and incomes to the District Housing model.

#### [Form#fetchPDFs(*JSONString*<form_data>)](https://github.com/LomaxRx/districthousing-force/blob/master/src/classes/HousingApplication.cls#L383)
Maps SOQL queries for a client's demographics, address, household members, and incomes to the District Housing model.

#### [React HapForm](https://github.com/LomaxRx/districthousing-force/tree/master/js/src)

Pretty straight forward React/Redux app built with [React Redux Form](https://github.com/davidkpiano/react-redux-form) and a few quirks to integrate with a VisualForce page.

[`apex-actions`](https://github.com/LomaxRx/districthousing-force/blob/master/js/src/index.js#L10) is a globally defined object that allows us to hook [VisualForce actionFunctions](https://developer.salesforce.com/docs/atlas.en-us.pages.meta/pages/pages_compref_actionFunction.htm) into our React app as sort of makeshift AJAX requests. We [set the actionFunctions on our VisualForce page](https://github.com/LomaxRx/districthousing-force/blob/master/src/pages/housing_application.page#L37-L38) then also [set the request's callback (`hapForm.setStatus(READY|READY_TO_FETCH|ERROR|COMPLETE)`) as a rerendered panel](https://github.com/LomaxRx/districthousing-force/blob/master/src/pages/housing_application.page#L44-L48).
