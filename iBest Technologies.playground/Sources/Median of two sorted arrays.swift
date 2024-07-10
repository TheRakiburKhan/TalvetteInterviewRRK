import Foundation

public struct MedianOfArrays {
    public static func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var index1 = nums1.startIndex
        var index2 = nums2.startIndex
        
        var mergedArray = Array<Int>()
        
        while index1 < nums1.endIndex && index2 < nums2.endIndex {
            let num1 = nums1[index1]
            let num2 = nums2[index2]
            if num1 < num2 {
                mergedArray.append(num1)
                index1 = nums1.index(index1, offsetBy: 1)
            } else {
                mergedArray.append(num2)
                index2 = nums2.index(index2, offsetBy: 1)
            }
        }
        
        if index1 < nums1.endIndex {
            mergedArray += nums1[index1..<nums1.endIndex]
        }
        
        if index2 < nums2.endIndex {
            mergedArray += nums2[index2..<nums2.endIndex]
        }
        
        let midIndex = mergedArray.index(mergedArray.startIndex, offsetBy: (mergedArray.count - 1) / 2)
        
        var median: Double = 0
        
        if mergedArray.count % 2 == 0 {
            median = Double(mergedArray[midIndex] + mergedArray[mergedArray.index(midIndex, offsetBy: 1)]) / 2
        } else {
            median = Double(mergedArray[midIndex])
        }
        
        return median
    }
}
