class Solution {
    func reverseWords(_ s: String) -> String {
        Array(s.components(separatedBy: " ").filter{ !$0.isEmpty }.reversed()).joined(separator: " ")
    }
}