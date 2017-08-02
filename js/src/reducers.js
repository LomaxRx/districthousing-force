const status = function(state='READY', action){
  switch(action.type){
    case 'SET_STATUS':
      return action.status;
    case 'SHIFT_QUEUE':
      return 'FETCHING';
    default:
      return state;
  }
}

const fetching = function(state={}, action){
  switch(action.type){
    case 'SHIFT_QUEUE':
      return action.building;
    case 'SET_STATUS':
      if(action.status=='COMPLETE')
        return {};
      return state;
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

const eligibility = function(state={}, action){
  switch(action.type){
    case 'SET_ELIGIBILITY_DATA':
      return action.eligibility;
    case 'SET_ELIGIBILITY':
      return {
        ...state,
        [action.name]: action.value
      }
    default:
      return state;
  }
}

const selectedBuildings = function(state=[], action){
  let selected;
  switch(action.type){
    case 'SELECT_BUILDING':
      return [...state, action.building];
    case 'REMOVE_BUILDING':
      selected = [...state];
      selected.splice(action.index, 1);
      return selected;
    default:
      return state;
  }
}

const fetchingBuilding = function(state=false, action){
  switch(action.type){
    case 'FETCH_BUILDING':
      return action.building;
    default:
      return state;
  }
}

const fetchQueue = function(state=[], action){
  switch(action.type){
    case 'SET_QUEUE':
      return [...action.queue];
    case 'SHIFT_QUEUE':
      let queue = [...state];
      queue.shift();
      return queue;
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

export {
  status, pdfResults, scrollPosition, inViewSection, eligibility,
  buildings, selectedBuildings, buildingListActive, fetchingBuilding,
  fetching, fetchQueue
};
