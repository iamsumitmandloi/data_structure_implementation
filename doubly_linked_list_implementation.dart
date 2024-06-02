void main() {
  //add element
  //delete last node
  //delete element
  //print doubly linked list

  Node? lastNode(Node? head) {
    if (head != null && head.next != null) {
      while (head?.next != null) {
        head = head?.next;
      }
    }
    return head;
  }

  Node? addElement(int ele, Node? head) {
    //when there is not element available in the doubly linked list
    if (head == null) {
      print('Element $ele added successfully');
      return Node(data: ele);
    }
    // for adding an element in the linked list , we normally add it after the last node
    //so first we have to find the last element of the list
    //for that we have created this fun [lastNode()]
    Node? last = lastNode(head);
    //so now we have last node , now we just wanna add the element in the next of this node, and also since it is doubly linked list , so in the prevoius pointer of out latest node we have to give the address of this last node,

    last?.next = Node(data: ele, prev: last);
    print('Element $ele added successfully');
    return head;
  }

  Node? deleteLastNode(Node? head) {
    Node? root = head;

    if (head?.next == null) {
      //condition when there is only one element there in the linked list
      head == null;
      print('first element deleted succesfully');
      return null;
    } else {
      Node? last = lastNode(root);
      Node? secondLast = last?.prev;
      secondLast?.next = null;
    }
    return root;
  }

  Node? deleteElement(Node? head, int ele) {
    Node? prev, curr;
    curr = head;

    while (curr != null && curr.data != ele) {
      prev = curr;
      curr = curr.next;
    }
    //this is for normal condition , where we have the element in need,
    if (curr != null && prev != null) {
      prev.next = curr.next;
    }
    //this is for - when only one element is available in out list
    if (head != null && head == curr) {
      head = head.next;
    }
    return head;
  }

  void printList(Node? head) {
    if (head != null) {
      String elements = '';
      while (head != null) {
        elements = elements + head.data.toString() + ' , ';
        head = head.next;
      }
      print(elements);
    } else {
      print('list is already empty');
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
  head = deleteElement(head, 23);
  printList(head);
  head = deleteElement(head, 7);
  printList(head);

  head = addElement(7, head);
  head = addElement(9, head);
  printList(head);
}

class Node {
  int data;
  Node? next, prev;
  Node({
    required this.data,
    this.next = null,
    this.prev = null,
  });
}
