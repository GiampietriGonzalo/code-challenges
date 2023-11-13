// My failed attempt - beacuse of running time exceeded
class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
      guard Set(nums).count > 2 else { return false }

      var index = 0
      var didFind = false

     while !didFind, index < nums.count {
        let currentNum = nums[index]
        var prefix = [Int]()
        var suffix = [Int]()

        if index != 0 {
          prefix = Array(nums.prefix(index)).filter { $0 < currentNum }
        } 

        if index != nums.count - 1 {
          suffix = Array(nums.suffix(nums.count - index - 1)).filter { $0 > currentNum }
        }

        didFind = !prefix.isEmpty && !suffix.isEmpty
        index += 1
      }

     return didFind
  }
}

// Solution

class Solution {
	func increasingTriplet(_ nums: [Int]) -> Bool {
		var smallestFirstNum = Int.max
		var smallestSecondNum = Int.max
		for num in nums {
			if num > smallestSecondNum {
				return true
			} else if num > smallestFirstNum && num < smallestSecondNum {
				smallestSecondNum = num
			} else if num < smallestFirstNum {
				smallestFirstNum = num
			}
		}
		return false
	}
}