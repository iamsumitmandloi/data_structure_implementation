
//https://www.geeksforgeeks.org/next-greater-element/

//Next Greater Element (NGE) for every element in given Array

//Given an array, print the Next Greater Element (NGE) for every element.

// The Next greater Element for an element x is the first greater element on the right side of x in the array. Elements for which no greater element exist, consider the next greater element as -1.

//Input: arr[] = [ 4 , 5 , 2 , 25 ]
//Output:      4      –>   5
//             5      –>   25
//             2      –>   25
//            25     –>   -1

void main() {
  List<int> arr = [13, 7, 6, 12]; //[4, 5, 2, 25];

  //question tackled with an array
  for (int i = 0; i < arr.length; i++) {
    int nG = -1;

    for (int j = i + 1; j < arr.length; j++) {
      if (arr[i] < arr[j]) {
        nG = arr[j];
        break;
      }
    }
    print('${arr[i]}    ----    $nG');
  }
  print('-------------------------------------------------');

  //same problem with stack
  //so for stack what we can do now is we will add one element in stack and then loop through our array to find the next greater element
  //if we find the element then we will push another element time

  Stack st = Stack(-1, List.generate(4, (i) => ''));
  for (int i = 0; i < arr.length; i++) {
    st.push(arr[i]);
    int ele = st.getTop();
    for (int j = i + 1; j < arr.length ; j++) {
//       print('$ele < ${arr[j]}');
      if(ele<arr[j]){
        print('$ele --- ${arr[j]}');
        st.pop();
        break;
      }
    }
  }
  while (st.getTop() != -1) {
    print('${st.getTop()} ----   -1');
    st.pop();
  }
}

class Stack {
  int top;
  List arr;
  Stack(this.top, this.arr);

  void push(int ele) {
    if (top == arr.length - 1) {
      print('stack overflow');
    } else {
      top++;
      arr[top] = ele;
    }
  }

  void pop() {
    if (top == -1) {
      print('stack underflow');
    } else {
      top--;
    }
  }

  int getTop() {
    if (top == -1) {
      print('stack is empty');
      return -1;
    } else {
      return arr[top];
    }
  }
}
