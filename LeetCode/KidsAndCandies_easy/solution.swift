class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        let maxValue = (candies.max() ?? 0) - extraCandies
        return candies.map { $0 >= maxValue }
    }
}