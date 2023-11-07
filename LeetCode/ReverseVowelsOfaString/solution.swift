class Solution {
    func reverseVowels(_ s: String) -> String {
        guard s.length > 1 else { return s }
        let vowels = ["a", "e", "i", "o", "u"]
        var stringVowels = s.filter { vowels.contains($0.lowercased()) }
        var newString = ""

        s.forEach { char in 
            if vowels.contains(char.lowercased()), !stringVowels.isEmpty {
                newString.append(stringVowels.removeLast())
            } else {
                newString.append(char)
            }
        }

        return newString
    }
}