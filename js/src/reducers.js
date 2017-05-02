const status = function(state='READY', action){
  switch(action.type){
    case 'SET_STATUS':
      return action.status;
    default:
      return state;
  }
}

const pdfResults = function(state=[], action){
  switch(action.type){
    case 'SET_PDF_RESULTS':
      return [...action.pdfResults];
    default:
      return state;
  }
}

export { status, pdfResults };
