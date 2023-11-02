//My solution
class Solution {

    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        var commonString = ""
        let shortestString = str1.length < str2.length ? str1 : str2

        for i in 0...shortestString.count {
            let temp = String(shortestString.prefix(i))

            if dividesString(string1ToDivide: str1, string2ToDivide: str2, divider: temp) {
                commonString = temp
            }
        }

        return commonString
    }

    private func dividesString(string1ToDivide: String, string2ToDivide: String, divider: String) -> Bool {
        (string1ToDivide.components(separatedBy: divider) + string2ToDivide.components(separatedBy: divider)).reduce("", +).isEmpty
    }

}

// BEST SOLUTION O(n + m)
class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        guard (str1 + str2) == (str2 + str1) else { return "" }
        
        let gcd = gcd(str1.count, str2.count)
        return String(str1.prefix(gcd))
    }

    func gcd(_ x: Int, _ y: Int) -> Int {
        if y == 0 {
            return x;
        } else {
            return gcd(y, x % y);
        }
    }
}