import UIKit

/*Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
 
 Note:
 
 The number of elements initialized in nums1 and nums2 are m and n respectively.
 You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
*/


func merge( nums1: inout [Int], nums2: [Int]) -> [Int] {
    let m = nums1.count/2
    let n = nums2.count
    var nums1Index = m - 1
    var nums2Index = n - 1
    
    while nums1Index > 0 || nums2Index > 0 {
//        print(nums1Index, nums2Index)
        
//        if nums2Index < 0 || nums1Index >= 0 && (nums1[nums1Index] > nums2[nums2Index]) {
//            nums1[nums1Index + nums2Index + 1] = nums1[nums1Index]
//            nums1Index -= 1
//        } else {
//            nums1[nums1Index + nums2Index + 1] = nums2[nums2Index]
//            nums2Index -= 1
//        }
        
        if nums1[nums1Index] > nums2[nums2Index] {
            nums1[nums1Index + 1 + nums2Index] = nums1[nums1Index]
            nums1Index -= 1
        } else if nums1[nums1Index] < nums2[nums2Index] {
            nums1[nums1Index + 1 + nums2Index] = nums2[nums2Index]
            nums2Index -= 1

        } else {
            nums1[nums1Index + 1 + nums2Index] = nums1[nums1Index]
            nums1[nums1Index + nums2Index] = nums2[nums2Index]
            nums1Index -= 1
            nums2Index -= 1
        }
        
        print(nums1)
        
    }
    
    return nums1
}

var nums1 = [1,2,3,0,0,0]
var nums2 = [2,5,6]

merge(nums1: &nums1, nums2: nums2)


