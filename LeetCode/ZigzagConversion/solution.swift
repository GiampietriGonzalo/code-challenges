class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else {
            return s
        }
        
        var goingDown = false
        var rows = Array(repeating: "", count: numRows)
        var currentRow = 0

        for char in s {
            rows[currentRow].append(char)

            if currentRow == 0 || currentRow == numRows - 1 {
                goingDown.toggle()
            }

            currentRow = goingDown ? currentRow + 1 : currentRow - 1
        }

        return rows.joined()
    }
}
