
// This problem can not be resolver with 2 pointers. You need at least 3 and start from the last elements

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var i = m - 1
    var j = n - 1
    var nm = n + m - 1

    while j >= 0 {

        if i < 0 {
            nums1[nm] = nums2[j]
            nm -= 1
            j -= 1
        } else if nums2[j] >= nums1[i] {
            nums1[nm] = nums2[j]
            nm -= 1
            j -= 1
        } else {
            nums1[nm] = nums1[i]
            i -= 1
            nm -= 1
        }

    }

}

// Test the merge function
func testMerge() {
    // Test case 1: Basic merge
    var nums1 = [1,2,3,0,0,0]
    let nums2 = [2,5,6]
    merge(&nums1, 3, nums2, 3)
    print("Test 1 result:", nums1) // Expected: [1,2,2,3,5,6]
    
    // Test case 2: Empty nums1
    var nums3 = [0,0,0]
    let nums4 = [1,2,3]
    merge(&nums3, 0, nums4, 3)
    print("Test 2 result:", nums3) // Expected: [1,2,3]
    
    // Test case 3: Empty nums2
    var nums5 = [1,2,3]
    let nums6: [Int] = []
    merge(&nums5, 3, nums6, 0)
    print("Test 3 result:", nums5) // Expected: [1,2,3]

    // Test case 4: All elements from nums2 are smaller
    var nums7 = [4,5,6,0,0,0]
    let nums8 = [1,2,3]
    merge(&nums7, 3, nums8, 3)
    print("Test 4 result:", nums7) // Expected: [1,2,3,4,5,6]
    
    // Test case 5: All elements from nums2 are larger 
    var nums9 = [1,2,3,0,0,0]
    let nums10 = [4,5,6]
    merge(&nums9, 3, nums10, 3)
    print("Test 5 result:", nums9) // Expected: [1,2,3,4,5,6]
    
    // Test case 6: Single element arrays
    var nums11 = [2,0]
    let nums12 = [1]
    merge(&nums11, 1, nums12, 1)
    print("Test 6 result:", nums11) // Expected: [1,2]
    
    // Test case 7: Duplicate elements
    var nums13 = [1,1,2,0,0,0]
    let nums14 = [1,2,3]
    merge(&nums13, 3, nums14, 3)
    print("Test 7 result:", nums13) // Expected: [1,1,1,2,2,3]
}

// Run the tests
testMerge()