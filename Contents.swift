import UIKit

// merge sort

// 2 parts

// divide and conquer
// mergesort using recursion
// 2 parts of a recursive function
// 1. base case
// recurssive call
func mergeSort(_ arr: [Int]) -> [Int] {
  // base case
  guard arr.count > 1 else {
    return arr
  }
  
  // 1 - middle index
  let middleIndex = arr.count / 2
  
  // 2 - use divide and conquer to split array in halves => runtime O(n log n)
  let leftArr = mergeSort(Array(arr[..<middleIndex]))  // ..< middleIndex - does not include middleIndex
  let rightArr = mergeSort(Array(arr[middleIndex...]))  //
  
  // merge elements while sorting
  return merge(leftArr: leftArr, rightArr: rightArr)
  
  
}

func merge(leftArr: [Int], rightArr: [Int]) -> [Int] {  // O(n)
  var results = [Int]()
  var leftIndex = 0
  var rightIndex = 0
  
  while leftIndex < leftArr.count && rightIndex < rightArr.count {
    let leftElement = leftArr[leftIndex]
    let rightElement = rightArr[rightIndex]
    
    if leftElement < rightElement {
      results.append(leftElement)
      // increment the index of the array added from
      leftIndex += 1
    } else if rightElement < leftElement {
      results.append(rightElement)
      rightIndex += 1
    } else {  // if it gets here = elements are equal -> if equal add both elements to array
      // add one side first and increase index
      results.append(leftElement)
      leftIndex += 1
      // add next element and increase additional index
      results.append(rightElement)
      rightIndex += 1
    }
  }
    
    // 4b - adding remaining elements if any
    if leftIndex < leftArr.count {  // values we have not seen
      results.append(contentsOf: leftArr[leftIndex...])
    }
    
    if rightIndex < rightArr.count {
      results.append(contentsOf: rightArr[rightIndex...])
    }
  return results
  /*
   in order to merge need two variables used as the index for both the left and right arrays
   both variables begin at 0
   while loop with the conddition that the both left and right index is less than the count of left and right array
   when the index is above the array count -> that index doesn;t exist
   within the while loop -> obtain the current element your on with index variables
   if conditions -> for appending the elements
   check the left and right element against one another with possible outcomes
   
   possible outcomes are
    left > right
    left < right
    left == right
   
   if left has lesser value
      append to resultsArray
      increase leftIndex
   if right is less
      append to resultsArray
      increase rightIndex
   if values equal each other
      append both left and right values
      increase index for both left and right
   
   final step -> 4b
      if array is already sorted -> which it is
      would only enter these if statements once out of while loop ->
          while loop is exited once one array is emptied
          once array is emptied -> window is open to say -> join contents of other array to resultsArray
      just append entire remains array with open range usign append(contentsOf: )
   conditions:
    if leftIndedx is less than the count of left array -> means left array has values unseen
    if rightIndex is less than count of right array - means right array still has values unseen
    add remaining values from the array from the right/left index (respectively)
   
   return resultsArray
   
   */
}

let test1 = mergeSort([-3, 5, 0, 5, 8, 4, 1])
print(test1)


// TODO: covert to generic

// sorting one array - generic
func genericMergeSort<T: Equatable >(arr: [T]) -> [T] {
  // divide and conquer
  // count is base case -
  // obtain the middle index
  // separate the array
  // merge function -> generic
  guard arr.count > 1 else {  // guard array is not empty
    return arr  // return array as is if count is 1 or less
  }
  
  // obtain middle index
  let middleIndex = arr.count / 2 // arrays middle index
  
  // seperate array -> divide and con
  let leftArray = genericMergeSort(arr: Array(arr[..<middleIndex]))
  let rightArray = genericMergeSort(arr: Array(arr[middleIndex...]))
  
  return genericMerge(leftArray, rightArray)
  
}

func genericMerge<T: Equatable>(_ leftArray: [T], _ rightArray: [T]) -> [T] {
  let resultsArray = [T]()
  var leftIndex = 0
  var rightIndex = 0
  
  while leftIndex < leftArray.count && rightIndex < rightArray.count {
    // obtain elements using the index variable
    let leftElement = leftArray[leftIndex]
    let rightElement = rightArray[rightIndex]
    
    if leftElement < rightElement {
      
      
    } else if rightElement < leftElement {
      
    } else { // both element equal left == right
      
    }
    
    
    
  }
  
  
  return resultsArray
}
