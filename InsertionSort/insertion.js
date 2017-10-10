var x = [22, 11, 99, 88, 9, 7, 42];

function insertionSort(array) {

  for (var i = 1; i < array.length; i++) {
    for (var j = i; j >= 0 && array[j] < array[j-1]; j--) {
      var temp = array[j];
      array[j] = array[j-1];
      array[j-1] = temp;
    }
  }

  return array;
}

insertionSort(x);
