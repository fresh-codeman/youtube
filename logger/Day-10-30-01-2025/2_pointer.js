class Solution {
  sort(arr) {
    let i = 0
    let j = arr.length -1
    while(i<j){
      if(arr[j] == 2) j--
      else if(arr[i] != 2) i++
      else{
        let swap = arr[i]
        arr[i] = arr[j]
        arr[j] = swap
        i++
        j--
      }
    }
    j = arr.length - 1
    i = 0
    while(j>=0 && arr[j]==2 ) j--
    while(i< j){
      if(arr[j] == 1) j--
      else if(arr[i] != 1) i++
      else{
        let swap = arr[i]
        arr[i] = arr[j]
        arr[j] = swap
        i++
        j--
      }
    }
    return arr
  }


  hasCycle(head) {

    let fast_pointer = head
    let slow = head
    while(fast_pointer.next != null ){
      fast_pointer = fast_pointer.next
      if(slow === fast_pointer) return true
    }
    return false
  }


  isValid(s) {
    let stack = []
    let map = {
      '(': ')',
      '{': '}',
      '[': ']'
    }
    for(let i = 0; i< s.length; i++){
        if(['{', '[', '('].includes(s[i])){
            stack.push(s[i])
        }else{
            if(stack.length==0) return false
            let poped = stack.pop()
            if(map[poped] != s[i]) return false
        }
    }
    return true;
}

reverseString(s) {
  let stack = []
  for(let i = 0; i < s.length; i ++){
      stack.push(s[i])
  }
  s = ''
  while(stack.length>0){
      s = stack.pop() + s
  }
  return s;
}



}

  
  solution = new Solution()  
  //   Problems first pair sum to target
  let nums = [1, 0, 0, 2, 2, 1]


  // console.log(solution.sort(nums))

  // Problems 2
// let  s = "{[()]}"
// console.log(solution.isValid(s))

let  s = "Hello, World!"
console.log(solution.reverseString(s))