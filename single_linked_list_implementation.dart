void main() {
  List<Node?> lastNode(Node? head) {
    Node? temp = head;
    Node? secondLast;
    while (temp?.next != null) {
      secondLast = temp;
      temp = temp?.next;
    }
    return [temp, secondLast];
  }

  Node? addElement(int ele, Node? head) {
    if (head == null) {
      return Node(data: ele);
    }

    ///a method that will return the last node
    Node? last = lastNode(head)[0];

    //now just add the element at end
    last?.next = Node(data: ele);
    print('element added successfully');
    return head;
  }

  Node? deleteLastNode(Node? head) {
    Node? root = head;
    if (head?.next == null) {
      head = null;

      print('element first deleted successfully');
      return null;
    } else {
      Node? secondLast = lastNode(head)[1];
      secondLast?.next = null;
      print('element seond last deleted successfully');
    }
    return root;
  }

  Node? deleteElement(Node? head, int ele) {
    Node? curr = head;
    Node? prev;

    //for fucking find the element
    while (curr != null && curr.data != ele) {
      prev = curr;
      curr = curr.next;
    }
    if (prev != null && curr != null) {
      prev.next = curr.next;
      print('element $ele successfully deleted');
    }
    if (curr != null && curr == head) {
      head = curr.next;
    }

    return head;
  }

  printList(Node? node) {
    if (node == null) {
      print('already empty');
    } else {
      while (node?.next != null) {
        print(node?.data);
        //stdout.write(node?.data);
        ///stdout.write(' , ');
        node = node?.next;
      }
      print(node?.data);
    }
  }

  Node? head = addElement(23, null);

  addElement(7, head);
  addElement(9, head);
  printList(head);
  head = deleteElement(head, 97);
  printList(head);
  head = deleteElement(head, 9);
  printList(head);
  head = deleteElement(head, 5);
  printList(head);
  head = deleteElement(head, 7);
  printList(head);

  head = addElement(7, head);
  head = addElement(9, head);
  printList(head);
}

class Node {
  int data;
  Node? next;
  Node({
    required this.data,
    this.next = null,
  });
}
