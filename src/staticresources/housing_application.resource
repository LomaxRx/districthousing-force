var HapForm = (function (redux,reactRedux,reactReduxForm,Thunk,react,reactDom,DayPicker,moment,Jump,apexActions) {
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
	"addresses": []
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
			"cell_phone": ''
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
	"HousingForm": "",
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
			"apt": ''
		}
	},
	"CriminalHistory": {
		"id": '',
		"year": '',
		"description": '',
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
	}, defineProperty(_Address, "id", ''), defineProperty(_Address, "city", ''), defineProperty(_Address, "apt", ''), defineProperty(_Address, "residence", false), _Address)
};

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

      var d = moment(day).format('L');
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
      var el = _this.el;
      var _this$props = _this.props,
          dispatch = _this$props.dispatch,
          id = _this$props.id;

      var top = el.getBoundingClientRect().top - 10;
      var bottom = _this.el.offsetHeight + 20;

      if (top < 0 && top > -bottom) {
        dispatch({
          type: 'SET_IN_VIEW_SECTION',
          id: '#' + id
        });
      }
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

var mapStateToProps$1 = function mapStateToProps(state) {
  return {
    scrollPosition: state.scrollPosition
  };
};

var FormSection$1 = reactRedux.connect(mapStateToProps$1)(FormSection);

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
            { className: 'field col-md-5' },
            React.createElement(
              'label',
              null,
              'Start Date'
            ),
            React.createElement(CustomControl, { model: '.start_date' })
          ),
          React.createElement(
            'div',
            { className: 'field col-md-5' },
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
            { className: 'field' },
            React.createElement(
              'label',
              null,
              'Reason for leaving'
            ),
            React.createElement(reactReduxForm.Control.textarea, { model: '.reason' })
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
                  { className: 'field col-md-8' },
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

var mapStateToProps = function mapStateToProps(state) {
  return {
    addresses: state.formData.addresses
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
        FormSection$1,
        { id: 'contact_information' },
        React.createElement(
          'h2',
          null,
          'Contact Information'
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
              React.createElement(reactReduxForm.Control.text, { model: '.citizenship' })
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
              React.createElement(reactReduxForm.Control.text, { model: '.marital_status' })
            ),
            React.createElement(
              'div',
              { className: 'field col-md-6' },
              React.createElement(
                'label',
                null,
                'Student Status'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.student_status' })
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
              React.createElement(reactReduxForm.Control.text, { model: '.gender' })
            ),
            React.createElement(
              'div',
              { className: 'field col-md-4' },
              React.createElement(
                'label',
                null,
                'Race'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.race' })
            ),
            React.createElement(
              'div',
              { className: 'field col-md-4' },
              React.createElement(
                'label',
                null,
                'Ethnicity'
              ),
              React.createElement(reactReduxForm.Control.text, { model: '.ethnicity' })
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

var mapStateToProps$2 = function mapStateToProps(state) {
  return {
    addresses: state.formData.addresses
  };
};

var PersonForm$1 = reactRedux.connect(mapStateToProps$2)(PersonForm);

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
                React.createElement(reactReduxForm.Control.text, { model: '.member.first_name' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-6' },
                React.createElement(
                  'label',
                  null,
                  'Last Name'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.member.last_name' })
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
                React.createElement(reactReduxForm.Control.text, { model: '.relationship' })
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
                React.createElement(reactReduxForm.Control.text, { model: '.member.ssn' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-4' },
                React.createElement(
                  'label',
                  null,
                  'Date of Birth'
                ),
                React.createElement(CustomControl, { model: '.member.dob' })
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
                React.createElement(reactReduxForm.Control.text, { model: '.member.home_phone' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-4' },
                React.createElement(
                  'label',
                  null,
                  'Cell Phone'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.member.cell_phone' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-4' },
                React.createElement(
                  'label',
                  null,
                  'Work Phone'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.member.work_phone' })
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

var mapStateToProps$3 = function mapStateToProps(state) {
  return {
    household_members: state.formData.household_members
  };
};

var HouseholdMemberForm$1 = reactRedux.connect(mapStateToProps$3)(HouseholdMemberForm);

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
                React.createElement(reactReduxForm.Control.text, { model: '.income_type' })
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
                React.createElement(reactReduxForm.Control.text, { model: '.interval' })
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

var mapStateToProps$4 = function mapStateToProps(state) {
  return {
    incomes: state.formData.incomes
  };
};

var IncomeForm$1 = reactRedux.connect(mapStateToProps$4)(IncomeForm);

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

var mapStateToProps$5 = function mapStateToProps(state) {
  return {
    employments: state.formData.employments
  };
};

var EmploymentForm$1 = reactRedux.connect(mapStateToProps$5)(EmploymentForm);

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
                { className: 'field col-md-8' },
                React.createElement(
                  'label',
                  null,
                  'Crime Type'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.crime_type' })
              ),
              React.createElement(
                'div',
                { className: 'field col-md-4' },
                React.createElement(
                  'label',
                  null,
                  'Year'
                ),
                React.createElement(reactReduxForm.Control.text, { model: '.year' })
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
                  'Description'
                ),
                React.createElement(reactReduxForm.Control.textarea, { model: '.description' })
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

var mapStateToProps$6 = function mapStateToProps(state) {
  return {
    criminal_histories: state.formData.criminal_histories
  };
};

var CriminalHistoryForm$1 = reactRedux.connect(mapStateToProps$6)(CriminalHistoryForm);

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

var PDFResult = function PDFResult(props) {
  return React.createElement(
    'div',
    { className: 'pdf-result' },
    React.createElement(
      'a',
      { href: props.url, target: '_blank' },
      props.building
    )
  );
};

var Nav = function (_Component2) {
  inherits(Nav, _Component2);

  function Nav() {
    var _ref2;

    var _temp2, _this2, _ret2;

    classCallCheck(this, Nav);

    for (var _len2 = arguments.length, args = Array(_len2), _key2 = 0; _key2 < _len2; _key2++) {
      args[_key2] = arguments[_key2];
    }

    return _ret2 = (_temp2 = (_this2 = possibleConstructorReturn(this, (_ref2 = Nav.__proto__ || Object.getPrototypeOf(Nav)).call.apply(_ref2, [this].concat(args))), _this2), _this2.submit = function () {
      var _this2$props = _this2.props,
          formData = _this2$props.formData,
          dispatch = _this2$props.dispatch;

      dispatch({ type: 'SET_STATUS', status: 'FETCHING' });
      setTimeout(function () {
        apexActions.fetchPDFs(formData);
      }, 1500);
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
          results = _props2.results,
          status = _props2.status;

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
              label: 'Contact' }),
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
              label: 'Record' })
          )
        ),
        status == 'READY' && React.createElement(
          'button',
          { onClick: this.submit },
          'Submit'
        ),
        status == 'FETCHING' && React.createElement(
          'div',
          { className: 'spinner' },
          React.createElement('div', { className: 'rect1' }),
          React.createElement('div', { className: 'rect2' }),
          React.createElement('div', { className: 'rect3' }),
          React.createElement('div', { className: 'rect4' }),
          React.createElement('div', { className: 'rect5' })
        ),
        status == 'PDFS_READY' && React.createElement(
          'button',
          { onClick: this.uploadToBox },
          'Upload to Box'
        ),
        status == 'COMPLETE' && React.createElement(
          'h3',
          null,
          'Success!'
        ),
        React.createElement(
          'div',
          { className: 'results' },
          results.map(function (r, i) {
            return React.createElement(PDFResult, { url: r.url, building: r.building });
          })
        )
      );
    }
  }]);
  return Nav;
}(react.Component);

var mapStateToProps$7 = function mapStateToProps(state) {
  return {
    status: state.status,
    results: state.pdfResults,
    formData: state.formData
  };
};

var Nav$1 = reactRedux.connect(mapStateToProps$7)(Nav);

var status = function status() {
  var state = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 'READY';
  var action = arguments[1];

  switch (action.type) {
    case 'SET_STATUS':
      return action.status;
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
        React.createElement(
          'article',
          null,
          React.createElement(
            'h1',
            null,
            'Affordable Housing FTW'
          ),
          React.createElement(PersonForm$1, null),
          React.createElement(AddressForm$1, null),
          React.createElement(HouseholdMemberForm$1, null),
          React.createElement(IncomeForm$1, null),
          React.createElement(EmploymentForm$1, null),
          React.createElement(CriminalHistoryForm$1, null)
        ),
        React.createElement(Nav$1, null)
      );
    }
  }]);
  return App;
}(react.Component);

var HapForm = function () {
  function HapForm() {
    var state = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : initialState;
    var idSelector = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 'app';
    classCallCheck(this, HapForm);

    this.store = redux.createStore(redux.combineReducers({
      status: status,
      pdfResults: pdfResults,
      scrollPosition: scrollPosition,
      inViewSection: inViewSection,
      formData: reactReduxForm.combineForms(state, 'formData')
    }), redux.applyMiddleware(Thunk));
    reactDom.render(React.createElement(
      reactRedux.Provider,
      { store: this.store },
      React.createElement(App, null)
    ), document.getElementById(idSelector));

    this.addScrollListener();
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


      dispatch({
        type: 'SET_PDF_RESULTS',
        pdfResults: pdfResults$$1
      });
    }
  }, {
    key: 'setStatus',
    value: function setStatus(status$$1) {
      var dispatch = this.store.dispatch;


      dispatch({
        type: 'SET_STATUS',
        status: status$$1
      });
    }
  }]);
  return HapForm;
}();

return HapForm;

}(Redux,ReactRedux,ReactReduxForm,ReduxThunk,React,ReactDOM,DayPicker,moment,Jump,ApexActions));
