
 //Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
        
class Solution {
    func mergeNodes(_ head: ListNode?) -> ListNode? {
        
        var partialSum = 0
        var currentNode = head
        var solutionHeadNode: ListNode?
        var solutionLastNode: ListNode?

        while(currentNode != nil) {
            partialSum += currentNode!.val

            if currentNode!.val == 0, partialSum > 0 {
                if solutionHeadNode == nil {
                    solutionHeadNode = ListNode(partialSum)
                    solutionLastNode = solutionHeadNode
                } else {
                    solutionLastNode?.next = ListNode(partialSum)
                    solutionLastNode = solutionLastNode?.next
                }

                partialSum = 0
            }

            currentNode = currentNode?.next
        }

        return solutionHeadNode
    }
}