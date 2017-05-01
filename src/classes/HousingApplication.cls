public class HousingApplication {
  public class Person {
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
    String apt;
    Boolean residence;
  }

  public class Residence {
    Integer id;
    Integer address_id;
		// actually just 'start' and 'end' in Housing app.
		// keywords in Apex.
    Date start_date;
    Date end_date;
    String reason;
    Boolean current;
    Person landlord = new Person();
  }

  public class HouseholdMember {
    Integer id;
    Person member = new Person();
    String relationship;
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
    Alias Alias = new Alias();
    PreviousSSN PreviousSSN = new PreviousSSN();
    String HousingForm = '';

    public Model(){}

    public String toJSON(){
      return JSON.serialize(this);
    }
  }


  public class ClientData {
    public Client__c client;
    public Income_and_Benefits__c[] incomes;
    public Household_Members__c[] household_members;
    public Address__c[] addresses;
  }

  public class FormData {
    Person person = new Person();
    Income[] incomes = new List<Income>();
    Address[] addresses = new List<Address>();
    Residence[] residences = new List<Residence>();
    HouseholdMember[] household_members = new List<HouseholdMember>();
    Employment[] employments = new List<Employment>();
    CriminalHistory[] criminal_histories = new List<CriminalHistory>();
    Alias[] aliases = new List<Alias>();
    PreviousSSN[] previous_ssns = new List<PreviousSSN>();
    String[] housing_forms = new List<String>();
  }

  public class PDFResult {
    public String url {get; set;}
    public String status {get; set;}
    public String building {get; set;}
  }

  public class Form {
    public String endpoint {get; set;}
    public FormData data;
    public ClientData client;

    public Form(Id clientId){
      data = new FormData();
      client = new ClientData();

      if(clientId==null) return;

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
        client.client = clients[0];
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
        inc.interval = 'Month';
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
        member.member.first_name = names[0];
        if(names.size()>1) member.member.last_name = names[1];
        member.member.dob = client_household_member.DOB__c;
        member.relationship = client_household_member.Relationship__c;
        data.household_members.add(member);
        i+=1;
      }
    }

    public String toJSON(){
      return JSON.serialize(data);
    }

    public PDFResult[] fetchPDFs(){
      String json = this.toJSON();
      return this.fetchPDFs(json);
    }

    public PDFResult[] fetchPDFs(String json){
      // TODO: once Ruby endpoint is setup
      // Http h = new Http();
      // HttpRequest req = new HttpRequest();
      // endpoint = endpoint.replace(' ', '%20');
      // req.setEndpoint(endpoint);
      // req.setMethod('POST');
      // req.setHeader('Accept', 'application/json');
      // req.setHeader('Content-Type', 'application/json');
      // req.setBody(json);
      // req.setTimeout(60000);
      //
      // HttpResponse res = h.send(req);
      // String pdf_urls = res.getBody();
      // return JSON.serialize(pdf_urls);

      PDFResult p1 = new PDFResult();
      p1.url = 'https://na-production.s3.amazonaws.com/documents/EarlyLearning-FamilyEngagement-DigitalAge.pdf';
      p1.building = 'Building 1';
      PDFResult p2 = new PDFResult();
      p2.url = 'https://na-production.s3.amazonaws.com/documents/Roadmapping_AI_Final.pdf';
      p2.building = 'Building 2';

      return new List<PDFResult>{ p1, p2 };
    }
  }

  public static Blob downloadPDF(String url){
    Http h = new Http();
    HttpRequest req = new HttpRequest();

    url = url.replace(' ', '%20');
    req.setEndpoint(url);
    req.setMethod('GET');
    req.setHeader('Content-Type', 'application/pdf');
    req.setCompressed(true);
    req.setTimeout(60000);

    HttpResponse res = h.send(req);
    String response = res.getBody();

    return res.getBodyAsBlob();
  }

}
