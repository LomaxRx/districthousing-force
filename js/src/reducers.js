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

const scrollPosition = function(state=0, action){
  switch(action.type){
    case 'SET_SCROLL_POSITION':
      return action.scrollPosition;
    default:
      return state;
  }
}

const inViewSection = function(state='', action){
  switch(action.type){
    case 'SET_IN_VIEW_SECTION':
      return action.id;
    default:
      return state;
  }
}

const buildings = function(state=[], action){
  switch(action.type){
    case 'SET_BUILDING_DATA':
      return action.buildings;
    default:
      return state;
  }
}

const buildingListActive = function(state=false, action){
  switch(action.type){
    case 'DEACTIVATE_BUILDING_LIST':
      return false;
    case 'ACTIVATE_BUILDING_LIST':
      return true;
    case 'TOGGLE_BUILDING_LIST':
      return !state;
    default:
      return state;
  }
}

export { status, pdfResults, scrollPosition, inViewSection, buildings, buildingListActive };
