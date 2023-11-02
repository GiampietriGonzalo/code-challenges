/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

 // My solution
class Solution {
    func averageOfSubtree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        if root.left == nil, root.right == nil {
            return (root.val / 1 == root.val) ? 1 : 0
        }

        return averageAndSumOfSubtree(root).0
    }

    // returns (averageCount, sum, nodesCount)
    func averageAndSumOfSubtree(_ root: TreeNode?) -> (Int, Int, Int) {
        guard let root = root else { return (0,0,0) }
        if root.left == nil, root.right == nil {
            return ((root.val / 1 == root.val) ? 1 : 0, root.val, 1)
        }

        var leftAverageOfSubtreeResult = (0,0,0)
        if let leftNode = root.left {
            leftAverageOfSubtreeResult = averageAndSumOfSubtree(leftNode)
        }

        var rightAverageOfSubtreeResult = (0,0,0)
        if let rightNode = root.right {
            rightAverageOfSubtreeResult = averageAndSumOfSubtree(rightNode)
        }

        let nodesCount = leftAverageOfSubtreeResult.2 + rightAverageOfSubtreeResult.2 + 1
        let totalSum = leftAverageOfSubtreeResult.1 + rightAverageOfSubtreeResult.1 + root.val
        let rootNodeAverage = totalSum / nodesCount

        var totalAverage = leftAverageOfSubtreeResult.0 + rightAverageOfSubtreeResult.0
        if rootNodeAverage == root.val { totalAverage += 1 }

        return (totalAverage, totalSum, nodesCount)
    }
}

// Best solution with DFS or postOrden???
