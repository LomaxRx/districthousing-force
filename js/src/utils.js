
export const uniqueInteger = function(list, accessor='id'){
  let max = -1;

  for(let i=0; i<list.length;i++){
    let val = list[i][accessor];
    if(val>max) max = val;
  }

  return max+1;
}

export const getIndex = function(list, id){
  for(let i=0; i<list.length;i++)
    if(list[i].id===id) return i;

  return false;
}
