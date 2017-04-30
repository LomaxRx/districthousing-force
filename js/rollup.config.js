import babel from 'rollup-plugin-babel';
import sass from 'rollup-plugin-sass';

export default {
  entry: 'src/index.js',
  dest: '../src/staticresources/housing_application.resource',
  format: 'iife',
  moduleName: 'HapForm',
  external: ['react','react-dom','redux','react-redux', 'react-redux-form', 'redux-thunk', 'react-datepicker'],
  globals: {
    'react': 'React',
    'react-dom': 'ReactDOM',
    'redux': 'Redux',
    'react-redux': 'ReactRedux',
    'redux-thunk': 'ReduxThunk',
    'react-redux-form': 'ReactReduxForm',
    'react-datepicker': 'DatePicker'
  },
  plugins: [
    sass({
      output: '../src/staticresources/housing_application_style.resource'
    }),
    babel({
      exclude: 'node_modules/**'
    })
  ]
};
