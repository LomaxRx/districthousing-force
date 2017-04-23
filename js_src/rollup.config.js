import babel from 'rollup-plugin-babel';

export default {
  entry: 'index.js',
  dest: '../src/staticresources/housing_application.resource',
  format: 'iife',
  moduleName: 'HapForm',
  external: ['react','react-dom','redux','react-redux', 'react-redux-form', 'redux-thunk'],
  globals: {
    'react': 'React',
    'react-dom': 'ReactDOM',
    'redux': 'Redux',
    'react-redux': 'ReactRedux',
    'redux-thunk': 'ReduxThunk',
    'react-redux-form': 'ReactReduxForm'
  },
  plugins: [
    babel({
      exclude: 'node_modules/**'
    })
  ]
};
