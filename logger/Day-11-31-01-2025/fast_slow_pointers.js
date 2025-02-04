class Solution {
  find(num) {
    let fast = num
    let slow = num
    while (true) {
      slow = this.findSquareSum(slow)
      fast = this.findSquareSum(this.findSquareSum(fast))
      if (slow == fast) return false
      if (slow == 1 || fast == 1) return true
    }
  }
  findSquareSum(num) {
    let squareSum = 0
    while (num != 0) {
      squareSum += (num % 10) * (num % 10)
      num = Math.floor(num / 10)
    }
    return squareSum
  }

  sortStack(stack) {
    let s1 = []
    let element = stack[stack.length - 1]
    let sorted_elements = 0
    while (element != null && sorted_elements != stack.length) {
      let new_sorted = 0
      let pushed = false
      while (new_sorted < sorted_elements) {
        let top = stack.pop()
        if (!pushed && top <= element) {
          pushed = true
          s1.push(element)
        }
        s1.push(top)
        new_sorted++
      }
      stack.pop()
      if (!pushed) s1.push(element)
      element = stack.length == 0 ? null : stack[stack.length - 1]
      while (s1.length !== 0) {
        stack.push(s1.pop())
      }
      sorted_elements++
    }
    return stack
  }
}

  
  solution = new Solution()  
  //   Problems first 
  let num = 12


  // console.log(solution.find(num))

  // problem second
  let input = [34, 3, 31, 98, 92, 23]
  console.log(solution.sortStack(input))
