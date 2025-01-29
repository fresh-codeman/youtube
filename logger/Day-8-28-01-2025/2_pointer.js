class Solution {
    searchTriplets(arr, target) {
      let count = 0;
      arr.sor((a,b)=> a-b)
      let len = arr.length
      for(let i =0; i<len-2; i++){
        let left = i+1
        let right = len-1
        while(left< right){
          if(target > (arr[i]+arr[left]+arr[right])){
            count += right - left
            left+=1
          }else right -= 1
         }
      }
      return count;
    }

    findSubarrays(nums, target) {
        let count = 0
        let left = 0
        let product = 1
        let len = nums.lenght
        for (let right = 0; right < nums.length; right++) {
            product *= nums[right]

            while(left<len & product >= target){
                product /= nums[left++]
            }

            count += right-left +1
        }
        return count
    }
  }
  
  solution = new Solution()  
  //   Problems first pair sum to target
  let nums = [2, 5, 3, 10]
  let target=30
  console.log(solution.findSubarrays(nums, target))