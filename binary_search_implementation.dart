void main() {
  List<int> arr = [1, 2, 3, 4, 5, 6, 7, 8, 11];

  int start = 0;
  int end = arr.length - 1;
  int index = 0;
  int middle;
  int se = 11;

  while (start <= end) {
    print('start $start  end $end');
    middle = ((end + start) / 2).floor();
    
    //when element is at middle , start or end.
    if (arr[middle] == se) {
      index = middle;
      print('element is at index $index');
      break;
    }   
    else if (se > arr[middle]) {
      start = middle+1;
    } else {
      end = middle-1;
    }
  }
}
