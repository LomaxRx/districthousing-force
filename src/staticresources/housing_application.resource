var HapForm = (function (redux,reactRedux,reactReduxForm,Thunk,react,reactDom,apexActions,DayPicker,moment,Jump) {
'use strict';

Thunk = 'default' in Thunk ? Thunk['default'] : Thunk;
DayPicker = 'default' in DayPicker ? DayPicker['default'] : DayPicker;
moment = 'default' in moment ? moment['default'] : moment;
Jump = 'default' in Jump ? Jump['default'] : Jump;

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





var defineProperty = function (obj, key, value) {
  if (key in obj) {
    Object.defineProperty(obj, key, {
      value: value,
      enumerable: true,
      configurable: true,
      writable: true
    });
  } else {
    obj[key] = value;
  }

  return obj;
};

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



















var toConsumableArray = function (arr) {
  if (Array.isArray(arr)) {
    for (var i = 0, arr2 = Array(arr.length); i < arr.length; i++) arr2[i] = arr[i];

    return arr2;
  } else {
    return Array.from(arr);
  }
};

var _Address;

var initialState = {
	"form": {
		"residences": [],
		"previous_ssns": [],
		"person": {
			"work_phone": '',
			"student_status": '',
			"state_of_birth": '',
			"ssn": '',
			"race": '',
			"occupation": '',
			"middle_name": '',
			"marital_status": '',
			"mailing_address_id": '',
			"last_name": '',
			"home_phone": '',
			"gender": '',
			"first_name": '',
			"ethnicity": '',
			"email": '',
			"driver_license_state": '',
			"driver_license_number": '',
			"driver_license_exp_date": '',
			"dob": '',
			"country_of_birth": '',
			"city_of_birth": '',
			"citizenship": '',
			"cell_phone": ''
		},
		"incomes": [],
		"housing_forms": [],
		"household_members": [],
		"employments": [],
		"criminal_histories": [],
		"aliases": [],
		"addresses": [],
		"contacts": []
	},
	"buildings": []
};

var models = {
	"Residence": {
		"id": '',
		"start_date": '',
		"reason": '',
		"landlord": {
			"work_phone": '',
			"student_status": '',
			"state_of_birth": '',
			"ssn": '',
			"race": '',
			"occupation": '',
			"middle_name": '',
			"marital_status": '',
			"mailing_address_id": '',
			"last_name": '',
			"home_phone": '',
			"gender": '',
			"first_name": '',
			"ethnicity": '',
			"email": '',
			"driver_license_state": '',
			"driver_license_number": '',
			"driver_license_exp_date": '',
			"dob": '',
			"country_of_birth": '',
			"city_of_birth": '',
			"citizenship": '',
			"cell_phone": '',
			"address": {
				"street": '',
				"state": '',
				"city": '',
				"zip": '',
				"apt": ''
			}
		},
		"end_date": '',
		"current": false,
		"address_id": ''
	},
	"PreviousSSN": {
		"id": '',
		"previous_number": ''
	},
	"Person": {
		"work_phone": '',
		"student_status": '',
		"state_of_birth": '',
		"ssn": '',
		"race": '',
		"occupation": '',
		"middle_name": '',
		"marital_status": '',
		"mailing_address_id": '',
		"last_name": '',
		"home_phone": '',
		"gender": '',
		"first_name": '',
		"ethnicity": '',
		"email": '',
		"driver_license_state": '',
		"driver_license_number": '',
		"driver_license_exp_date": '',
		"dob": '',
		"country_of_birth": '',
		"city_of_birth": '',
		"citizenship": '',
		"cell_phone": ''
	},
	"Income": {
		"id": '',
		"interval": '',
		"income_type": '',
		"amount": ''
	},
	"HousingForm": {
		"waitlist_open": null,
		"waitlist_closed_until": null,
		"wait_length": null,
		"utilities_included": "",
		"required_proofs": {
			"social_security_card": null,
			"rental_history": null,
			"other": null,
			"none": null,
			"income": null,
			"identification": null,
			"employment_history": null,
			"disability": null,
			"dc_residency": null,
			"citizenship": null,
			"birth_certificate": null,
			"bank_statement": null
		},
		"pets_allowed": "",
		"notes": "",
		"name": "",
		"longitude": null,
		"latitude": null,
		"id": null,
		"eligibility": {
			"mobility_impairment": null,
			"minimum_age_without_disability": null,
			"minimum_age_with_disability": null,
			"income": null,
			"elderly": null,
			"disability": null
		},
		"company_phone": "",
		"company_name": "",
		"bus_routes": "",
		"building_phone": "",
		"bedrooms_open": "",
		"bedrooms_offered": "",
		"application_on_file": null,
		"application_info": "",
		"application_fee": null,
		"address": ""
	},
	"HouseholdMember": {
		"id": '',
		"relationship": '',
		"member": {
			"work_phone": '',
			"student_status": '',
			"state_of_birth": '',
			"ssn": '',
			"race": '',
			"occupation": '',
			"middle_name": '',
			"marital_status": '',
			"mailing_address_id": '',
			"last_name": '',
			"home_phone": '',
			"gender": '',
			"first_name": '',
			"ethnicity": '',
			"email": '',
			"driver_license_state": '',
			"driver_license_number": '',
			"driver_license_exp_date": '',
			"dob": '',
			"country_of_birth": '',
			"city_of_birth": '',
			"citizenship": '',
			"cell_phone": ''
		}
	},
	"Employment": {
		"id": '',
		"supervisor_name": '',
		"start_date": '',
		"position": '',
		"phone": '',
		"part_time": false,
		"end_date": '',
		"employer_name": '',
		"current": false,
		"address": {
			"street": '',
			"state": '',
			"id": '',
			"city": '',
			"zip": '',
			"apt": ''
		}
	},
	"CriminalHistory": {
		"id": '',
		"year": '',
		"description": '',
		"state": '',
		"crime_type": ''
	},
	"Alias": {
		"id": '',
		"name": ''
	},
	"Address": (_Address = {
		"id": '',
		"street": '',
		"state": ''
	}, defineProperty(_Address, "id", ''), defineProperty(_Address, "city", ''), defineProperty(_Address, "apt", ''), defineProperty(_Address, "zip", ''), defineProperty(_Address, "residence", false), _Address),
	"Contact": {
		"id": '',
		"work_phone": '',
		"last_name": '',
		"home_phone": '',
		"first_name": '',
		"relationship": '',
		"cell_phone": '',
		"address": {
			"street": '',
			"state": '',
			"city": '',
			"zip": '',
			"apt": ''
		}
	}
};

var Main = function (_Component) {
  inherits(Main, _Component);

  function Main() {
    var _ref;

    var _temp, _this, _ret;

    classCallCheck(this, Main);

    for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
      args[_key] = arguments[_key];
    }

    return _ret = (_temp = (_this = possibleConstructorReturn(this, (_ref = Main.__proto__ || Object.getPrototypeOf(Main)).call.apply(_ref, [this].concat(args))), _this), _this.html = document.getElementsByTagName('html')[0], _temp), possibleConstructorReturn(_this, _ret);
  }

  createClass(Main, [{
    key: 'render',
    value: function render$$1() {
      var buildingListActive = this.props.buildingListActive;


      if (buildingListActive) this.html.classList.add('hidden-overflow');else this.html.classList.remove('hidden-overflow');

      return React.createElement(
        'main',
        { id: 'main-app', className: buildingListActive ? 'hidden-overflow' : '' },
        this.props.children
      );
    }
  }]);
  return Main;
}(react.Component);

var mapStateToProps = function mapStateToProps(state) {
  return {
    buildingListActive: state.buildingListActive
  };
};

var Main$1 = reactRedux.connect(mapStateToProps)(Main);

var uniqueInteger = function uniqueInteger(list) {
  var accessor = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 'id';

  var max = -1;

  for (var i = 0; i < list.length; i++) {
    var val = list[i][accessor];
    if (val > max) max = val;
  }

  return max + 1;
};

var getIndex = function getIndex(list, id) {
  for (var i = 0; i < list.length; i++) {
    if (list[i].id === id) return i;
  }return false;
};

var easeInOutQuad = function easeInOutQuad(t, b, c, d) {
  t /= d / 2;
  if (t < 1) return c / 2 * t * t + b;
  t--;
  return -c / 2 * (t * (t - 2) - 1) + b;
};

var DatePicker = function (_Component) {
  inherits(DatePicker, _Component);

  function DatePicker() {
    var _ref;

    var _temp, _this, _ret;

    classCallCheck(this, DatePicker);

    for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
      args[_key] = arguments[_key];
    }

    return _ret = (_temp = (_this = possibleConstructorReturn(this, (_ref = DatePicker.__proto__ || Object.getPrototypeOf(DatePicker)).call.apply(_ref, [this].concat(args))), _this), _this.clickedInside = false, _this.clickTimeout = null, _this.input = null, _this.componentWillUnmount = function () {
      clearTimeout(_this.clickTimeout);
    }, _this.activate = function () {
      _this.setState({ active: true });
    }, _this.deactivate = function () {
      if (!_this.clickedInside) {
        _this.setState({ active: false });
      } else {
        _this.input.focus();
      }
    }, _this.mouseDown = function () {
      _this.clickedInside = true;
      // The input's onBlur method is called from a queue right after onMouseDown event.
      // setTimeout adds another callback in the queue, but is called later than onBlur event
      _this.clickTimeout = setTimeout(function () {
        _this.clickedInside = false;
      }, 0);
    }, _this.dayClick = function (day) {
      var _this$props = _this.props,
          name = _this$props.name,
          dispatch = _this$props.dispatch;

      var d = moment(day).format('YYYY-MM-DD');
      dispatch(reactReduxForm.actions.change(name, d));
      if (_this.input) _this.input.blur();
    }, _temp), possibleConstructorReturn(_this, _ret);
  }

  createClass(DatePicker, [{
    key: 'componentWillMount',
    value: function componentWillMount() {
      if (this.props.value) this.dayClick(this.props.value);
      this.setState({ active: false });
    }
  }, {
    key: 'render',
    value: function render$$1() {
      var _this2 = this;

      var active = this.state.active;

      return React.createElement(
        'div',
        { className: 'datepicker ' + (active ? 'active' : ''), onMouseDown: this.mouseDown },
        React.createElement('input', _extends({ type: 'text' }, this.props, {
          onFocus: this.activate,
          onBlur: this.deactivate,
          ref: function ref(el) {
            _this2.input = el;
          }
        })),
        React.createElement(DayPicker, { onDayClick: this.dayClick })
      );
    }
  }]);
  return DatePicker;
}(react.Component);

DatePicker = reactRedux.connect()(DatePicker);

var CustomControl = function CustomControl(props) {
  return React.createElement(reactReduxForm.Control, _extends({
    component: DatePicker,
    mapProps: {
      value: function value(props) {
        return props.viewValue;
      }
    }
  }, props));
};

var FormSection = function (_Component) {
  inherits(FormSection, _Component);

  function FormSection() {
    var _ref;

    var _temp, _this, _ret;

    classCallCheck(this, FormSection);

    for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
      args[_key] = arguments[_key];
    }

    return _ret = (_temp = (_this = possibleConstructorReturn(this, (_ref = FormSection.__proto__ || Object.getPrototypeOf(FormSection)).call.apply(_ref, [this].concat(args))), _this), _this.el = null, _this.inView = function () {
      if (!_this.el) return;

      var _this$props = _this.props,
          dispatch = _this$props.dispatch,
          id = _this$props.id,
          inViewSection = _this$props.inViewSection;

      id = '#' + id;

      var top = _this.el.getBoundingClientRect().top - 10;
      var bottom = _this.el.offsetHeight + 20;

      if (top < 0 && top > -bottom && id != inViewSection) dispatch({ type: 'SET_IN_VIEW_SECTION', id: id });
    }, _temp), possibleConstructorReturn(_this, _ret);
  }

  createClass(FormSection, [{
    key: 'render',
    value: function render$$1() {
      var _this2 = this;

      this.inView();
      return React.createElement('section', _extends({}, this.props, { ref: function ref(el) {
          _this2.el = el;
        } }));
    }
  }]);
  return FormSection;
}(react.Component);

var mapStateToProps$2 = function mapStateToProps(state) {
  return {
    scrollPosition: state.scrollPosition,
    inViewSection: state.inViewSection
  };
};

var FormSection$1 = reactRedux.connect(mapStateToProps$2)(FormSection);

var ResidenceForm = function (_Component) {
  inherits(ResidenceForm, _Component);

  function ResidenceForm() {
    var _ref;

    var _temp, _this, _ret;

    classCallCheck(this, ResidenceForm);

    for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
      args[_key] = arguments[_key];
    }

    return _ret = (_temp = (_this = possibleConstructorReturn(this, (_ref = ResidenceForm.__proto__ || Object.getPrototypeOf(ResidenceForm)).call.apply(_ref, [this].concat(args))), _this), _this.addResidence = function () {
      var _this$props = _this.props,
          dispatch = _this$props.dispatch,
          residences = _this$props.residences,
          addressId = _this$props.addressId;

      var id = addressId;
      dispatch(reactReduxForm.actions.push('formData.residences', _extends({}, models.Residence, {
        address_id: addressId,
        id: id
      })));

      return id;
    }, _this.removeResidence = function () {
      var _this$props2 = _this.props,
          dispatch = _this$props2.dispatch,
          residences = _this$props2.residences;
      var id = _this.state.id;

      dispatch(reactReduxForm.actions.remove('formData.residences'), getIndex(residences, id));
    }, _temp), possibleConstructorReturn(_this, _ret);
  }

  createClass(ResidenceForm, [{
    key: 'componentWillMount',
    value: function componentWillMount() {
      var _props = this.props,
          residences = _props.residences,
          addressId = _props.addressId;

      if (getIndex(residences, addressId) === false) this.setState({ id: this.addResidence() });else this.setState({ id: addressId });
    }
  }, {
    key: 'componentWillUnmount',
    value: function componentWillUnmount() {
      this.removeResidence();
    }
  }, {
    key: 'render',
    value: function render$$1() {
      var id = this.state.id;

      return React.createElement(
        reactReduxForm.Form,
        { model: reactReduxForm.track('formData.residences[]', { id: id }) },
        React.createElement(
          'div',
          { className: 'row' },
          React.createElement(
            'div',
            { className: 'field col-md-2' },
            React.createElement(
              'label',
              null,
              'Rent ($/month)'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.rent' })
          ),
          React.createElement(
            'div',
            { className: 'field col-md-4' },
            React.createElement(
              'label',
              null,
              'Start Date'
            ),
            React.createElement(CustomControl, { model: '.start_date' })
          ),
          React.createElement(
            'div',
            { className: 'field col-md-4' },
            React.createElement(
              'label',
              null,
              'End Date'
            ),
            React.createElement(CustomControl, { model: '.end_date' })
          ),
          React.createElement(
            'div',
            { className: 'field col-md-2' },
            React.createElement(
              'label',
              null,
              'Current'
            ),
            React.createElement(reactReduxForm.Control.checkbox, { model: '.current' })
          )
        ),
        React.createElement(
          'div',
          { className: 'row' },
          React.createElement(
            'div',
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Reason for Leaving'
            ),
            React.createElement(reactReduxForm.Control.textarea, { model: '.reason' })
          )
        ),
        React.createElement(
          'div',
          { className: 'row' },
          React.createElement(
            'div',
            { className: 'field col-md-4' },
            React.createElement(
              'label',
              null,
              'Landlord\'s First Name'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.landlord.first_name' })
          ),
          React.createElement(
            'div',
            { className: 'field col-md-4' },
            React.createElement(
              'label',
              null,
              'Landlord\'s Last Name'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.landlord.last_name' })
          ),
          React.createElement(
            'div',
            { className: 'field col-md-4' },
            React.createElement(
              'label',
              null,
              'Landlord\'s Phone Number'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.landlord.work_phone' })
          )
        ),
        React.createElement(
          'div',
          { className: 'row' },
          React.createElement(
            'div',
            { className: 'field col-md-3' },
            React.createElement(
              'label',
              null,
              'Landlord\'s Street'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.landlord.address.street' })
          ),
          React.createElement(
            'div',
            { className: 'field col-md-3' },
            React.createElement(
              'label',
              null,
              'Landlord\'s City'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.landlord.address.city' })
          ),
          React.createElement(
            'div',
            { className: 'field col-md-3' },
            React.createElement(
              'label',
              null,
              'Landlord\'s State'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.landlord.address.state' })
          ),
          React.createElement(
            'div',
            { className: 'field col-md-3' },
            React.createElement(
              'label',
              null,
              'Landlord\'s Zip'
            ),
            React.createElement(reactReduxForm.Control.text, { model: '.landlord.address.zip' })
          )
        )
      );
    }
  }]);
  return ResidenceForm;
}(react.Component);

var mapStateToResidenceProps = function mapStateToResidenceProps(state) {
  return {
    residences: state.formData.residences
  };
};

ResidenceForm = reactRedux.connect(mapStateToResidenceProps)(ResidenceForm);

var AddressForm = function (_Component2) {
  inherits(AddressForm, _Component2);

  function AddressForm() {
    var _ref2;

    var _temp2, _this2, _ret2;

    classCallCheck(this, AddressForm);

    for (var _len2 = arguments.length, args = Array(_len2), _key2 = 0; _key2 < _len2; _key2++) {
      args[_key2] = arguments[_key2];
    }

    return _ret2 = (_temp2 = (_this2 = possibleConstructorReturn(this, (_ref2 = AddressForm.__proto__ || Object.getPrototypeOf(AddressForm)).call.apply(_ref2, [this].concat(args))), _this2), _this2.addAddress = function () {
      var _this2$props = _this2.props,
          dispatch = _this2$props.dispatch,
          addresses = _this2$props.addresses;

      dispatch(reactReduxForm.actions.push('formData.addresses', _extends({}, models.Address, { id: uniqueInteger(addresses)
      })));
    }, _this2.removeAddress = function (index) {
      var dispatch = _this2.props.dispatch;

      dispatch(reactReduxForm.actions.remove('formData.addresses', index));
    }, _temp2), possibleConstructorReturn(_this2, _ret2);
  }

  createClass(AddressForm, [{
    key: 'render',
    value: function render$$1() {
      var _this3 = this;

      var addresses = this.props.addresses;

      return React.createElement(
        FormSection$1,
        { id: 'addresses', className: 'form-list' },
        React.createElement(
          'h2',
          null,
          'Current and Previous Addresses'
        ),
        addresses.map(function (a, i) {
          return React.createElement(
            reactReduxForm.Form,
            { model: reactReduxForm.track('formData.addresses[]', { id: a.id }), className: 'form-item' },
            React.createElement(
              'h3',
              null,
              'Address ',
              i + 1,
              React.createElement(
                'button',
                { className: 'remove-button', onClick: function onClick() {
                    _this3.removeAddress(i);
                  } },
                'X'
              )
            ),
            React.createElement(
              'div',
              null,
              React.createElement(
                'div',
                { className: 'row' },
                React.createElement(
                  'div',
                  { className: 'field col-md-10' },
                  React.createElement(
                    'label',
                    null,
                    'Street'
                  ),
                  React.createElement(reactReduxForm.Control.text, { model: '.street' })
                ),
                React.createElement(
                  'div',
                  { className: 'field col-md-2' },
                  React.createElement(
                    'label',
                    null,
                    'Apt'
                  ),
                  React.createElement(reactReduxForm.Control.text, { model: '.apt' })
                )
              ),
              React.createElement(
                'div',
                { className: 'row' },
                React.createElement(
                  'div',
                  { className: 'field col-md-6' },
                  React.createElement(
                    'label',
                    null,
                    'City'
                  ),
                  React.createElement(reactReduxForm.Control.text, { model: '.city' })
                ),
                React.createElement(
                  'div',
                  { className: 'field col-md-2' },
                  React.createElement(
                    'label',
                    null,
                    'State'
                  ),
                  React.createElement(reactReduxForm.Control.text, { model: '.state' })
                ),
                React.createElement(
                  'div',
                  { className: 'field col-md-2' },
                  React.createElement(
                    'label',
                    null,
                    'Zip'
                  ),
                  React.createElement(reactReduxForm.Control.text, { model: '.zip' })
                ),
                React.createElement(
                  'div',
                  { className: 'field col-md-2' },
                  React.createElement(
                    'label',
                    null,
                    'Residence'
                  ),
                  React.createElement(reactReduxForm.Control.checkbox, { model: '.residence' })
                )
              )
            ),
            a.residence === true && React.createElement(ResidenceForm, { addressId: i })
          );
        }),
        React.createElement(
          'div',
          { className: 'sub-section' },
          React.createElement(
            'button',
            { onClick: this.addAddress },
            'Add Address'
          ),
          React.createElement(
            'div',
            { className: 'row' },
            React.createElement(
              'div',
              { className: 'field col-md-6' },
              React.createElement(
                'label',
                null,
                'Select Mailing Address'
              ),
              React.createElement(
                reactReduxForm.Control.select,
                { model: 'formData.person.mailing_address_id' },
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
        )
      );
    }
  }]);
  return AddressForm;
}(react.Component);

var mapStateToProps$1 = function mapStateToProps(state) {
  return {
    addresses: state.formData.addresses
  };
};

var AddressForm$1 = reactRedux.connect(mapStateToProps$1)(AddressForm);

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
        FormSection$1,
        { id: 'contact_information' },
        React.createElement(
          'h2',
          null,
          'General Information'
        ),
        React.createElement(
          reactReduxForm.Form,
          { model: 'formData.person' },
          React.createElement(
            'div',
            { className: 'row' },
            React.createElement(
              'div',
              { className: 'field col-md-4' },
              React.createElement(
                'label',
                null,
                'First Name'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.first_name' })
            ),
            React.createElement(
              'div',
              { className: 'field col-md-4' },
              React.createElement(
                'label',
                null,
                'Middle Name'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.middle_name' })
            ),
            React.createElement(
              'div',
              { className: 'field col-md-4' },
              React.createElement(
                'label',
                null,
                'Last Name'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.last_name' })
            )
          ),
          React.createElement(
            'div',
            { className: 'row' },
            React.createElement(
              'div',
              { className: 'field col-md-4' },
              React.createElement(
                'label',
                null,
                'Date of Birth'
              ),
              React.createElement(CustomControl, { model: '.dob' })
            ),
            React.createElement(
              'div',
              { className: 'field col-md-8' },
              React.createElement(
                'label',
                null,
                'Social Security Number'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.ssn' })
            )
          ),
          React.createElement(
            'div',
            { className: 'row' },
            React.createElement(
              'div',
              { className: 'field col-md-10' },
              React.createElement(
                'label',
                null,
                'City of Birth'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.city_of_birth' })
            ),
            React.createElement(
              'div',
              { className: 'field col-md-2' },
              React.createElement(
                'label',
                null,
                'State of Birth'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.state_of_birth' })
            )
          ),
          React.createElement(
            'div',
            { className: 'row' },
            React.createElement(
              'div',
              { className: 'field col-md-6' },
              React.createElement(
                'label',
                null,
                'Citizenship'
              ),
              React.createElement(
                reactReduxForm.Control.select,
                { model: '.citizenship' },
                React.createElement('option', { value: '' }),
                React.createElement(
                  'option',
                  { value: 'US Citizen' },
                  'US Citizen'
                ),
                React.createElement(
                  'option',
                  { value: 'Non-Citizen with eligible immigration status' },
                  'Non-Citizen with eligible immigration status'
                ),
                React.createElement(
                  'option',
                  { value: 'Other' },
                  'Other'
                )
              )
            ),
            React.createElement(
              'div',
              { className: 'field col-md-6' },
              React.createElement(
                'label',
                null,
                'Occupation'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.occupation' })
            )
          ),
          React.createElement(
            'div',
            { className: 'row' },
            React.createElement(
              'div',
              { className: 'field col-md-4' },
              React.createElement(
                'label',
                null,
                'Cell Phone'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.cell_phone' })
            ),
            React.createElement(
              'div',
              { className: 'field col-md-4' },
              React.createElement(
                'label',
                null,
                'Home Phone'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.home_phone' })
            ),
            React.createElement(
              'div',
              { className: 'field col-md-4' },
              React.createElement(
                'label',
                null,
                'Work Phone'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.work_phone' })
            )
          ),
          React.createElement(
            'div',
            { className: 'row' },
            React.createElement(
              'div',
              { className: 'field' },
              React.createElement(
                'label',
                null,
                'Email'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.email' })
            )
          ),
          React.createElement(
            'div',
            { className: 'row' },
            React.createElement(
              'div',
              { className: 'field col-md-6' },
              React.createElement(
                'label',
                null,
                'Marital Status'
              ),
              React.createElement(
                reactReduxForm.Control.select,
                { model: '.marital_status' },
                React.createElement('option', { value: '' }),
                React.createElement(
                  'option',
                  { value: 'Single' },
                  'Single'
                ),
                React.createElement(
                  'option',
                  { value: 'Separated' },
                  'Separated'
                ),
                React.createElement(
                  'option',
                  { value: 'Married' },
                  'Married'
                ),
                React.createElement(
                  'option',
                  { value: 'Widowed' },
                  'Widowed'
                ),
                React.createElement(
                  'option',
                  { value: 'Divorced' },
                  'Divorced'
                )
              )
            ),
            React.createElement(
              'div',
              { className: 'field col-md-6' },
              React.createElement(
                'label',
                null,
                'Student Status'
              ),
              React.createElement(
                reactReduxForm.Control.select,
                { model: '.student_status' },
                React.createElement('option', { value: '' }),
                React.createElement(
                  'option',
                  { value: 'Not a student' },
                  'Not a student'
                ),
                React.createElement(
                  'option',
                  { value: 'Part-time' },
                  'Part-time'
                ),
                React.createElement(
                  'option',
                  { value: 'Full-time' },
                  'Full-time'
                )
              )
            )
          ),
          React.createElement(
            'div',
            { className: 'row' },
            React.createElement(
              'div',
              { className: 'field col-md-4' },
              React.createElement(
                'label',
                null,
                'Gender'
              ),
              React.createElement(
                reactReduxForm.Control.select,
                { model: '.gender' },
                React.createElement('option', { value: '' }),
                React.createElement(
                  'option',
                  { value: 'Female' },
                  'Female'
                ),
                React.createElement(
                  'option',
                  { value: 'Male' },
                  'Male'
                )
              )
            ),
            React.createElement(
              'div',
              { className: 'field col-md-4' },
              React.createElement(
                'label',
                null,
                'Race'
              ),
              React.createElement(
                reactReduxForm.Control.select,
                { model: '.race' },
                React.createElement('option', { value: '' }),
                React.createElement(
                  'option',
                  { value: 'NativeAmerican' },
                  'American Indian or Alaska Native'
                ),
                React.createElement(
                  'option',
                  { value: 'Asian' },
                  'Asian'
                ),
                React.createElement(
                  'option',
                  { value: 'Black' },
                  'Black or African American'
                ),
                React.createElement(
                  'option',
                  { value: 'PacificIslander' },
                  'Native Hawaiian or Other Pacific Islander'
                ),
                React.createElement(
                  'option',
                  { value: 'White' },
                  'White'
                ),
                React.createElement(
                  'option',
                  { value: 'Decline' },
                  'Decline to State'
                ),
                React.createElement(
                  'option',
                  { value: 'Other' },
                  'Other'
                )
              )
            ),
            React.createElement(
              'div',
              { className: 'field col-md-4' },
              React.createElement(
                'label',
                null,
                'Ethnicity'
              ),
              React.createElement(
                reactReduxForm.Control.select,
                { model: '.ethnicity' },
                React.createElement('option', { value: '' }),
                React.createElement(
                  'option',
                  { value: 'Hispanic' },
                  'Hispanic or Latino'
                ),
                React.createElement(
                  'option',
                  { value: 'NotHispanic' },
                  'Not Hispanic or Latino'
                ),
                React.createElement(
                  'option',
                  { value: 'Decline' },
                  'Decline to State'
                )
              )
            )
          ),
          React.createElement(
            'div',
            { className: 'row' },
            React.createElement(
              'div',
              { className: 'field col-md-6' },
              React.createElement(
                'label',
                null,
                'Driver License Number'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.driver_license_number' })
            ),
            React.createElement(
              'div',
              { className: 'field col-md-2' },
              React.createElement(
                'label',
                null,
                'License State'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.driver_license_state' })
            ),
            React.createElement(
              'div',
              { className: 'field col-md-4' },
              React.createElement(
                'label',
                null,
                'License Expiration Date'
              ),
              React.createElement(CustomControl, { model: '.drive_licenese_exp_date' })
            )
          )
        )
      );
    }
  }]);
  return PersonForm;
}(react.Component);

var mapStateToProps$3 = function mapStateToProps(state) {
  return {
    addresses: state.formData.addresses
  };
};

var PersonForm$1 = reactRedux.connect(mapStateToProps$3)(PersonForm);

var HouseholdMemberForm = function (_Component) {
  inherits(HouseholdMemberForm, _Component);

  function HouseholdMemberForm() {
    var _ref;

    var _temp, _this, _ret;

    classCallCheck(this, HouseholdMemberForm);

    for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
      args[_key] = arguments[_key];
    }

    return _ret = (_temp = (_this = possibleConstructorReturn(this, (_ref = HouseholdMemberForm.__proto__ || Object.getPrototypeOf(HouseholdMemberForm)).call.apply(_ref, [this].concat(args))), _this), _this.addHouseholdMember = function () {
      var _this$props = _this.props,
          dispatch = _this$props.dispatch,
          household_members = _this$props.household_members;

      dispatch(reactReduxForm.actions.push('formData.household_members', _extends({}, models.HouseholdMember, { id: uniqueInteger(household_members)
      })));
    }, _this.removeHouseholdMember = function (index) {
      var dispatch = _this.props.dispatch;

      dispatch(reactReduxForm.actions.remove('formData.household_members', index));
    }, _temp), possibleConstructorReturn(_this, _ret);
  }

  createClass(HouseholdMemberForm, [{
    key: 'render',
    value: function render$$1() {
      var _this2 = this;

      var household_members = this.props.household_members;

      return React.createElement(
        FormSection$1,
        { id: 'household_members', className: 'form-list' },
        React.createElement(
          'h2',
          null,
          'Household Members'
        ),
        household_members.map(function (h, i) {
          return React.createElement(
            reactReduxForm.Form,
            { model: reactReduxForm.track('formData.household_members[]', { id: h.id }), className: 'form-item' },
            React.createElement(
              'h3',
              null,
              'Member ',
              i + 1,
              React.createElement(
                'button',
                { className: 'remove-button', onClick: function onClick() {
                    _this2.removeHouseholdMember(i);
                  } },
                'X'
              )
            ),
            React.createElement(
              'div',
              { className: 'row' },
              React.createElement(
                'div',
                { className: 'field col-md-6' },
                React.createElement(
                  'label',
                  null,
                  'First Name'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.first_name' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-6' },
                React.createElement(
                  'label',
                  null,
                  'Last Name'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.last_name' })
              )
            ),
            React.createElement(
              'div',
              { className: 'row' },
              React.createElement(
                'div',
                { className: 'field' },
                React.createElement(
                  'label',
                  null,
                  'Relationship'
                ),
                React.createElement(
                  reactReduxForm.Control.select,
                  { model: '.relationship' },
                  React.createElement('option', { value: '' }),
                  React.createElement(
                    'option',
                    { value: 'Spouse' },
                    'Spouse'
                  ),
                  React.createElement(
                    'option',
                    { value: 'Mother' },
                    'Mother'
                  ),
                  React.createElement(
                    'option',
                    { value: 'Father' },
                    'Father'
                  ),
                  React.createElement(
                    'option',
                    { value: 'Sister' },
                    'Sister'
                  ),
                  React.createElement(
                    'option',
                    { value: 'Brother' },
                    'Brother'
                  ),
                  React.createElement(
                    'option',
                    { value: 'Daughter' },
                    'Daughter'
                  ),
                  React.createElement(
                    'option',
                    { value: 'Son' },
                    'Son'
                  ),
                  React.createElement(
                    'option',
                    { value: 'Grandmother' },
                    'Grandmother'
                  ),
                  React.createElement(
                    'option',
                    { value: 'Grandfather' },
                    'Grandfather'
                  ),
                  React.createElement(
                    'option',
                    { value: 'Friend' },
                    'Friend'
                  )
                )
              )
            ),
            React.createElement(
              'div',
              { className: 'row' },
              React.createElement(
                'div',
                { className: 'field col-md-8' },
                React.createElement(
                  'label',
                  null,
                  'Social Security Number'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.ssn' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-4' },
                React.createElement(
                  'label',
                  null,
                  'Date of Birth'
                ),
                React.createElement(CustomControl, { model: '.dob' })
              )
            ),
            React.createElement(
              'div',
              { className: 'row' },
              React.createElement(
                'div',
                { className: 'field col-md-4' },
                React.createElement(
                  'label',
                  null,
                  'Home Phone'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.home_phone' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-4' },
                React.createElement(
                  'label',
                  null,
                  'Cell Phone'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.cell_phone' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-4' },
                React.createElement(
                  'label',
                  null,
                  'Work Phone'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.work_phone' })
              )
            )
          );
        }),
        React.createElement(
          'div',
          { className: 'sub-section' },
          React.createElement(
            'button',
            { onClick: this.addHouseholdMember },
            'Add Household Member'
          )
        )
      );
    }
  }]);
  return HouseholdMemberForm;
}(react.Component);

var mapStateToProps$4 = function mapStateToProps(state) {
  return {
    household_members: state.formData.household_members
  };
};

var HouseholdMemberForm$1 = reactRedux.connect(mapStateToProps$4)(HouseholdMemberForm);

var IncomeForm = function (_Component) {
  inherits(IncomeForm, _Component);

  function IncomeForm() {
    var _ref;

    var _temp, _this, _ret;

    classCallCheck(this, IncomeForm);

    for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
      args[_key] = arguments[_key];
    }

    return _ret = (_temp = (_this = possibleConstructorReturn(this, (_ref = IncomeForm.__proto__ || Object.getPrototypeOf(IncomeForm)).call.apply(_ref, [this].concat(args))), _this), _this.addIncome = function () {
      var _this$props = _this.props,
          dispatch = _this$props.dispatch,
          incomes = _this$props.incomes;

      dispatch(reactReduxForm.actions.push('formData.incomes', _extends({}, models.Income, { id: uniqueInteger(incomes)
      })));
    }, _this.removeIncome = function (index) {
      var dispatch = _this.props.dispatch;

      dispatch(reactReduxForm.actions.remove('formData.incomes', index));
    }, _temp), possibleConstructorReturn(_this, _ret);
  }

  createClass(IncomeForm, [{
    key: 'render',
    value: function render$$1() {
      var _this2 = this;

      var incomes = this.props.incomes;

      return React.createElement(
        FormSection$1,
        { id: 'incomes', className: 'form-list' },
        React.createElement(
          'h2',
          null,
          'Income'
        ),
        incomes.map(function (inc, i) {
          return React.createElement(
            reactReduxForm.Form,
            { model: reactReduxForm.track('formData.incomes[]', { id: inc.id }), className: 'form-item' },
            React.createElement(
              'h3',
              null,
              'Income ',
              i + 1,
              React.createElement(
                'button',
                { className: 'remove-button', onClick: function onClick() {
                    _this2.removeIncome(i);
                  } },
                'X'
              )
            ),
            React.createElement(
              'div',
              { className: 'row' },
              React.createElement(
                'div',
                { className: 'field col-md-4' },
                React.createElement(
                  'label',
                  null,
                  'Income Type'
                ),
                React.createElement(
                  reactReduxForm.Control.select,
                  { model: '.income_type' },
                  React.createElement('option', { value: '' }),
                  React.createElement(
                    'option',
                    { value: 'salary' },
                    'Employment (Salary/Full-time)'
                  ),
                  React.createElement(
                    'option',
                    { value: 'part-time' },
                    'Employment (Part-time)'
                  ),
                  React.createElement(
                    'option',
                    { value: 'self' },
                    'Self-Employment'
                  ),
                  React.createElement(
                    'option',
                    { value: 'social_security' },
                    'Social Security'
                  ),
                  React.createElement(
                    'option',
                    { value: 'disability_benefits' },
                    'Disability Benefits'
                  ),
                  React.createElement(
                    'option',
                    { value: 'military' },
                    'Military'
                  ),
                  React.createElement(
                    'option',
                    { value: 'veterans_benefits' },
                    'Veterans Benefits'
                  ),
                  React.createElement(
                    'option',
                    { value: 'child_support' },
                    'Child Support'
                  ),
                  React.createElement(
                    'option',
                    { value: 'government_assistance' },
                    'TANF/Government Assistance'
                  ),
                  React.createElement(
                    'option',
                    { value: 'retirement' },
                    'Retirement'
                  ),
                  React.createElement(
                    'option',
                    { value: 'alimony' },
                    'Alimony'
                  ),
                  React.createElement(
                    'option',
                    { value: 'commissions' },
                    'Commissions'
                  ),
                  React.createElement(
                    'option',
                    { value: 'rental' },
                    'Rental'
                  ),
                  React.createElement(
                    'option',
                    { value: 'stock' },
                    'Stock'
                  ),
                  React.createElement(
                    'option',
                    { value: 'insurance' },
                    'Insurance Claim'
                  ),
                  React.createElement(
                    'option',
                    { value: 'cash_gifts' },
                    'Cash Gifts'
                  ),
                  React.createElement(
                    'option',
                    { value: 'trust_fund' },
                    'Trust Fund'
                  ),
                  React.createElement(
                    'option',
                    { value: 'workers_compensation' },
                    'Worker\'s Compensation'
                  ),
                  React.createElement(
                    'option',
                    { value: 'severance' },
                    'Severance'
                  ),
                  React.createElement(
                    'option',
                    { value: 'scholarship' },
                    'Scholarship'
                  )
                )
              ),
              React.createElement(
                'div',
                { className: 'field col-md-4' },
                React.createElement(
                  'label',
                  null,
                  'Amount ($)'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.amount' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-4' },
                React.createElement(
                  'label',
                  null,
                  'Interval'
                ),
                React.createElement(
                  reactReduxForm.Control.select,
                  { model: '.interval' },
                  React.createElement('option', { value: '' }),
                  React.createElement(
                    'option',
                    { value: 'weekly' },
                    'Weekly'
                  ),
                  React.createElement(
                    'option',
                    { value: 'monthly' },
                    'Monthly'
                  ),
                  React.createElement(
                    'option',
                    { value: 'yearly' },
                    'Yearly'
                  )
                )
              )
            )
          );
        }),
        React.createElement(
          'div',
          { className: 'sub-section' },
          React.createElement(
            'button',
            { onClick: this.addIncome },
            'Add Income'
          )
        )
      );
    }
  }]);
  return IncomeForm;
}(react.Component);

var mapStateToProps$5 = function mapStateToProps(state) {
  return {
    incomes: state.formData.incomes
  };
};

var IncomeForm$1 = reactRedux.connect(mapStateToProps$5)(IncomeForm);

var EmploymentForm = function (_Component) {
  inherits(EmploymentForm, _Component);

  function EmploymentForm() {
    var _ref;

    var _temp, _this, _ret;

    classCallCheck(this, EmploymentForm);

    for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
      args[_key] = arguments[_key];
    }

    return _ret = (_temp = (_this = possibleConstructorReturn(this, (_ref = EmploymentForm.__proto__ || Object.getPrototypeOf(EmploymentForm)).call.apply(_ref, [this].concat(args))), _this), _this.addEmployment = function () {
      var _this$props = _this.props,
          dispatch = _this$props.dispatch,
          employments = _this$props.employments;

      dispatch(reactReduxForm.actions.push('formData.employments', _extends({}, models.Employment, { id: uniqueInteger(employments)
      })));
    }, _this.removeEmployment = function (index) {
      var dispatch = _this.props.dispatch;

      dispatch(reactReduxForm.actions.remove('formData.employments', index));
    }, _temp), possibleConstructorReturn(_this, _ret);
  }

  createClass(EmploymentForm, [{
    key: 'render',
    value: function render$$1() {
      var _this2 = this;

      var employments = this.props.employments;

      return React.createElement(
        FormSection$1,
        { id: 'employments', className: 'form-list' },
        React.createElement(
          'h2',
          null,
          'Employment History'
        ),
        employments.map(function (e, i) {
          return React.createElement(
            reactReduxForm.Form,
            { model: reactReduxForm.track('formData.employments[]', { id: e.id }), className: 'form-item' },
            React.createElement(
              'h3',
              null,
              'Employment ',
              i + 1,
              React.createElement(
                'button',
                { className: 'remove-button', onClick: function onClick() {
                    _this2.removeEmployment(i);
                  } },
                'X'
              )
            ),
            React.createElement(
              'div',
              { className: 'row' },
              React.createElement(
                'div',
                { className: 'field col-md-6' },
                React.createElement(
                  'label',
                  null,
                  'Employer Name'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.employer_name' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-6' },
                React.createElement(
                  'label',
                  null,
                  'Position'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.position' })
              )
            ),
            React.createElement(
              'div',
              { className: 'row' },
              React.createElement(
                'div',
                { className: 'field col-md-4' },
                React.createElement(
                  'label',
                  null,
                  'Start Date'
                ),
                React.createElement(CustomControl, { model: '.start_date' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-4' },
                React.createElement(
                  'label',
                  null,
                  'End Date'
                ),
                React.createElement(CustomControl, { model: '.end_date' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-2' },
                React.createElement(
                  'label',
                  null,
                  'Current'
                ),
                React.createElement(reactReduxForm.Control.checkbox, { model: '.current' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-2' },
                React.createElement(
                  'label',
                  null,
                  'Part Time'
                ),
                React.createElement(reactReduxForm.Control.checkbox, { model: '.part_tie' })
              )
            ),
            React.createElement(
              'div',
              { className: 'row' },
              React.createElement(
                'div',
                { className: 'field col-md-6' },
                React.createElement(
                  'label',
                  null,
                  'Phone'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.phone' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-6' },
                React.createElement(
                  'label',
                  null,
                  'Supervisor Name'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.supervisor_name' })
              )
            ),
            React.createElement(
              'div',
              { className: 'row' },
              React.createElement(
                'div',
                { className: 'field col-md-5' },
                React.createElement(
                  'label',
                  null,
                  'Street'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.address.street' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-5' },
                React.createElement(
                  'label',
                  null,
                  'City'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.address.city' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-2' },
                React.createElement(
                  'label',
                  null,
                  'State'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.address.state' })
              )
            )
          );
        }),
        React.createElement(
          'div',
          { className: 'sub-section' },
          React.createElement(
            'button',
            { onClick: this.addEmployment },
            'Add Employment'
          )
        )
      );
    }
  }]);
  return EmploymentForm;
}(react.Component);

var mapStateToProps$6 = function mapStateToProps(state) {
  return {
    employments: state.formData.employments
  };
};

var EmploymentForm$1 = reactRedux.connect(mapStateToProps$6)(EmploymentForm);

var CriminalHistoryForm = function (_Component) {
  inherits(CriminalHistoryForm, _Component);

  function CriminalHistoryForm() {
    var _ref;

    var _temp, _this, _ret;

    classCallCheck(this, CriminalHistoryForm);

    for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
      args[_key] = arguments[_key];
    }

    return _ret = (_temp = (_this = possibleConstructorReturn(this, (_ref = CriminalHistoryForm.__proto__ || Object.getPrototypeOf(CriminalHistoryForm)).call.apply(_ref, [this].concat(args))), _this), _this.addCriminalHistory = function () {
      var _this$props = _this.props,
          dispatch = _this$props.dispatch,
          criminal_histories = _this$props.criminal_histories;

      dispatch(reactReduxForm.actions.push('formData.criminal_histories', _extends({}, models.CriminalHistory, { id: uniqueInteger(criminal_histories)
      })));
    }, _this.removeCriminalHistory = function (index) {
      var dispatch = _this.props.dispatch;

      dispatch(reactReduxForm.actions.remove('formData.criminal_histories', index));
    }, _temp), possibleConstructorReturn(_this, _ret);
  }

  createClass(CriminalHistoryForm, [{
    key: 'render',
    value: function render$$1() {
      var _this2 = this;

      var criminal_histories = this.props.criminal_histories;

      return React.createElement(
        FormSection$1,
        { id: 'criminal_histories', className: 'form-list' },
        React.createElement(
          'h2',
          null,
          'Criminal History'
        ),
        criminal_histories.map(function (c, i) {
          return React.createElement(
            reactReduxForm.Form,
            { model: reactReduxForm.track('formData.criminal_histories[]', { id: c.id }), className: 'form-item' },
            React.createElement(
              'h3',
              null,
              'Criminal History ',
              i + 1,
              React.createElement(
                'button',
                { className: 'remove-button', onClick: function onClick() {
                    _this2.removeCriminalHistory(i);
                  } },
                'X'
              )
            ),
            React.createElement(
              'div',
              { className: 'row' },
              React.createElement(
                'div',
                { className: 'field col-md-6' },
                React.createElement(
                  'label',
                  null,
                  'Crime Type'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.crime_type' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-3' },
                React.createElement(
                  'label',
                  null,
                  'Year'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.year' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-3' },
                React.createElement(
                  'label',
                  null,
                  'State'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.state' })
              )
            )
          );
        }),
        React.createElement(
          'div',
          { className: 'sub-section' },
          React.createElement(
            'button',
            { onClick: this.addCriminalHistory },
            'Add Criminal History'
          )
        )
      );
    }
  }]);
  return CriminalHistoryForm;
}(react.Component);

var mapStateToProps$7 = function mapStateToProps(state) {
  return {
    criminal_histories: state.formData.criminal_histories
  };
};

var CriminalHistoryForm$1 = reactRedux.connect(mapStateToProps$7)(CriminalHistoryForm);

var ContactForm = function (_Component) {
  inherits(ContactForm, _Component);

  function ContactForm() {
    var _ref;

    var _temp, _this, _ret;

    classCallCheck(this, ContactForm);

    for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
      args[_key] = arguments[_key];
    }

    return _ret = (_temp = (_this = possibleConstructorReturn(this, (_ref = ContactForm.__proto__ || Object.getPrototypeOf(ContactForm)).call.apply(_ref, [this].concat(args))), _this), _this.addContact = function () {
      var _this$props = _this.props,
          dispatch = _this$props.dispatch,
          contacts = _this$props.contacts;

      dispatch(reactReduxForm.actions.push('formData.contacts', _extends({}, models.Contact, { id: uniqueInteger(contacts)
      })));
    }, _this.removeContact = function (index) {
      var dispatch = _this.props.dispatch;

      dispatch(reactReduxForm.actions.remove('formData.contacts', index));
    }, _temp), possibleConstructorReturn(_this, _ret);
  }

  createClass(ContactForm, [{
    key: 'render',
    value: function render$$1() {
      var _this2 = this;

      var contacts = this.props.contacts;


      return React.createElement(
        FormSection$1,
        { id: 'contacts', className: 'form-list' },
        React.createElement(
          'h2',
          null,
          'Contacts'
        ),
        contacts.map(function (c, i) {
          return React.createElement(
            reactReduxForm.Form,
            { model: reactReduxForm.track('formData.contacts[]', { id: c.id }), className: 'form-item' },
            React.createElement(
              'h3',
              null,
              'Contact ',
              i + 1,
              React.createElement(
                'button',
                { className: 'remove-button', onClick: function onClick() {
                    _this2.removeContact(i);
                  } },
                'X'
              )
            ),
            React.createElement(
              'div',
              { className: 'row' },
              React.createElement(
                'div',
                { className: 'field col-md-6' },
                React.createElement(
                  'label',
                  null,
                  'First Name'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.first_name' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-6' },
                React.createElement(
                  'label',
                  null,
                  'Last Name'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.last_name' })
              )
            ),
            React.createElement(
              'div',
              { className: 'row' },
              React.createElement(
                'div',
                { className: 'field' },
                React.createElement(
                  'label',
                  null,
                  'Relationship'
                ),
                React.createElement(
                  reactReduxForm.Control.select,
                  { model: '.relationship' },
                  React.createElement('option', { value: '' }),
                  React.createElement(
                    'option',
                    { value: 'Spouse' },
                    'Spouse'
                  ),
                  React.createElement(
                    'option',
                    { value: 'Mother' },
                    'Mother'
                  ),
                  React.createElement(
                    'option',
                    { value: 'Father' },
                    'Father'
                  ),
                  React.createElement(
                    'option',
                    { value: 'Sister' },
                    'Sister'
                  ),
                  React.createElement(
                    'option',
                    { value: 'Brother' },
                    'Brother'
                  ),
                  React.createElement(
                    'option',
                    { value: 'Daughter' },
                    'Daughter'
                  ),
                  React.createElement(
                    'option',
                    { value: 'Son' },
                    'Son'
                  ),
                  React.createElement(
                    'option',
                    { value: 'Grandmother' },
                    'Grandmother'
                  ),
                  React.createElement(
                    'option',
                    { value: 'Grandfather' },
                    'Grandfather'
                  ),
                  React.createElement(
                    'option',
                    { value: 'Friend' },
                    'Friend'
                  )
                )
              )
            ),
            React.createElement(
              'div',
              { className: 'row' },
              React.createElement(
                'div',
                { className: 'field col-md-4' },
                React.createElement(
                  'label',
                  null,
                  'Home Phone'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.home_phone' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-4' },
                React.createElement(
                  'label',
                  null,
                  'Cell Phone'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.cell_phone' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-4' },
                React.createElement(
                  'label',
                  null,
                  'Work Phone'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.work_phone' })
              )
            ),
            React.createElement(
              'div',
              { className: 'row' },
              React.createElement(
                'div',
                { className: 'field col-md-4' },
                React.createElement(
                  'label',
                  null,
                  'Street'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.address.street' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-4' },
                React.createElement(
                  'label',
                  null,
                  'City'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.address.city' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-2' },
                React.createElement(
                  'label',
                  null,
                  'State'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.address.state' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-2' },
                React.createElement(
                  'label',
                  null,
                  'Zip'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.address.zip' })
              )
            )
          );
        }),
        React.createElement(
          'div',
          { className: 'sub-section' },
          React.createElement(
            'button',
            { onClick: this.addContact },
            'Add Contact'
          )
        )
      );
    }
  }]);
  return ContactForm;
}(react.Component);

var mapStateToProps$8 = function mapStateToProps(state) {
  return {
    contacts: state.formData.contacts
  };
};

var ContactForm$1 = reactRedux.connect(mapStateToProps$8)(ContactForm);

var NavSection = function (_Component) {
  inherits(NavSection, _Component);

  function NavSection() {
    var _ref;

    var _temp, _this, _ret;

    classCallCheck(this, NavSection);

    for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
      args[_key] = arguments[_key];
    }

    return _ret = (_temp = (_this = possibleConstructorReturn(this, (_ref = NavSection.__proto__ || Object.getPrototypeOf(NavSection)).call.apply(_ref, [this].concat(args))), _this), _this.click = function () {
      var anchor = _this.props.anchor;

      Jump(anchor, {
        easing: easeInOutQuad
      });
    }, _temp), possibleConstructorReturn(_this, _ret);
  }

  createClass(NavSection, [{
    key: 'render',
    value: function render$$1() {
      var _props = this.props,
          label = _props.label,
          inViewSection = _props.inViewSection,
          anchor = _props.anchor;

      return React.createElement(
        'div',
        {
          className: 'nav-section ' + (inViewSection == anchor ? 'in-view' : ''),
          onMouseDown: this.click },
        label
      );
    }
  }]);
  return NavSection;
}(react.Component);

var mapStateToNavProps = function mapStateToNavProps(state) {
  return {
    inViewSection: state.inViewSection
  };
};

NavSection = reactRedux.connect(mapStateToNavProps)(NavSection);

var Nav = function (_Component2) {
  inherits(Nav, _Component2);

  function Nav() {
    var _ref2;

    var _temp2, _this2, _ret2;

    classCallCheck(this, Nav);

    for (var _len2 = arguments.length, args = Array(_len2), _key2 = 0; _key2 < _len2; _key2++) {
      args[_key2] = arguments[_key2];
    }

    return _ret2 = (_temp2 = (_this2 = possibleConstructorReturn(this, (_ref2 = Nav.__proto__ || Object.getPrototypeOf(Nav)).call.apply(_ref2, [this].concat(args))), _this2), _this2.openBuildingList = function () {
      var dispatch = _this2.props.dispatch;

      dispatch({ type: 'ACTIVATE_BUILDING_LIST' });
    }, _this2.submit = function () {
      var _this2$props = _this2.props,
          dispatch = _this2$props.dispatch,
          selectedBuildings = _this2$props.selectedBuildings;

      if (selectedBuildings.length === 0) {
        alert('Please add at least one building.');
        return;
      }
      dispatch({
        type: 'SET_QUEUE',
        queue: selectedBuildings
      });
    }, _this2.uploadToBox = function () {
      var dispatch = _this2.props.dispatch;

      dispatch({ type: 'SET_STATUS', status: 'FETCHING' });
      apexActions.uploadPDFsToBox();
    }, _temp2), possibleConstructorReturn(_this2, _ret2);
  }

  createClass(Nav, [{
    key: 'render',
    value: function render$$1() {
      var _props2 = this.props,
          failed = _props2.failed,
          status = _props2.status,
          fetching = _props2.fetching,
          selectedBuildings = _props2.selectedBuildings;

      return React.createElement(
        'nav',
        null,
        React.createElement(
          'div',
          { className: 'nav-sections-wrapper' },
          React.createElement(
            'div',
            { className: 'nav-sections' },
            React.createElement(NavSection, {
              anchor: '#contact_information',
              label: 'General' }),
            React.createElement(NavSection, {
              anchor: '#addresses',
              label: 'Addresses' }),
            React.createElement(NavSection, {
              anchor: '#household_members',
              label: 'Household' }),
            React.createElement(NavSection, {
              anchor: '#incomes',
              label: 'Income' }),
            React.createElement(NavSection, {
              anchor: '#employments',
              label: 'Employment' }),
            React.createElement(NavSection, {
              anchor: '#criminal_histories',
              label: 'Record' }),
            React.createElement(NavSection, {
              anchor: '#contacts',
              label: 'Contacts' })
          )
        ),
        status == 'READY' && React.createElement(
          'button',
          { onClick: this.openBuildingList },
          'Add Buildings'
        ),
        status == 'READY' && React.createElement(
          'button',
          { onClick: this.submit, className: selectedBuildings.length === 0 ? 'disabled' : '' },
          'Submit'
        ),
        status == 'FETCHING' && React.createElement(
          'div',
          { className: 'fetching' },
          React.createElement(
            'div',
            { className: 'fetching-which' },
            'generating pdf for ',
            React.createElement(
              'b',
              null,
              fetching.name
            ),
            '...'
          ),
          React.createElement(
            'div',
            { className: 'spinner' },
            React.createElement('div', { className: 'rect1' }),
            React.createElement('div', { className: 'rect2' }),
            React.createElement('div', { className: 'rect3' }),
            React.createElement('div', { className: 'rect4' }),
            React.createElement('div', { className: 'rect5' })
          )
        ),
        status == 'PDFS_READY' && React.createElement(
          'button',
          { onClick: this.uploadToBox },
          'Upload to Box'
        ),
        status == 'COMPLETE' && React.createElement(
          'h3',
          null,
          'Done.'
        ),
        React.createElement(
          'div',
          { className: 'failures' },
          failed.map(function (f, i) {
            return React.createElement(
              'div',
              { className: 'failure' },
              React.createElement(
                'em',
                null,
                'failed to generate pdf for ',
                React.createElement(
                  'b',
                  null,
                  f.building.name
                )
              ),
              React.createElement(
                'p',
                { className: 'error-msg' },
                f.status
              )
            );
          })
        )
      );
    }
  }]);
  return Nav;
}(react.Component);

var mapStateToProps$9 = function mapStateToProps(state) {
  return {
    status: state.status,
    failed: state.failed,
    selectedBuildings: state.selectedBuildings,
    fetchQueue: state.fetchQueue,
    fetching: state.fetching
  };
};

var Nav$1 = reactRedux.connect(mapStateToProps$9)(Nav);

var SelectedBuilding = function (_Component) {
  inherits(SelectedBuilding, _Component);

  function SelectedBuilding() {
    var _ref;

    var _temp, _this, _ret;

    classCallCheck(this, SelectedBuilding);

    for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
      args[_key] = arguments[_key];
    }

    return _ret = (_temp = (_this = possibleConstructorReturn(this, (_ref = SelectedBuilding.__proto__ || Object.getPrototypeOf(SelectedBuilding)).call.apply(_ref, [this].concat(args))), _this), _this.removeBuildingFromForm = function () {
      var _this$props = _this.props,
          dispatch = _this$props.dispatch,
          index = _this$props.index;

      dispatch({
        type: 'REMOVE_BUILDING',
        index: index
      });
      //dispatch(actions.remove('formData.housing_forms', index));
    }, _temp), possibleConstructorReturn(_this, _ret);
  }

  createClass(SelectedBuilding, [{
    key: 'render',
    value: function render$$1() {
      var _props$building = this.props.building,
          name = _props$building.name,
          index = _props$building.index,
          fetchingBuilding = _props$building.fetchingBuilding;

      return React.createElement(
        'div',
        { className: 'selected-building-wrapper' },
        React.createElement(
          'div',
          { className: 'selected-building' },
          React.createElement(
            'h4',
            null,
            name
          ),
          React.createElement(
            'button',
            { className: 'remove-selected-building remove-button', onClick: this.removeBuildingFromForm },
            'X'
          )
        )
      );
    }
  }]);
  return SelectedBuilding;
}(react.Component);

var mapStateToSelectedBuilding = function mapStateToSelectedBuilding(state) {
  return {
    fetchingBuilding: state.fetchingBuilding
  };
};

SelectedBuilding = reactRedux.connect(mapStateToSelectedBuilding)(SelectedBuilding);

var Building = function (_Component2) {
  inherits(Building, _Component2);

  function Building() {
    var _ref2;

    var _temp2, _this2, _ret2;

    classCallCheck(this, Building);

    for (var _len2 = arguments.length, args = Array(_len2), _key2 = 0; _key2 < _len2; _key2++) {
      args[_key2] = arguments[_key2];
    }

    return _ret2 = (_temp2 = (_this2 = possibleConstructorReturn(this, (_ref2 = Building.__proto__ || Object.getPrototypeOf(Building)).call.apply(_ref2, [this].concat(args))), _this2), _this2.addBuildingToForm = function () {
      var _this2$props = _this2.props,
          dispatch = _this2$props.dispatch,
          building = _this2$props.building;

      dispatch({
        type: 'SELECT_BUILDING',
        building: building
      });
      //dispatch(actions.push('formData.housing_forms', building ));
    }, _temp2), possibleConstructorReturn(_this2, _ret2);
  }

  createClass(Building, [{
    key: 'render',
    value: function render$$1() {
      var _props$building2 = this.props.building,
          name = _props$building2.name,
          application_fee = _props$building2.application_fee,
          application_info = _props$building2.application_info,
          bedrooms_open = _props$building2.bedrooms_open,
          bedrooms_offered = _props$building2.bedrooms_offered,
          address = _props$building2.address,
          building_phone = _props$building2.building_phone,
          company_phone = _props$building2.company_phone,
          wait_length = _props$building2.wait_length,
          waitlist_open = _props$building2.waitlist_open,
          waitlist_closed_until = _props$building2.waitlist_closed_until,
          _props$building2$elig = _props$building2.eligibility,
          mobility_impairment = _props$building2$elig.mobility_impairment,
          minimum_age_with_disability = _props$building2$elig.minimum_age_with_disability,
          minimum_age_without_disability = _props$building2$elig.minimum_age_without_disability,
          required_proofs = _props$building2.required_proofs,
          id = _props$building2.id,
          last_applied = _props$building2.last_applied;
      var selectedBuildings = this.props.selectedBuildings;


      if (getIndex(selectedBuildings, id) !== false) return null;

      return React.createElement(
        'div',
        { className: 'building col-md-4', onClick: this.addBuildingToForm },
        React.createElement(
          'div',
          { className: 'building-details' },
          React.createElement(
            'h3',
            null,
            name
          ),
          React.createElement(
            'div',
            { className: 'building-detail' },
            React.createElement(
              'label',
              null,
              'Address'
            ),
            React.createElement(
              'p',
              null,
              address
            )
          ),
          React.createElement(
            'div',
            { className: 'building-detail' },
            React.createElement(
              'label',
              null,
              'Bedrooms Open'
            ),
            React.createElement(
              'p',
              null,
              bedrooms_open
            )
          ),
          last_applied && React.createElement(
            'div',
            { className: 'building-detail' },
            React.createElement(
              'label',
              null,
              'Last Applied'
            ),
            React.createElement(
              'p',
              null,
              last_applied
            )
          ),
          React.createElement(
            'div',
            { className: 'more-details' },
            React.createElement(
              'div',
              { className: 'building-detail' },
              React.createElement(
                'label',
                null,
                'Mobility Impairment Required'
              ),
              React.createElement(
                'p',
                null,
                mobility_impairment ? 'Yes' : 'No'
              )
            ),
            React.createElement(
              'div',
              { className: 'building-detail' },
              React.createElement(
                'label',
                null,
                'Minimum Age with Disablity'
              ),
              React.createElement(
                'p',
                null,
                minimum_age_with_disability === 0 ? 'None' : minimum_age_with_disability
              )
            ),
            React.createElement(
              'div',
              { className: 'building-detail' },
              React.createElement(
                'label',
                null,
                'Minimum Age without Disability'
              ),
              React.createElement(
                'p',
                null,
                minimum_age_without_disability === 0 ? 'None' : minimum_age_without_disability
              )
            )
          )
        )
      );
    }
  }]);
  return Building;
}(react.Component);

var mapStateToBuildingProps = function mapStateToBuildingProps(state) {
  return {
    selectedBuildings: state.selectedBuildings
  };
};

Building = reactRedux.connect(mapStateToBuildingProps)(Building);

var BuildingList = function (_Component3) {
  inherits(BuildingList, _Component3);

  function BuildingList() {
    var _ref3;

    var _temp3, _this3, _ret3;

    classCallCheck(this, BuildingList);

    for (var _len3 = arguments.length, args = Array(_len3), _key3 = 0; _key3 < _len3; _key3++) {
      args[_key3] = arguments[_key3];
    }

    return _ret3 = (_temp3 = (_this3 = possibleConstructorReturn(this, (_ref3 = BuildingList.__proto__ || Object.getPrototypeOf(BuildingList)).call.apply(_ref3, [this].concat(args))), _this3), _this3.filterBuildings = function () {
      var _this3$props = _this3.props,
          buildings = _this3$props.buildings,
          _this3$props$eligibil = _this3$props.eligibility,
          age = _this3$props$eligibil.age,
          mobility_impairment = _this3$props$eligibil.mobility_impairment,
          disability = _this3$props$eligibil.disability,
          rooms_requested = _this3$props$eligibil.rooms_requested,
          waitlist_open = _this3$props$eligibil.waitlist_open;

      var filtered = buildings.filter(function (b) {
        if (waitlist_open && !b.waitlist_open) return false;
        if (!b.eligibility.rooms_available) return false;
        if (!mobility_impairment && age < 62 && b.eligibility.mobility_impairment === true) return false;
        if (!disability && b.eligibility.disability === true) return false;
        if (b.eligibility.minimum_age_with_disability) {
          if (disability && age < b.eligibility.minimum_age_with_disability) return false;
        }
        if (b.eligibility.minimum_age_without_disability) {
          if (!disability && age < b.eligibility.minimum_age_without_disability) return false;
        }
        if (rooms_requested != '' && rooms_requested !== null) {
          if (b.eligibility.rooms_available.indexOf(rooms_requested) == -1) return false;
        }

        return true;
      });

      return filtered;
    }, _this3.setElig = function (fieldName, value) {
      var dispatch = _this3.props.dispatch;

      dispatch({
        type: 'SET_ELIGIBILITY',
        name: fieldName,
        value: value
      });
    }, _this3.closeBuildingList = function () {
      var dispatch = _this3.props.dispatch;

      dispatch({ type: 'DEACTIVATE_BUILDING_LIST' });
    }, _temp3), possibleConstructorReturn(_this3, _ret3);
  }

  createClass(BuildingList, [{
    key: 'render',
    value: function render$$1() {
      var _this4 = this;

      var _props = this.props,
          buildingListActive = _props.buildingListActive,
          selectedBuildings = _props.selectedBuildings,
          _props$eligibility = _props.eligibility,
          mobility_impairment = _props$eligibility.mobility_impairment,
          disability = _props$eligibility.disability,
          age = _props$eligibility.age,
          rooms_requested = _props$eligibility.rooms_requested,
          waitlist_open = _props$eligibility.waitlist_open;

      var buildings = this.filterBuildings();
      var options = [];
      var applied = [];
      var _iteratorNormalCompletion = true;
      var _didIteratorError = false;
      var _iteratorError = undefined;

      try {
        for (var _iterator = buildings[Symbol.iterator](), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
          var b = _step.value;

          if (b.last_applied) applied.push(b);else options.push(b);
        }
      } catch (err) {
        _didIteratorError = true;
        _iteratorError = err;
      } finally {
        try {
          if (!_iteratorNormalCompletion && _iterator.return) {
            _iterator.return();
          }
        } finally {
          if (_didIteratorError) {
            throw _iteratorError;
          }
        }
      }

      return React.createElement(
        'div',
        { id: 'building-list', className: buildingListActive ? 'container active' : 'container' },
        React.createElement(
          'button',
          { onClick: this.closeBuildingList, className: 'close-button' },
          'X'
        ),
        React.createElement(
          'div',
          { className: 'eligibility' },
          React.createElement(
            'h6',
            null,
            'Filter by'
          ),
          React.createElement(
            'div',
            { className: 'eligibility-inputs row' },
            React.createElement(
              'div',
              { className: 'field col-md-3' },
              React.createElement(
                'label',
                null,
                'Mobility Impairment'
              ),
              React.createElement('input', { type: 'checkbox', value: mobility_impairment, checked: mobility_impairment, onChange: function onChange(e) {
                  _this4.setElig('mobility_impairment', !mobility_impairment);
                } })
            ),
            React.createElement(
              'div',
              { className: 'field col-md-3' },
              React.createElement(
                'label',
                null,
                'Disability'
              ),
              React.createElement('input', { type: 'checkbox', value: disability, checked: disability, onChange: function onChange(e) {
                  _this4.setElig('disability', !disability);
                } })
            ),
            React.createElement(
              'div',
              { className: 'field col-md-2' },
              React.createElement(
                'label',
                null,
                'Age'
              ),
              React.createElement('input', { type: 'text', value: age, onChange: function onChange(e) {
                  _this4.setElig('age', e.target.value);
                } })
            ),
            React.createElement(
              'div',
              { className: 'field col-md-2' },
              React.createElement(
                'label',
                null,
                'Rooms Needed'
              ),
              React.createElement(
                'select',
                { onChange: function onChange(e) {
                    _this4.setElig('rooms_requested', e.target.value);
                  } },
                React.createElement('option', { value: '', selected: rooms_requested == "" || rooms_requested == null }),
                React.createElement(
                  'option',
                  { value: '1', selected: rooms_requested == "1" },
                  '1'
                ),
                React.createElement(
                  'option',
                  { value: '2', selected: rooms_requested == "2" },
                  '2'
                ),
                React.createElement(
                  'option',
                  { value: '3', selected: rooms_requested == "3" },
                  '3'
                ),
                React.createElement(
                  'option',
                  { value: '4', selected: rooms_requested == "4" },
                  '4'
                ),
                React.createElement(
                  'option',
                  { value: '5', selected: rooms_requested == "5" },
                  '5'
                )
              )
            ),
            React.createElement(
              'div',
              { className: 'field col-md-2' },
              React.createElement(
                'label',
                null,
                'Open Waitlist'
              ),
              React.createElement('input', { type: 'checkbox', value: waitlist_open, checked: waitlist_open, onChange: function onChange(e) {
                  _this4.setElig('waitlist_open', !waitlist_open);
                } })
            )
          )
        ),
        React.createElement(
          'div',
          { className: 'row column-wrapper' },
          React.createElement(
            'div',
            { className: 'col-md-9 building-options' },
            React.createElement(
              'div',
              { className: 'row' },
              options.map(function (b, j) {
                return React.createElement(Building, { building: b });
              })
            ),
            applied.length && React.createElement(
              'h6',
              null,
              'Already Applied'
            ),
            React.createElement(
              'div',
              { className: 'row' },
              applied.map(function (b, j) {
                return React.createElement(Building, { building: b });
              })
            )
          ),
          React.createElement(
            'div',
            { className: 'col-md-3 selected-buildings' },
            React.createElement(
              'h6',
              null,
              'Selected'
            ),
            React.createElement(
              'div',
              { className: 'row' },
              selectedBuildings.map(function (s, i) {
                return React.createElement(SelectedBuilding, { index: i, building: s });
              })
            )
          )
        )
      );
    }
  }]);
  return BuildingList;
}(react.Component);

var mapStateToProps$10 = function mapStateToProps(state) {
  return {
    buildings: state.buildings,
    eligibility: state.eligibility,
    selectedBuildings: state.selectedBuildings,
    buildingListActive: state.buildingListActive
  };
};

var BuildingList$1 = reactRedux.connect(mapStateToProps$10)(BuildingList);

var Overlay = function (_Component) {
  inherits(Overlay, _Component);

  function Overlay() {
    var _ref;

    var _temp, _this, _ret;

    classCallCheck(this, Overlay);

    for (var _len = arguments.length, args = Array(_len), _key = 0; _key < _len; _key++) {
      args[_key] = arguments[_key];
    }

    return _ret = (_temp = (_this = possibleConstructorReturn(this, (_ref = Overlay.__proto__ || Object.getPrototypeOf(Overlay)).call.apply(_ref, [this].concat(args))), _this), _this.closeBuildingList = function () {
      var dispatch = _this.props.dispatch;

      dispatch({ type: 'DEACTIVATE_BUILDING_LIST' });
    }, _temp), possibleConstructorReturn(_this, _ret);
  }

  createClass(Overlay, [{
    key: 'render',
    value: function render$$1() {
      var active = this.props.active;

      return React.createElement('div', { id: 'overlay',
        className: active ? 'active' : '',
        onClick: this.closeBuildingList });
    }
  }]);
  return Overlay;
}(react.Component);

var mapStateToProps$11 = function mapStateToProps(state) {
  return {
    active: state.buildingListActive
  };
};

var Overlay$1 = reactRedux.connect(mapStateToProps$11)(Overlay);

var status = function status() {
  var state = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 'READY';
  var action = arguments[1];

  switch (action.type) {
    case 'SET_STATUS':
      return action.status;
    case 'SHIFT_QUEUE':
      return 'FETCHING';
    default:
      return state;
  }
};

var fetching = function fetching() {
  var state = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
  var action = arguments[1];

  switch (action.type) {
    case 'SHIFT_QUEUE':
      return action.building;
    case 'SET_STATUS':
      if (action.status == 'COMPLETE') return {};
      return state;
    default:
      return state;
  }
};

var pdfResults = function pdfResults() {
  var state = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : [];
  var action = arguments[1];

  switch (action.type) {
    case 'SET_PDF_RESULTS':
      return [].concat(toConsumableArray(action.pdfResults));
    default:
      return state;
  }
};

var scrollPosition = function scrollPosition() {
  var state = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 0;
  var action = arguments[1];

  switch (action.type) {
    case 'SET_SCROLL_POSITION':
      return action.scrollPosition;
    default:
      return state;
  }
};

var inViewSection = function inViewSection() {
  var state = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : '';
  var action = arguments[1];

  switch (action.type) {
    case 'SET_IN_VIEW_SECTION':
      return action.id;
    default:
      return state;
  }
};

var buildings = function buildings() {
  var state = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : [];
  var action = arguments[1];

  switch (action.type) {
    case 'SET_BUILDING_DATA':
      return action.buildings;
    default:
      return state;
  }
};

var eligibility = function eligibility() {
  var state = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {
    age: null,
    mobility_impairment: null,
    disability: null,
    rooms_requested: null,
    waitlist_open: true
  };
  var action = arguments[1];

  switch (action.type) {
    case 'SET_ELIGIBILITY_DATA':
      return _extends({}, state, action.eligibility);
    case 'SET_ELIGIBILITY':
      return _extends({}, state, defineProperty({}, action.name, action.value));
    default:
      return state;
  }
};

var selectedBuildings = function selectedBuildings() {
  var state = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : [];
  var action = arguments[1];

  var selected = void 0;
  switch (action.type) {
    case 'SELECT_BUILDING':
      return [].concat(toConsumableArray(state), [action.building]);
    case 'REMOVE_BUILDING':
      selected = [].concat(toConsumableArray(state));
      selected.splice(action.index, 1);
      return selected;
    default:
      return state;
  }
};

var fetchingBuilding = function fetchingBuilding() {
  var state = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
  var action = arguments[1];

  switch (action.type) {
    case 'FETCH_BUILDING':
      return action.building;
    default:
      return state;
  }
};

var fetchQueue = function fetchQueue() {
  var state = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : [];
  var action = arguments[1];

  switch (action.type) {
    case 'SET_QUEUE':
      return [].concat(toConsumableArray(action.queue));
    case 'SHIFT_QUEUE':
      var queue = [].concat(toConsumableArray(state));
      queue.shift();
      return queue;
    default:
      return state;
  }
};

var failed = function failed() {
  var state = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : [];
  var action = arguments[1];

  switch (action.type) {
    case 'ADD_FAILURE':
      return [].concat(toConsumableArray(state), [{ building: _extends({}, action.building), status: action.status }]);
    default:
      return state;
  }
};

var buildingListActive = function buildingListActive() {
  var state = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
  var action = arguments[1];

  switch (action.type) {
    case 'DEACTIVATE_BUILDING_LIST':
      return false;
    case 'ACTIVATE_BUILDING_LIST':
      return true;
    case 'TOGGLE_BUILDING_LIST':
      return !state;
    default:
      return state;
  }
};



var reducers = Object.freeze({
	status: status,
	pdfResults: pdfResults,
	scrollPosition: scrollPosition,
	inViewSection: inViewSection,
	eligibility: eligibility,
	buildings: buildings,
	selectedBuildings: selectedBuildings,
	buildingListActive: buildingListActive,
	fetchingBuilding: fetchingBuilding,
	fetching: fetching,
	fetchQueue: fetchQueue,
	failed: failed
});

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
        Main$1,
        null,
        React.createElement(BuildingList$1, null),
        React.createElement(Overlay$1, null),
        React.createElement(
          'article',
          null,
          React.createElement(
            'h1',
            null,
            'MEGA APP'
          ),
          React.createElement(PersonForm$1, null),
          React.createElement(AddressForm$1, null),
          React.createElement(HouseholdMemberForm$1, null),
          React.createElement(IncomeForm$1, null),
          React.createElement(EmploymentForm$1, null),
          React.createElement(CriminalHistoryForm$1, null),
          React.createElement(ContactForm$1, null)
        ),
        React.createElement(Nav$1, null)
      );
    }
  }]);
  return App;
}(react.Component);

var HapForm = function () {
  function HapForm() {
    var _this2 = this;

    var state = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : initialState;
    var idSelector = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 'app';
    classCallCheck(this, HapForm);

    this.fetchBuilding = function () {
      var dispatch = _this2.store.dispatch;

      var _store$getState = _this2.store.getState(),
          selectedBuildings$$1 = _store$getState.selectedBuildings,
          status$$1 = _store$getState.status,
          fetchQueue$$1 = _store$getState.fetchQueue,
          formData = _store$getState.formData;

      var building = fetchQueue$$1[0];

      dispatch({
        type: 'SHIFT_QUEUE',
        building: building
      });

      var submitData = {
        applicant: _extends({}, formData),
        form: {
          path: building.application_url,
          name: building.name
        }
      };
      console.log('fetching...');
      delete submitData.applicant.forms;
      console.log(submitData);
      var submitDataString = JSON.stringify(submitData);
      console.log(submitDataString);

      apexActions.fetchPDFs(submitDataString, JSON.stringify(submitData.applicant), building.salesforceId);
    };

    // make archived data compatible with new models
    state.form = _extends({}, initialState.form, state.form);
    this.store = redux.createStore(redux.combineReducers(_extends({}, reducers, {
      formData: reactReduxForm.combineForms(state.form, 'formData')
    })), redux.applyMiddleware(Thunk));

    reactDom.render(React.createElement(
      reactRedux.Provider,
      { store: this.store },
      React.createElement(App, null)
    ), document.getElementById(idSelector));

    this.setEligibility(state.eligibility);
    this.setBuildings(state.buildings);
    this.addScrollListener();

    var queueLen = 0;
    this.store.subscribe(function () {
      var _store$getState2 = _this2.store.getState(),
          fetchQueue$$1 = _store$getState2.fetchQueue,
          status$$1 = _store$getState2.status;

      var queue = fetchQueue$$1;

      if (queue.length === queueLen) {
        return;
      } else if (queue.length > 0 && (status$$1 == 'PDF_FETCHED' || status$$1 == 'READY' || status$$1.indexOf('ERROR') != -1)) {
        queueLen = queue.length;
        _this2.fetchBuilding();
      } else if (queue.length === 0 && (status$$1 == 'PDF_FETCHED' || status$$1 == 'READY' || status$$1.indexOf('ERROR') != -1)) {
        queueLen = 0;
        _this2.store.dispatch({
          type: 'SET_STATUS',
          status: 'COMPLETE'
        });
      }
    });
  }

  createClass(HapForm, [{
    key: 'addScrollListener',
    value: function addScrollListener() {
      var dispatch = this.store.dispatch;


      window.addEventListener('scroll', function (e) {
        dispatch({
          type: 'SET_SCROLL_POSITION',
          scrollPosition: window.scrollTop || window.pageYOffset
        });
      });
    }
  }, {
    key: 'setPDFResults',
    value: function setPDFResults(pdfResults$$1) {
      var dispatch = this.store.dispatch;

      dispatch({ type: 'SET_PDF_RESULTS', pdfResults: pdfResults$$1 });
    }
  }, {
    key: 'setStatus',
    value: function setStatus(status$$1) {
      var dispatch = this.store.dispatch;

      var _store$getState3 = this.store.getState(),
          fetching$$1 = _store$getState3.fetching;

      if (status$$1.indexOf('ERROR') != -1) {
        dispatch({
          type: 'ADD_FAILURE',
          building: fetching$$1,
          status: status$$1
        });
      }
      dispatch({ type: 'SET_STATUS', status: status$$1 });
    }
  }, {
    key: 'setEligibility',
    value: function setEligibility(eligibility$$1) {
      var dispatch = this.store.dispatch;

      dispatch({ type: 'SET_ELIGIBILITY_DATA', eligibility: eligibility$$1 });
    }
  }, {
    key: 'setBuildings',
    value: function setBuildings(buildings$$1) {
      var dispatch = this.store.dispatch;

      dispatch({ type: 'SET_BUILDING_DATA', buildings: buildings$$1 });
    }
  }]);
  return HapForm;
}();

return HapForm;

}(Redux,ReactRedux,ReactReduxForm,ReduxThunk,React,ReactDOM,ApexActions,DayPicker,moment,Jump));
