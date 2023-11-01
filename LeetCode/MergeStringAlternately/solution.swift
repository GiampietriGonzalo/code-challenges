class Solution {

    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        guard !word1.isEmpty, !word2.isEmpty else { return "" }

        var word1Array = Array(word1)
        var word2Array = Array(word2)
        var longestString = word1
        var newString = ""

        if word2.length > word1.length {
            longestString = word2
        } 

        for i in 0..<longestString.length {
            if i < word1Array.count {
                newString.append(word1Array[i])
            }

            if i < word2Array.count {
                newString.append(word2Array[i])
            }
        }

        return newString
    }
}