//merge sort in dart

void main() {
  List<int> a = [76, 93, 15, 7, 9, 22, 34, 2];

  merge(List<int> a, List<int> b) {
    List<int> c = [];

    int i = 0;
    int j = 0;

    while (i < a.length && j < b.length) {
      if (a[i] > b[j]) {
        c.add(b[j]);
        j++;
      } else {
        c.add(a[i]);
        i++;
      }
    }

    while (i < a.length) {
      c.add(a[i]);
      i++;
    }

    while (j < b.length) {
      c.add(b[j]);
      j++;
    }

    return c;
  }

  breakArr(List<int> arr) {
    if (arr.length == 1) {
      return arr;
    }
    int mid = (arr.length / 2).floor();
    List<int> subArr1 = breakArr(arr.sublist(0, mid));
    List<int> subArr2 = breakArr(arr.sublist(mid, arr.length));

    return merge(subArr1, subArr2);
  }

  print(breakArr(a));
}
