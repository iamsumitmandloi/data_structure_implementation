//circular doubly liniked list implementation
void main() {
  //append element
  //delete element
  //print element
  //me head ko hath bhi nh laga rha phir bhi vo change ho rha he kese ???????
  Node? addElement(Node? head, int ele) {
    Node? curr = head;
    if (head == null) {
      curr = Node(data: ele);
      curr.next = curr;
      curr.prev = curr;
      print('yeah!!! , first element $ele is append in the list');
      return curr;
    } else {
      while (curr!.next != head) {
        curr = curr.next;
      }
      Node? newNode = Node(data: ele, next: head,prev:curr);
      curr.next = newNode;
      print(' element $ele is append in the list');
      return newNode.next;
    }
  }
  
  Node? getLastEle(Node? head){
    Node? curr = head;
    
    while((curr?.next!=head)??false){
      curr = curr?.next;
    }
    print('and the last ele is ${curr?.data}');
    return curr;
  }

  Node? deleteElement(Node? head, int ele) {
    //when there is no elemengt in the list
    if (head == null) {
      print('the list is empty, can not delete an element');
      return null;
    }
    //when there is only one element in the list
    if (head.next == head) {
      if (head.data == ele) {
        print('element $ele is deleted succesfully');
        return null;
      } else {
        print('element $ele not found for delete');
        return head;
      }
    }

    //when there is more then one element in the list
    Node? curr = head;
    Node? prev;
    while (curr!.next != head && curr!.data != ele) {
//       print('the while loop in delete ${curr.data}');
      prev = curr;
      curr = curr.next;
    }
    //case when the element found
    if (curr.data == ele) {
      if (prev != null) {
        Node? currNext = curr.next;
        currNext?.prev = prev;
        prev.next = currNext;
        print(
            'element $ele is deleted succesfully (case: more than one element)');

        return head;
      } else {
        print('will be deleting the first element $ele head it self');
        //case when we need to delete the first element(head) itself

        // --to sum up -> the last element will point to the curr's next element thats it
       //in this prev will be null
        //and this will only happen when there will be 2 ele and someone wants to delete first ele
        //so for this , we can just 
        
       
//         
        prev = getLastEle(curr);
        var e = curr.next;
        e?.prev = prev;
        prev?.next = e;
        return prev;
      }
    } else {
      print('element $ele not found for delete (case: more than one element)');
      return head;
    }
  }

  void printList(Node? head) {
    Node? curr = head;
    if (curr == null) {
      print('list is empty');
      return;
    }
    String elements = '';
    int count = 0;
    do {
      count++;
      elements = elements + ' ${curr?.data} ,';
      curr = curr?.next;
    } while (curr != null && curr != head);
    print(elements);
    print('the length of the list is -> $count');
    print('---------------------------------------------');
  }
  
 

  Node? head;

  head = addElement(head, 5);
  printList(head);
  head = addElement(head, 12);
  printList(head);
  head = addElement(head, 4);
  printList(head);
  head = addElement(head, 6);
  printList(head);
  head = addElement(head, 7);
  printList(head);
  head = deleteElement(head, 7);
  printList(head);
  head = deleteElement(head, 12);
  printList(head);
  head = deleteElement(head, 4);
  printList(head);
  head = deleteElement(head, 5);
  printList(head);
  head = deleteElement(head, 6);
  printList(head);
  head = addElement(head, 5);
  printList(head);
}

class Node {
  int data;
  Node? next;
  Node? prev;
  Node({
    required this.data,
    this.next = null,
    this.prev = null,
  });
}
