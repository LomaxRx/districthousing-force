export let initialState = {
	"residences": [],
	"previous_ssns": [],
	"person": {
		"work_phone": null,
		"student_status": null,
		"state_of_birth": null,
		"ssn": null,
		"race": null,
		"occupation": null,
		"middle_name": null,
		"marital_status": null,
		"mailing_address_id": null,
		"last_name": null,
		"home_phone": null,
		"gender": null,
		"first_name": null,
		"ethnicity": null,
		"email": null,
		"driver_license_state": null,
		"driver_license_number": null,
		"driver_license_exp_date": null,
		"dob": null,
		"country_of_birth": null,
		"city_of_birth": null,
		"citizenship": null,
		"cell_phone": null
	},
	"incomes": [],
	"housing_forms": [],
	"household_members": [],
	"employments": [],
	"criminal_histories": [],
	"aliases": [],
	"addresses": []
};

export let models = {
	"Residence": {
		"start_date": null,
		"reason": null,
		"landlord": {
			"work_phone": null,
			"student_status": null,
			"state_of_birth": null,
			"ssn": null,
			"race": null,
			"occupation": null,
			"middle_name": null,
			"marital_status": null,
			"mailing_address_id": null,
			"last_name": null,
			"home_phone": null,
			"gender": null,
			"first_name": null,
			"ethnicity": null,
			"email": null,
			"driver_license_state": null,
			"driver_license_number": null,
			"driver_license_exp_date": null,
			"dob": null,
			"country_of_birth": null,
			"city_of_birth": null,
			"citizenship": null,
			"cell_phone": null
		},
		"end_date": null,
		"current": false,
		"address_id": null
	},
	"PreviousSSN": {
		"previous_number": null
	},
	"Person": {
		"work_phone": null,
		"student_status": null,
		"state_of_birth": null,
		"ssn": null,
		"race": null,
		"occupation": null,
		"middle_name": null,
		"marital_status": null,
		"mailing_address_id": null,
		"last_name": null,
		"home_phone": null,
		"gender": null,
		"first_name": null,
		"ethnicity": null,
		"email": null,
		"driver_license_state": null,
		"driver_license_number": null,
		"driver_license_exp_date": null,
		"dob": null,
		"country_of_birth": null,
		"city_of_birth": null,
		"citizenship": null,
		"cell_phone": null
	},
	"Income": {
		"interval": null,
		"income_type": null,
		"amount": null
	},
	"HousingForm": "",
	"HouseholdMember": {
		"relationship": null,
		"member": {
			"work_phone": null,
			"student_status": null,
			"state_of_birth": null,
			"ssn": null,
			"race": null,
			"occupation": null,
			"middle_name": null,
			"marital_status": null,
			"mailing_address_id": null,
			"last_name": null,
			"home_phone": null,
			"gender": null,
			"first_name": null,
			"ethnicity": null,
			"email": null,
			"driver_license_state": null,
			"driver_license_number": null,
			"driver_license_exp_date": null,
			"dob": null,
			"country_of_birth": null,
			"city_of_birth": null,
			"citizenship": null,
			"cell_phone": null
		}
	},
	"Employment": {
		"supervisor_name": null,
		"start_date": null,
		"position": null,
		"phone": null,
		"part_time": null,
		"end_date": null,
		"employer_name": null,
		"current": null,
		"address": {
			"street": null,
			"state": null,
			"id": null,
			"city": null,
			"apt": null
		}
	},
	"CriminalHistory": {
		"year": null,
		"description": null,
		"crime_type": null
	},
	"Alias": {
		"name": null
	},
	"Address": {
		"street": null,
		"state": null,
		"id": null,
		"city": null,
		"apt": null
	}
};
