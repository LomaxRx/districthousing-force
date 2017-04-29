var HapForm = (function (redux,reactRedux,reactReduxForm,Thunk,react,reactDom) {
'use strict';

Thunk = 'default' in Thunk ? Thunk['default'] : Thunk;

var initialState = {
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

var models = {
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
		"current": null,
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

var classCallCheck = function (instance, Constructor) {
  if (!(instance instanceof Constructor)) {
    throw new TypeError("Cannot call a class as a function");
  }
};

var createClass = function () {
  function defineProperties(target, props) {
    for (var i = 0; i < props.length; i++) {
      var descriptor = props[i];
      descriptor.enumerable = descriptor.enumerable || false;
      descriptor.configurable = true;
      if ("value" in descriptor) descriptor.writable = true;
      Object.defineProperty(target, descriptor.key, descriptor);
    }
  }

  return function (Constructor, protoProps, staticProps) {
    if (protoProps) defineProperties(Constructor.prototype, protoProps);
    if (staticProps) defineProperties(Constructor, staticProps);
    return Constructor;
  };
}();







var _extends = Object.assign || function (target) {
  for (var i = 1; i < arguments.length; i++) {
    var source = arguments[i];

    for (var key in source) {
      if (Object.prototype.hasOwnProperty.call(source, key)) {
        target[key] = source[key];
      }
    }
  }

  return target;
};



var inherits = function (subClass, superClass) {
  if (typeof superClass !== "function" && superClass !== null) {
    throw new TypeError("Super expression must either be null or a function, not " + typeof superClass);
  }

  subClass.prototype = Object.create(superClass && superClass.prototype, {
    constructor: {
      value: subClass,
      enumerable: false,
      writable: true,
      configurable: true
    }
  });
  if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass;
};











var possibleConstructorReturn = function (self, call) {
  if (!self) {
    throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
  }

  return call && (typeof call === "object" || typeof call === "function") ? call : self;
};

var AddressForm = function (_Component) {
  inherits(AddressForm, _Component);

  function AddressForm() {
    var _ref;

    var _temp, _this, _ret;

    classCallCheck(this, AddressForm);

    for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
      args[_key] = arguments[_key];
    }

    return _ret = (_temp = (_this = possibleConstructorReturn(this, (_ref = AddressForm.__proto__ || Object.getPrototypeOf(AddressForm)).call.apply(_ref, [this].concat(args))), _this), _this.addAddress = function () {
      var _this$props = _this.props,
          dispatch = _this$props.dispatch,
          addresses = _this$props.addresses;

      dispatch(reactReduxForm.actions.push('addresses', _extends({}, models.Address, { index: addresses.length
      })));
    }, _temp), possibleConstructorReturn(_this, _ret);
  }

  createClass(AddressForm, [{
    key: 'render',
    value: function render$$1() {
      var addresses = this.props.addresses;

      return React.createElement(
        'section',
        { id: 'addresses' },
        React.createElement(
          'h2',
          null,
          'Addresses'
        ),
        addresses.map(function (a, i) {
          return React.createElement(
            reactReduxForm.Form,
            { model: reactReduxForm.track('addresses[]', { index: i }) },
            React.createElement(
              'div',
              { className: 'field' },
              React.createElement(
                'label',
                null,
                'Street'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.street' })
            ),
            React.createElement(
              'div',
              { className: 'field' },
              React.createElement(
                'label',
                null,
                'Apt'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.apt' })
            ),
            React.createElement(
              'div',
              { className: 'field' },
              React.createElement(
                'label',
                null,
                'City'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.city' })
            ),
            React.createElement(
              'div',
              { className: 'field' },
              React.createElement(
                'label',
                null,
                'State'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.state' })
            )
          );
        }),
        React.createElement(
          'button',
          { onClick: this.addAddress },
          'Add Address'
        )
      );
    }
  }]);
  return AddressForm;
}(react.Component);

var mapStateToProps = function mapStateToProps(state) {
  return {
    addresses: state.addresses
  };
};

var AddressForm$1 = reactRedux.connect(mapStateToProps)(AddressForm);

var PersonForm = function (_Component) {
  inherits(PersonForm, _Component);

  function PersonForm() {
    classCallCheck(this, PersonForm);
    return possibleConstructorReturn(this, (PersonForm.__proto__ || Object.getPrototypeOf(PersonForm)).apply(this, arguments));
  }

  createClass(PersonForm, [{
    key: 'render',
    value: function render$$1() {
      var addresses = this.props.addresses;

      return React.createElement(
        'section',
        { id: 'contact_information' },
        React.createElement(
          'h2',
          null,
          'Contact Information'
        ),
        React.createElement(
          reactReduxForm.Form,
          { model: 'person' },
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'First Name'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.first_name' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Middle Name'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.middle_name' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Last Name'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.last_name' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Social Security Number'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.ssn' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Date of Birth'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.dob' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'City of Birth'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.city_of_birth' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'State of Birth'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.state_of_birth' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Country of Birth'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.country_of_birth' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Citizenship'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.citizenship' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Cell Phone'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.cell_phone' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Home Phone'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.home_phone' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Work Phone'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.work_phone' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Email'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.email' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Occupation'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.occupation' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Marital Status'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.marital_status' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Student Status'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.student_status' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Gender'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.gender' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Race'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.race' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Ethinicity'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.ethnicity' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Driver License Number'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.driver_license_number' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Driver License State'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.driver_license_state' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Drive License Expiration Date'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.drive_licenese_exp_date' })
          ),
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Mailing Address'
            ),
            React.createElement(
              reactReduxForm.Control.select,
              { model: '.mailing_address_id' },
              React.createElement('option', { value: '' }),
              addresses.map(function (a, i) {
                return React.createElement(
                  'option',
                  { value: a.id },
                  (a.street || '') + ' ' + (a.city || '') + ', ' + (a.state || '')
                );
              })
            )
          )
        )
      );
    }
  }]);
  return PersonForm;
}(react.Component);

var mapStateToProps$1 = function mapStateToProps(state) {
  return {
    addresses: state.addresses
  };
};

var PersonForm$1 = reactRedux.connect(mapStateToProps$1)(PersonForm);

var App = function (_Component) {
  inherits(App, _Component);

  function App() {
    classCallCheck(this, App);
    return possibleConstructorReturn(this, (App.__proto__ || Object.getPrototypeOf(App)).apply(this, arguments));
  }

  createClass(App, [{
    key: 'render',
    value: function render$$1() {
      return React.createElement(
        'main',
        null,
        React.createElement(PersonForm$1, null),
        React.createElement(AddressForm$1, null)
      );
    }
  }]);
  return App;
}(react.Component);

var HapForm = function HapForm() {
  var state = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : initialState;
  classCallCheck(this, HapForm);

  this.store = redux.createStore(reactReduxForm.combineForms(state), redux.applyMiddleware(Thunk));
  reactDom.render(React.createElement(
    reactRedux.Provider,
    { store: this.store },
    React.createElement(App, null)
  ), document.getElementById('app'));
};

return HapForm;

}(Redux,ReactRedux,ReactReduxForm,ReduxThunk,React,ReactDOM));
