var HapForm = (function (redux,reactRedux,reactReduxForm,Thunk,reactDom,react) {
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

      dispatch(reactReduxForm.actions.push('addresses', _extends({}, models.Address, { index: addresses.length })));
    }, _temp), possibleConstructorReturn(_this, _ret);
  }

  createClass(AddressForm, [{
    key: 'render',
    value: function render$$1() {
      var addresses = this.props.addresses;

      return React.createElement(
        'div',
        null,
        React.createElement(
          'button',
          { onClick: this.addAddress },
          'Add'
        ),
        addresses.map(function (a, i) {
          return React.createElement(
            reactReduxForm.Form,
            { model: reactReduxForm.track('addresses[]', { index: i }) },
            React.createElement(reactReduxForm.Control.text, { model: '.street' })
          );
        })
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

var HapForm = function HapForm() {
  var state = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : initialState;
  classCallCheck(this, HapForm);

  this.store = redux.createStore(reactReduxForm.combineForms(state), redux.applyMiddleware(Thunk));
  reactDom.render(React.createElement(
    reactRedux.Provider,
    { store: this.store },
    React.createElement(AddressForm$1, null)
  ), document.getElementById('app'));
};

return HapForm;

}(Redux,ReactRedux,ReactReduxForm,ReduxThunk,ReactDOM,React));
