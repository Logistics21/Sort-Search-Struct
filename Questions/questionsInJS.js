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
