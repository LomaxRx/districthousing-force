public class HousingApplication {
  public abstract class AbstractPerson {
    String first_name;
    String last_name;
    String middle_name;
    String ssn;
    Date dob;
    String gender;
    String work_phone;
    String home_phone;
    String cell_phone;
    String citizenship;
    String country_of_birth;
    String email;
    String race;
    String ethnicity;
    String student_status;
    String marital_status;
    String occupation;
    String mailing_address_id;
    String state_of_birth;
    String city_of_birth;
    String driver_license_number;
    String driver_license_state;
    String driver_license_exp_date;
  }
  public class Person extends AbstractPerson{}

  public class Income {
    Integer id;
    Integer amount;
    String interval;
    String income_type;
  }

  public class Address {
    Integer id;
    String street;
    String city;
    String state;
    String zip;
    String apt;
    Boolean residence;
  }

  public class Landlord extends AbstractPerson {
    Address address = new Address();
  }

  public class Residence {
    Integer id;
    Integer address_id;
		// actually just 'start' and 'end' in Housing app.
		// keywords in Apex.
    Date start_date;
    Date end_date;
    Integer rent;
    String reason;
    Boolean current;
    Landlord landlord = new Landlord();
  }

  public class HouseholdMember extends AbstractPerson {
    Integer id;
    String relationship;
  }

  public class Contact extends AbstractPerson {
    Integer id;
    String relationship;
    Address address = new Address();
  }

  public class Employment {
    Integer id;
    Date start_date;
    Date end_date;
    String employer_name;
    String supervisor_name;
    String position;
    String phone;
    Boolean current;
    Boolean part_time;
    Address address = new Address();
  }

  public class CriminalHistory {
    Integer id;
    String description;
    Integer year;
    String state;
    String crime_type;
  }

  public class Alias {
    Integer id;
    String name;
  }

  public class PreviousSSN {
		// Just 'number' in HAP App
		// reserved word in Apex.
    Integer id;
    String previous_number;
  }

  public class BuildingRequiredProofs{
    Boolean none;
    Boolean identification;
    Boolean bank_statement;
    Boolean birth_certificate;
    Boolean employment_history;
    Boolean citizenship;
    Boolean dc_residency;
    Boolean disability;
    Boolean income;
    Boolean rental_history;
    Boolean social_security_card;
    String other;

  }

  public class BuildingEligibility{
    Boolean income;
    Boolean disability;
    Boolean mobility_impairment;
    Boolean elderly;
    Decimal minimum_age_with_disability;
    Decimal minimum_age_without_disability;
    String rooms_available;
  }

  public class Building{
    Integer id;
    Id salesforceId;
    String name;
    String company_name;
    String address;
    Decimal longitude;
    Decimal latitude;
    String application_info;
    Boolean application_on_file;
    Boolean application_fee;
    String bedrooms_offered;
    String bedrooms_open;
    String building_phone;
    String company_phone;
    String utilities_included;
    String wait_length;
    Boolean waitlist_open;
    String waitlist_closed_until;
    String pets_allowed;
    String bus_routes;
    String notes;
    String application_url;
    Date last_applied;

    BuildingRequiredProofs required_proofs = new BuildingRequiredProofs();
    BuildingEligibility eligibility = new BuildingEligibility();

  }

  public class Model {
    /**
      Convenience class for getting JSON version of entire app model
    **/
    Person Person = new Person();
    Income Income = new Income();
    Address Address = new Address();
    Residence Residence = new Residence();
    HouseholdMember HouseholdMember = new HouseholdMember();
    Employment Employment = new Employment();
    CriminalHistory CriminalHistory = new CriminalHistory();
    Contact Contact = new Contact();
    Alias Alias = new Alias();
    PreviousSSN PreviousSSN = new PreviousSSN();
    String HousingForm = '';

    public Model(){}

    public String toJSON(){
      return JSON.serialize(this);
    }
  }

  public class ClientEligibility {
    Boolean mobility_impairment;
    Boolean disability;
    Decimal age;
    String rooms_requested;
  }

  public class ClientData {
    public Client__c clientRecord;
    public Income_and_Benefits__c[] incomes;
    public Household_Members__c[] household_members;
    public Address__c[] addresses;
    public Case__c hapCase;
    public ClientEligibility eligibility;
  }


  public class FormData {
    Person person = new Person();
    Income[] incomes = new List<Income>();
    Address[] addresses = new List<Address>();
    Residence[] residences = new List<Residence>();
    HouseholdMember[] household_members = new List<HouseholdMember>();
    Employment[] employments = new List<Employment>();
    CriminalHistory[] criminal_histories = new List<CriminalHistory>();
    Contact[] contacts = new List<Contact>();
    Alias[] aliases = new List<Alias>();
    PreviousSSN[] previous_ssns = new List<PreviousSSN>();
    String[] housing_forms = new List<String>();
  }

  public class PDFResult {
    public Blob pdf;
    public String status;
    public String building;
  }

  public class Form {
    public String endpoint;
    public FormData data;
    public ClientData client;
    public Case__c hapCase;

    public Form(Id clientId, Id hapCaseId){
      data = new FormData();
      client = new ClientData();

      hapCase = [
       SELECT Id, Name, Wheelchair__c, Disability__c, Age__c, Bedrooms_Needed__c, Application_Data__c
       FROM Case__c WHERE Id=:hapCaseId LIMIT 1
      ];

      Client__c[] clients = [
        SELECT Id, Name, First_Name__c, Last_Name__c, Middle_Name__c, Alternate_Name__c, Email_Address__c,
        Alternate_Phone__c, Alternate_Phone_Type__c, Primary_Phone__c, Primary_Phone_Type__c,
        City_of_Birth__c, State_of_Birth__c, Country_of_Birth__c, DOB__c, Drivers_License_Number__c,
        Drivers_License_State__c, Ethnicity__c, Gender__c, Hispanic__c, Marital_Status__c,
        Student_Status__c, Race__c, SSN__c, Occupation__c
        FROM Client__c
        WHERE id=:clientId
      ];

      if(clients.size()>0){
        client.clientRecord = clients[0];
        client.eligibility = new ClientEligibility();
        client.eligibility.mobility_impairment = hapCase.Wheelchair__c;
        client.eligibility.disability = hapCase.Disability__c;
        client.eligibility.rooms_requested = hapCase.Bedrooms_Needed__c;
        client.eligibility.age = hapCase.Age__c;
        mapPerson(clients[0]);
        mapIncome(clientId);
        mapAddress(clientId);
        mapHouseholdMember(clientId);
      }
    }

    private void mapPerson(Client__c c){
      data.person.first_name = c.First_Name__c;
      data.person.middle_name = c.Middle_Name__c;
      data.person.last_name = c.Last_Name__c;
      data.person.ssn = c.SSN__c;
      data.person.dob = c.DOB__c;
      data.person.gender = c.Gender__c;

      if(c.Alternate_Phone_Type__c=='Mobile')
        data.person.cell_phone = c.Alternate_Phone__c;
      else if(c.Alternate_Phone_Type__c=='Home')
        data.person.home_phone = c.Alternate_Phone__c;
      else if(c.Alternate_Phone_Type__c=='Work')
        data.person.work_phone = c.Alternate_Phone__c;

      if(c.Primary_Phone_Type__c=='Mobile')
        data.person.cell_phone = c.Primary_Phone__c;
      else if(c.Primary_Phone_Type__c=='Home')
        data.person.home_phone = c.Primary_Phone__c;
      else if(c.Primary_Phone_Type__c=='Work')
        data.person.work_phone = c.Primary_Phone__c;
      else
        data.person.home_phone = c.Primary_Phone__c;

      data.person.email = c.Email_Address__c;
      data.person.race = c.Race__c;
      data.person.ethnicity = c.Ethnicity__c;
      data.person.student_status = c.Student_Status__c;
      data.person.marital_status = c.Marital_Status__c;
      data.person.driver_license_number = c.Drivers_License_Number__c;
      data.person.driver_license_state = c.Drivers_License_State__c;
      data.person.occupation = c.Occupation__c;

    }

    private void mapIncome(Id clientId){
      client.incomes = [
        SELECT Id, RecordType.Name, Amount__c, Type__c
        FROM Income_and_Benefits__c
        WHERE Client__c=:clientId AND RecordType.Name='Income' AND Current__c=TRUE
      ];

      Integer i = 0;
      for(Income_and_Benefits__c client_income :client.incomes){
        Income inc = new Income();
        inc.id = i;
        inc.amount = client_income.Amount__c.intValue();
        inc.income_type = client_income.Type__c;
        inc.interval = 'monthly';
        data.incomes.add(inc);
        i+=1;
      }
    }

    private void mapAddress(Id clientId){
      client.addresses = [
        SELECT Id, Name, Address_2__c, City__c, State__c, Zip_Code__c,
        Landlord_Name__c, Landlord_Cell_Phone__c, Landlord_Home_Phone__c, Landlord_Work_Phone__c,
        Current_Address__c, Start_Date__c, End_Date__c, Address_Type__c
        FROM Address__c
        WHERE Client__c=:clientId
      ];

      Integer i = 0;
      for(Address__c client_address :client.addresses){
        Address a = new Address();
        a.id = i;
        a.street = client_address.Name;
        if(client_address.Address_2__c!=''&&client_address.Address_2__c!=null)
          a.street += ' ' + client_address.Address_2__c;
        a.city = client_address.City__c;
        a.state = client_address.State__c;
        a.zip = client_address.Zip_Code__c;
        if(
          (client_address.Landlord_Name__c!=null&&client_address.Landlord_Name__c!='')||
          client_address.Start_Date__c!=null||client_address.End_Date__c!=null
        ){
          a.residence = TRUE;
          Residence r = new Residence();
          r.id = a.id;
          r.address_id = a.Id;
          r.start_date = client_address.Start_Date__c;
          r.end_date = client_address.End_Date__c;
          r.landlord.first_name = client_address.Landlord_Name__c;
          r.landlord.cell_phone = client_address.Landlord_Cell_Phone__c;
          r.landlord.home_phone = client_address.Landlord_Home_Phone__c;
          r.landlord.work_phone = client_address.Landlord_Work_Phone__c;
          data.residences.add(r);
        }

        data.addresses.add(a);
        i+=1;
      }
    }

    private void mapHouseholdMember(Id clientId){
      client.household_members = [
        SELECT Id, Name, DOB__c, Relationship__c
        FROM Household_Members__c
        WHERE Client__c=:clientId
      ];

      Integer i = 0;
      for(Household_Members__c client_household_member :client.household_members){
        HouseholdMember member = new HouseholdMember();
        member.id = i;
        String[] names = client_household_member.Name.split(' ', 2);
        member.first_name = names[0];
        if(names.size()>1) member.last_name = names[1];
        member.dob = client_household_member.DOB__c;
        member.relationship = client_household_member.Relationship__c;
        data.household_members.add(member);
        i+=1;
      }
    }

    public String toJSON(){
      return JSON.serialize(data);
    }

    public PDFResult fetchPDFs(String formData){
      Http h = new Http();
      HttpRequest req = new HttpRequest();
      req.setEndpoint('https://pozon059e5.execute-api.us-west-2.amazonaws.com/districthousing/applicant');
      req.setMethod('POST');
      req.setHeader('Accept', 'application/json');
      req.setHeader('Content-Type', 'application/json');
      req.setBody(formData);
      req.setTimeout(60000);

      HttpResponse res = h.send(req);
      Map<String,Object> response = (Map<String,Object>)System.JSON.deserializeUntyped(res.getBody());

      PDFResult result = new PDFResult();
      result.building = (String)response.get('building');
      if((String)response.get('status') == 'OK'){
        result.pdf = EncodingUtil.base64Decode((String)response.get('pdf'));
        result.status = 'OK';
      } else {
        result.status = (String)response.get('errorMessage');
        System.debug(result.status);
      }

      return result;
    }
  }

  public class BoxPDFUploader {
    public box.Toolkit boxToolkit;
    public String folderId;

    public BoxPDFUploader(){
      boxToolkit = new box.Toolkit();
    }

    public String createOrGetFolder(Id recordId){
      folderId = boxToolkit.createFolderForRecordId(recordId, null, true);
      return folderId;
    }

    public Attachment[] createAttachments(HousingApplication.PDFResult[] pdfResults, Id hapCaseId){
      Attachment[] attachments = new List<Attachment>();
  		for(HousingApplication.PDFResult r : pdfResults){
  			Attachment a = new Attachment();
  			a.Body = r.pdf;
  			a.Name = System.now().format('yyyy-MM-dd HH:mm') + '__' + r.building + '.pdf';
  			a.ParentId = hapCaseId;
  			attachments.add(a);
  		}

      return attachments;
  	}

    public String[] uploadAttachments(Attachment[] attachments){
      String[] fileIds = new List<String>();
      for(Attachment a : attachments){
        system.debug(a);
        String fileId = boxToolkit.createFileFromAttachment(a, null, null, null);
        system.debug(fileId);
        fileIds.add(fileId);
      }
      return fileIds;
    }

    public void commitChanges(){
      boxToolkit.commitChanges();
    }

  }

  public static Building[] getBuildingData(Id clientId){
    Application__c[] pastApplications = [
      SELECT Id, Building_Name__r.Id, Date_Completed__c
      FROM Application__c
      WHERE Social_Services_Case__r.Client__c=:clientId
      ORDER BY Date_Completed__c ASC
    ];

    Building_Detail__c[] building_details = [
      SELECT Id, Name, App_Fee__c, Application_Info__c, Application_URL__c, Application_On_File__c, Building__r.Name,
      Bank_Statement__c, Bedrooms_Offered__C, BedroomsOpen__c, Birth_Certificate__c,
      Building_Address__c, Building__c, Building_Name__c, Building_Phone__c, Bus__c,
      Company_Phone__c, Disability_Required__c, Elderly__c, Employment_History__c, General_Notes__c,
      GeoLocation__longitude__s, GeoLocation__latitude__s, Income_Required__c, Minimum_Age_with_Disability__c, Minimum_Age_Without_Disability__c,
      No_Proofs__c, Pets__c, Proof_of_Citizenship__c, Proof_of_DC_Residency__c, Proof_of_Disability__c, Proof_of_Income__c,
      Rental_History__c, Require_Id__c, Require_Other__c, Social_Security_Card__c, Utilities__c,
      Wait_Length__c, Waitlist_Closed_Until__c, Waitlist_Open__c, Ward__c, Mobility_Impairment_Required__c
      FROM Building_Detail__c WHERE Application_URL__c != null
      ORDER BY Name
    ];

    Building[] buildings = new List<Building>();
    Integer i = 0;
    for(Building_Detail__c d : building_details){
      Building b = new Building();

      b.id = i;
      b.salesforceId = d.Id;
      b.name = d.Name;
      b.company_name = d.Building__r.Name;
      b.application_fee = d.App_Fee__c;
      b.application_info = d.Application_Info__c;
      b.application_on_file = d.Application_On_File__c;
      b.bedrooms_offered = d.Bedrooms_Offered__c;
      b.bedrooms_open = d.BedroomsOpen__c;
      b.address = d.Building_Address__c;
      b.building_phone = d.Building_Phone__c;
      b.company_phone = d.Company_phone__c;
      b.bus_routes = d.Bus__c;
      b.longitude = d.GeoLocation__longitude__s;
      b.latitude = d.GeoLocation__latitude__s;
      b.pets_allowed = d.Pets__c;
      b.utilities_included = d.Utilities__c;
      b.wait_length = d.Wait_Length__c;
      b.waitlist_closed_until = d.Waitlist_Closed_Until__c;
      b.waitlist_open = d.Waitlist_Open__c;
      b.notes = d.General_Notes__c;
      b.application_url = d.Application_URL__c;
      for(Application__c a :pastApplications){
        if(a.Building_Name__r.Id==d.Id) b.last_applied = a.Date_Completed__c;
      }

      b.eligibility.mobility_impairment = d.Mobility_Impairment_Required__c;
      b.eligibility.disability = d.Disability_Required__c;
      b.eligibility.elderly = d.Elderly__c;
      b.eligibility.income = d.Income_Required__c;
      b.eligibility.minimum_age_with_disability = d.Minimum_Age_with_Disability__c;
      b.eligibility.minimum_age_without_disability = d.Minimum_Age_Without_Disability__c;
      b.eligibility.rooms_available = d.BedroomsOpen__c;

      b.required_proofs.none = d.No_Proofs__c;
      b.required_proofs.birth_certificate = d.Birth_Certificate__c;
      b.required_proofs.employment_history = d.Employment_History__c;
      b.required_proofs.citizenship = d.Proof_of_Citizenship__c;
      b.required_proofs.dc_residency = d.Proof_of_DC_Residency__c;
      b.required_proofs.disability = d.Proof_of_Disability__c;
      b.required_proofs.income = d.Proof_of_Income__c;
      b.required_proofs.rental_history = d.Rental_History__c;
      b.required_proofs.identification = d.Require_Id__c;
      b.required_proofs.social_security_card = d.Social_Security_Card__c;
      b.required_proofs.other = d.Require_Other__c;

      buildings.add(b);
      i+=1;
    }
    return buildings;
  }
}
