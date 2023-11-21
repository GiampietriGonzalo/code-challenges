class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var lastNonZeroIndex = 0
        
        for i in 0..<nums.count {
            guard nums[i] != 0 else { continue }
            nums.swapAt(i, lastNonZeroIndex)
            lastNonZeroIndex += 1
        }
    }
}