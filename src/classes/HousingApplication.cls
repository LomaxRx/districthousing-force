public class HousingApplication {
  public class Person {
    String first_name;
    String last_name;
    String middle_name;
    String ssn;
    Datetime dob;
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

    public Form(){}

    public String toJSON(){
      return JSON.serialize(this);
    }
  }

}