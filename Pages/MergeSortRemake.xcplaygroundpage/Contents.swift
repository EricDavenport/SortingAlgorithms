// Merge Sort remake with Int input
/*
 2 parts
 divide and conquer
 
 recurssion in merge sort
  base case
  recursive call
 */

/*
 input -> [Int]
 output -> [Int}
 
 take in single unsorted array of ints
 return sorted array
 
 `1.  if array contains one or less elements return array as in -> already sorted
 `2.  obtain middleIndex -> middle index the middle of the array index (if odd number of elements -> place element if  one of the two arrays created
 `3.  using recurssion -> sperate the array into seperate arrays using recursssion
          remember sytax to creating an array using another array Array(arrayName[..<index])
 `4.  return merge function of two arrays created in step 3
 
 `5.  Create merge function
 `5b. Merge function takes in two arrays and returns one single sorted array
 `5c. create array var used to return sorted array
 `5d. create two index var left and right to keep track of current location within the array both begin at 0
 `5e. while loop with condition of both array index variables ar lower than the count of the array
 `5f. obtain current element within both arrays -> leftArray[leftIndex] rightArray[rightIndex]
 `5g. conditions for how to add elements to array
  `    leftElement < rightElement
  `    rightElement < leftElement
  `    leftElement == rightElement
 `5h. add element depending on condition in above step
 `5i. increase index of array where element was added -> if leftElement appended -> leftIndex += 1
     repreat for all conditions
 6.  conditional if statement -> used when all element from left or right arrays have been added
            ->>> outside of while loop
 6b. if leftIndex < leftArray.count
     if rightIndex < rightArray.count
    will enter this condition oncer an array is completed -> provided array already sorted -> will auto add
 
  
 */

func mergeSortRemake(_ arr: [Int]) -> [Int] {
  // guard if the array has more than one element
  guard arr.count > 1 else {
    return arr    // if one or less elements within given input -> return array as is
  }
  
  let middleIndex = arr.count / 2  // middle index of given array -> used in order to split the array
  
  // recurssive call that using Array declaration syntax
  let leftArray = mergeSortRemake(Array(arr[..<middleIndex]))
  let rightArray = mergeSortRemake(Array(arr[middleIndex...]))
  
  return mergeRemake(leftArray, rightArray)
}


func mergeRemake(_ leftArray: [Int], _ rightArray: [Int]) -> [Int] {
  var resultsArray = [Int]()
  var leftIndex = 0
  var rightIndex = 0
  
  while leftIndex < leftArray.count && rightIndex < rightArray.count {
    let leftElement = leftArray[leftIndex]
    let rightElement = rightArray[rightIndex]
    
    if leftElement < rightElement {
      resultsArray.append(leftElement)
      leftIndex += 1
    } else if rightElement < leftElement {
      resultsArray.append(rightElement)
      rightIndex += 1
    } else {
      resultsArray.append(leftElement)
      leftIndex += 1
      resultsArray.append(rightElement)
      rightIndex += 1
    }
  }
  
  if leftIndex < leftArray.count {
    resultsArray.append(contentsOf: leftArray[leftIndex...])
  }
  if rightIndex < rightArray.count {
    resultsArray.append(contentsOf: rightArray[rightIndex...])
  }
  
  return resultsArray
}


let testCase1 = mergeSortRemake([-1, 1, -1, -20, 90, -100])
print(testCase1)
