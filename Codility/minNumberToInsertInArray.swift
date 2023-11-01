// write a funtion to return a the minimum number that is not in the array of integers
// [1, 3, 6, 4, 1, 2] -> 5
// [1, 2, 3] -> 4
// [-1, -3] -> 1
// [1, 2, 3, 4, 5, 6] -> 7
// [1, 2, 3, 4, 5, 6, 7, 8, 9] -> 10

func solution(_ A : inout [Int]) -> Int {
    var min: Int = 1
    var set: Set<Int> = Set<Int>()

    for i: Int in A {
        set.insert(i)
    }

    while set.contains(min) {
        min += 1
    }
    
    return min
}
