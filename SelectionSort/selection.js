var x = [22, 11, 99, 88, 9, 7, 42];

function selectionSort(array) {

  for (var i = 0; i < array.length; i++) {
    var min = i;
    for (var j = i+1; j < array.length; j++) {
      if (array[j] < array[min]) {
        min = j;
      }
    }
    var temp = array[i];
    array[i] = array[min];
    array[min] = temp;
  }

  return array;
}

selectionSort(x);
