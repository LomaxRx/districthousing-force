
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

export const easeInOutQuad = (t, b, c, d) => {
  t /= d / 2
  if (t < 1) return c / 2 * t * t + b
  t--
  return -c / 2 * (t * (t - 2) - 1) + b
}
