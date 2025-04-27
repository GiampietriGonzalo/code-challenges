//You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, 
// and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
//Merge nums1 and nums2 into a single array sorted in non-decreasing order.
//The final sorted array should not be returned by the function, but instead be stored inside the array nums1.
//To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.

// three pointer solution?

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var i = 0
    var j = 0

    guard n > 0 else { return }

    while j < n {
        if nums1[i] >= nums2[j] {
            nums1.insert(nums2[j], at: i)
            nums1.removeLast()
            i += 1
            j += 1
        } else if i >= n, nums[i] == 0 {
           nums1.insert(nums2[j], at: i)
            nums1.removeLast() 
            j += 1
            i += 1
        } else if n == m {
            nums1.insert(nums2[j], at: i)
            nums1.removeLast() 
        } else {
           i += 1  
        }
    }  
}