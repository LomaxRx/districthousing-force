@isTest
private class HousingApplicationTest {

	@testSetup static void setup(){
		Client__c client = new Client__c(
			Name='Testy Test', First_Name__c='Testy', Last_Name__c='Test',
			DOB__c=Date.today(), Emergency_Contact_Name__c='Fake Emergency Contact Name'
		);

		insert client;

		Address__c address = new Address__c(
			client__c=client.Id, Name='Fake Address', Landlord_Name__c='Fake Landlord'
		);
		Household_Members__c member = new Household_Members__c(
			client__c=client.Id
		);
		Income_and_Benefits__c income = new Income_and_Benefits__c(
			Amount__c=600.89, client__c=client.Id
		);
		Case__c hapCase = new Case__c(
			client__c=client.Id, RecordTypeId=Schema.SObjectType.Case__c.getRecordTypeInfosByName().get('HAP').getRecordTypeId(),
			Reference_Contact_Name__c='Fake Reference Contact name', Crime_Type__c='Jay walking', Employment_Position__c='CEO'
		);

		insert address; insert member; insert income; insert hapCase;

		Account building = new Account(name='Fake Building');
		insert building;

		Building_Detail__c detail = new Building_Detail__c(
			Building__c=building.Id, Application_URL__c='http://www.fake.org/'
		);
		insert detail;
	}

	@isTest static void int_housing_application_controller(){
		Client__c client = [SELECT Id FROM Client__c Limit 1];
		Case__c hapCase = [SELECT Id FROM Case__c Limit 1];
		Building_Detail__c building = [SELECT Id FROM Building_Detail__c LIMIT 1];
		Test.setCurrentPageReference(new PageReference('Page.housing_application'));
		ApexPages.currentPage().getParameters().put('clientId',client.Id);
		ApexPages.currentPage().getParameters().put('hapCaseId',hapCase.Id);
		HousingApplicationController hapController = new HousingApplicationController();
	}

	@isTest static void housing_application_fetch_pdfs(){
		Client__c client = [SELECT Id FROM Client__c Limit 1];
		Case__c hapCase = [SELECT Id FROM Case__c Limit 1];
		Building_Detail__c building = [SELECT Id FROM Building_Detail__c LIMIT 1];
		Test.setCurrentPageReference(new PageReference('Page.housing_application'));
		ApexPages.currentPage().getParameters().put('clientId',client.Id);
		ApexPages.currentPage().getParameters().put('hapCaseId',hapCase.Id);
		HousingApplicationController hapController = new HousingApplicationController();

		hapController.formData = '{ "dummy": "data"}';
		hapController.applicationData = '{"dummy": "data"}';
		hapController.buildingId = building.Id;
		Test.startTest();
		Test.setMock(HttpCalloutMock.class, new HousingApplicationCalloutMock('{"status": "OK", "building": "building name", "pdf": "DLKAGJLAJAKDVAGAWBGADLKJDSAGULDAXGJN"}'));
		hapController.fetchPDFs();
		Test.stopTest();

		Attachment a = [SELECT ParentId FROM Attachment LIMIT 1];
		system.assertEquals(a.ParentId, hapCase.Id);
	}

	@isTest static void housing_application_model(){
		HousingApplication.Model model = new HousingApplication.Model();
		String jsonString = model.toJSON();
	}


}
