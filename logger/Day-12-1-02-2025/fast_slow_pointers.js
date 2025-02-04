class Solution {
  loopExists(arr) {
    let fast = arr[0] - 1
    let slow = arr[0] - 1
    let len = arr.length
    let temp = null
    while (slow >= 0 && fast >= 0) {
      if (slow == (arr[slow] + slow) % len) return false
      console.log(`====== before  slow ${slow} and  fast ${fast} `)
      slow = (arr[slow] + slow) % len
      temp = (arr[fast] + fast) % len
      
      fast = (arr[temp] + temp) % len

      console.log(`after slow ${slow} and  fast ${fast} `)
      if (fast == slow) return true
    }
    return false
  }


}

  
  solution = new Solution()  
  //   Problems first 
  let num = [2, -3, 2, 5]
  console.log(solution.loopExists(num))
  // problem second
  // let input = [34, 3, 31, 98, 92, 23]
  // console.log(solution.sortStack(input))
