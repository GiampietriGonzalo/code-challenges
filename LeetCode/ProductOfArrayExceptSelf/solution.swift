// Solution
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var prefix = Array(repeating: 1, count: nums.count)
        var suffix = Array(repeating: 1, count: nums.count)
        var result = Array(repeating: 0, count: nums.count)

        for i in 1 ..< nums.count {
            prefix[i] = prefix[i - 1] * nums[i - 1]
        }

        for i in (0 ..< nums.count - 1).reversed() {
            suffix[i] = suffix[i + 1] * nums[i + 1]
        }

        for i in 0 ..< result.count {
            result[i] = prefix[i] * suffix[i]
        }

        return result
    }
}


// My failure attempt
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty, nums.count > 1 else { return [] }
        guard nums.count > 2 else { return [nums[1], nums[0]] }
        
        var numsAux = nums
        var result = [Int]()
        var totalMult = nums.reduce(1, *)
        let zeroCount = nums.filter { $0 == 0 }.count

        for i in 0..<nums.count {
            if zeroCount > 1 {
                result.append(0)
            } else if nums[i] == 0 {
                let temp = totalMult
                numsAux[i] = 1
                totalMult = numsAux.reduce(1, *)
                result.append(totalMult)
                totalMult = temp
            } else {
                var rest = rest(number: abs(totalMult), by: abs(nums[i]))

                if totalMult < 0, nums[i] > 0 {
                    rest *= -1
                }

                
                
                result.append(rest)
            }
            
        }

        return result
    }

    func rest(number: Int, by numberToRest: Int) -> Int {
        guard numberToRest > 1 else { return number }
        var result = 0
        var diff = number

        while diff > 0 {
            diff -= numberToRest
            result += 1
        }

        return result
    }
}