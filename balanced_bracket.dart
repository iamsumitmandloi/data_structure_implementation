//Check for Balanced Brackets in an expression
void main() {
  String exp = "[(])";//"[()]{}{[()()]()}";//
  int length = exp.length;

  Stack st = Stack(-1, List.generate(length, (i) => ''));

  for (int i = 0; i < length; i++) {
    if (exp[i] == '(' || exp[i] == '{' || exp[i] == '[') {
      st.push(exp[i]);
    } else {
      if ((exp[i] == ')') && st.getTop() == '(') {
        st.pop();
      } else if ((exp[i] == '}') && st.getTop() == '{') {
        st.pop();
      } else if ((exp[i] == ']') && st.getTop() == '[') {
        st.pop();
      }
    }
  }

  if (st.getTop() == -1) {
    print('balanced');
  } else {
    print('not balanced');
  }
}

class Stack {
  int top;
  List arr;
  Stack(this.top, this.arr);

  void push(String ele) {
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

  dynamic getTop() {
    if (top == -1) {
      print('stack is empty');
      return -1;
    } else {
      return arr[top];
    }
  }
}
