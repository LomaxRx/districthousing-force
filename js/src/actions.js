import { submit } from 'apex-actions';

const submitFormData = () => {
  return function(dispatch, getState){
    dispatch({type:'SET_STATUS', status: 'LOADING'});

    let { formData } = getState();

    submit(formData, () => {
      dispatch({type:'SET_STATUS', status: 'COMPLETE'});
    });
  }
}

export { submitFormData };
