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
  }

  public class Residence {
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
    Person member = new Person();
    String relationship;
  }

  public class Employment {
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
    String description;
    Integer year;
    String crime_type;
  }

  public class Alias {
    String name;
  }

  public class PreviousSSN {
		// Just 'number' in HAP App
		// reserved word in Apex.
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

  public class Form {
    public Client__c client;
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

    public Form(Id clientId){
      if(clientId==null) return;
      Client__c[] clients = [
        SELECT Id, Name, First_Name__c, Last_Name__c, Middle_Name__c, Alternate_Name__c, Email_Address__c,
        Alternate_Phone__c, Alternate_Phone_Type__c, Primary_Phone__c, Primary_Phone_Type__c,
        City_of_Birth__c, State_of_Birth__c, Country_of_Birth__c, DOB__c, Drivers_License_Number__c,
        Drivers_License_State__c, Ethnicity__c, Gender__c, Hispanic__c, Marital_Status__c,
        Student_Status__c, Race__c, SSN__c
        FROM Client__c
        WHERE id=:clientId
      ];

      if(clients.size()>0){
        client = clients[0];
        mapPerson(client);
        mapIncome(clientId);
        mapAddress(clientId);
        mapHouseholdMember(clientId);
      }
    }

    private void mapPerson(Client__c c){
      person.first_name = c.First_Name__c;
      person.middle_name = c.Middle_Name__c;
      person.last_name = c.Last_Name__c;
      person.ssn = c.SSN__c;
      person.dob = c.DOB__c;
      person.gender = c.Gender__c;

      if(c.Alternate_Phone_Type__c=='Mobile')
        person.cell_phone = c.Alternate_Phone__c;
      else if(c.Alternate_Phone_Type__c=='Home')
        person.home_phone = c.Alternate_Phone__c;
      else if(c.Alternate_Phone_Type__c=='Work')
        person.work_phone = c.Alternate_Phone__c;

      if(c.Primary_Phone_Type__c=='Mobile')
        person.cell_phone = c.Primary_Phone__c;
      else if(c.Primary_Phone_Type__c=='Home')
        person.home_phone = c.Primary_Phone__c;
      else if(c.Primary_Phone_Type__c=='Work')
        person.work_phone = c.Primary_Phone__c;
      else
        person.home_phone = c.Primary_Phone__c;

      person.email = c.Email_Address__c;
      person.race = c.Race__c;
      person.ethnicity = c.Ethnicity__c;
      person.student_status = c.Student_Status__c;
      person.marital_status = c.Marital_Status__c;
      person.driver_license_number = c.Drivers_License_Number__c;
      person.driver_license_state = c.Drivers_License_State__c;

    }

    private void mapIncome(Id clientId){
      Income_and_Benefits__c[] client_incomes = [
        SELECT Id, RecordType.Name, Amount__c, Type__c
        FROM Income_and_Benefits__c
        WHERE Client__c=:clientId AND RecordType.Name='Income' AND Current__c=TRUE
      ];

      for(Income_and_Benefits__c client_income :client_incomes){
        Income i = new Income();
        i.amount = client_income.Amount__c.intValue();
        i.income_type = client_income.Type__c;
        incomes.add(i);
      }
    }

    private void mapAddress(Id clientId){
      Address__c[] client_addresses = [
        SELECT Id, Name, Address_2__c, City__c, State__c, Zip_Code__c,
        Landlord_Name__c, Landlord_Cell_Phone__c, Landlord_Home_Phone__c, Landlord_Work_Phone__c,
        Current_Address__c, Start_Date__c, End_Date__c, Address_Type__c
        FROM Address__c
        WHERE Client__c=:clientId
      ];

      Integer i = 0;
      for(Address__c client_address :client_addresses){
        Address a = new Address();
        a.Id = i;
        a.street = client_address.Name;
        if(client_address.Address_2__c!=''&&client_address.Address_2__c!=null)
          a.street += ' ' + client_address.Address_2__c;
        a.city = client_address.City__c;
        a.state = client_address.State__c;
        if(
          client_address.Landlord_Name__c!=null||client_address.Landlord_Name__c!=''||
          client_address.Start_Date__c!=null||client_address.End_Date__c!=null
        ){
          Residence r = new Residence();
          r.start_date = client_address.Start_Date__c;
          r.end_date = client_address.End_Date__c;
          r.current = client_address.Current_Address__c;
          r.landlord.first_name = client_address.Landlord_Name__c;
          r.landlord.cell_phone = client_address.Landlord_Cell_Phone__c;
          r.landlord.home_phone = client_address.Landlord_Home_Phone__c;
          r.landlord.work_phone = client_address.Landlord_Work_Phone__c;
        }

        addresses.add(a);
        i = i+1;
      }
    }

    private void mapHouseholdMember(Id clientId){
      Household_Members__c[] client_household_members = [
        SELECT Id, Name, DOB__c, Relationship__c
        FROM Household_Members__c
        WHERE Client__c=:clientId
      ];

      for(Household_Members__c client_household_member :client_household_members){
        HouseholdMember member = new HouseholdMember();
        member.member.first_name = client_household_member.Name;
        member.member.dob = client_household_member.DOB__c;
        member.relationship = client_household_member.Relationship__c;
        household_members.add(member);
      }
    }

    public String toJSON(){
      return JSON.serialize(this);
    }
  }

}
