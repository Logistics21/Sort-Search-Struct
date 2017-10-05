// Given a string find the position of the first character that does not
// have a duplicate (i.e. is Unique) in the string

var firstUniqChar = function(s) {
    lett_freq = {};
    for (var i = 0; i < s.length; i++) {
        !lett_freq[s[i]] ? lett_freq[s[i]] = 1 : lett_freq[s[i]]++;
    }

    len = s.length;
    for (var j = 0; j < s.length; j++) {
        if (lett_freq[s[j]] === 1) {
            return j;
        }
    }

    return -1;
};

// console.log(firstUniqChar("abacbcla"));


// Given a linked list sort the list with or without the use of additional
// data structures

function ListNode(val) {
    this.val = val;
    this.next = null;
 }

var x = new ListNode(2);
x.next = new ListNode(4);
x.next.next = new ListNode(3);
x.next.next.next = new ListNode(1);

var reverseList = function(head) {
    let prev = null, next = null;
    while (head) {
        next = head.next
        head.next = prev;
        prev = head;
        head = next;
    }

    return prev;
};
var reverseListRec = function(head) {
    if (head === null || head.next === null) return head;
    let new_head = reverseListRec(head.next);
    head.next.next = head;
    head.next = null;
    return new_head;
};

// console.log(reverseList(x))
// console.log(reverseListRec(x))



//Given a inputNode in a Binary Search Tree find the in-Order successor
// of that inputNode
// (i.e the Node with the next highest value)
/********************************************************
 * CODE INSTRUCTIONS:                                   *
 * 1) The method findInOrderSuccessor you're asked      *
 *    to implement is located at line 87.               *
 * 2) Use the helper code below to implement it.        *
 * 3) In a nutshell, the helper code allows you to      *
 *    to build a Binary Search Tree.                    *
 ********************************************************/


// Constructor to create a new Node
function Node(key) {
    this.key = key;
    this.parent = null;
    this.left = null;
    this.right = null;
}

// Constructor to create a new BST
function BinarySearchTree() {
    this.root = null;
}

/********* Solution ************/
BinarySearchTree.prototype.findInOrderSuccessor = function(inputNode) {
    // your code goes here
    // check inputNode's right child
    // check right child's left child

  if (inputNode.right) {
    let rightChild = inputNode.right;
    while (rightChild.left) {
      rightChild = rightChild.left;
    }

    return rightChild;
  } else {
    while (inputNode.parent && inputNode.parent.right === inputNode) {
      inputNode = inputNode.parent;
    }

    return inputNode.parent;
  }
};

// Creates a new node by a key and inserts it to the BST
BinarySearchTree.prototype.insert = function(key) {

    var root = this.root;

    // 1. If the tree is empty, create the root
    if(!root) {
        this.root = new Node(key);
        return;
    }

    // 2) Otherwise, create a node with the key
    //    and traverse down the tree to find where to
    //    to insert it
    var currentNode = root;
    var newNode = new Node(key);

    while(currentNode !== null) {
        if(key < currentNode.key) {
            if(!currentNode.left) {
                currentNode.left = newNode;
                newNode.parent = currentNode;
                break;
            } else {
                currentNode = currentNode.left;
            }
        } else {
            if(!currentNode.right) {
                currentNode.right = newNode;
                newNode.parent = currentNode;
                break;
            } else {
                currentNode = currentNode.right;
            }
        }
    }
}

// Returns a reference to a node in the BST by its key.
// Use this fuction when you need a node to test your
// findInOrderSuccessor function on.
BinarySearchTree.prototype.getNodeByKey = function(key) {
    var currentNode = this.root;

    while(currentNode) {
        if(key === currentNode.key) {
            return currentNode;
        }

        if(key < currentNode.key) {
            currentNode = currentNode.left;
        }
        else {
            currentNode = currentNode.right;
        }
    }

    return null;
}

/*********************************************
 * Driver program to test above function     *
 *********************************************/

// Create a Binary Search Tree
// var bst = new BinarySearchTree();
// bst.insert(15);
// bst.insert(10);
// bst.insert(20);
// bst.insert(8);
// bst.insert(12);
// bst.insert(17);
// bst.insert(25);
// bst.insert(6);
// bst.insert(11);
// bst.insert(16);
// bst.insert(27);

// Get a reference to the node whose key is 9
// var test = bst.getNodeByKey(6);
//
// // Find the in order successor of test
// var succ = test ? bst.findInOrderSuccessor(test) : null;
//
// // Print the key of the successor node
// if(succ) {
//     console.log("Inorder successor of " + test.key + " is " + succ.key);
// } else {
//     console.log("Inorder successor does not exist");
// }

function fib1(num) {
  if (num === 0) return 0;
  if (num === 1) return 1;
  return fib1(num-1) + fib1(num-2);
}


function fib2(num, cache={0:0, 1:1}) {
  if (num < 2) return num;

  if (cache[num] !== undefined) return cache[num];

  cache[num] = fib2(num-1, cache) + fib2(num-2, cache);
  return cache[num];
}


fib4(42);
