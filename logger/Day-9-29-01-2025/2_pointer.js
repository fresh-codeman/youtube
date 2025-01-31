class Solution {
  maximumWealth(accounts) {
    let maxWealth = 0;  // Initialize maxWealth to 0
    for(let i =0; i < accounts.length; i++){
        let i_th_wealth = 0
        for(let j = 0; j< accounts[i].length; j++){
            i_th_wealth += accounts[i][j]
        }
        if(i_th_wealth > maxWealth) maxWealth = i_th_wealth
    }
    return maxWealth;
  }

  diagonalSum(mat) {
    let totalSum = 0;  // Initialize the total sum
    let i = 0;
    let j = 0;
    while(i<mat.length){
        totalSum += mat[i][j]
        i++
        j++
    }
    i = mat.length-1
    j = 0
    while(i>=0){
        totalSum += mat[i][j]
        i--
        j++
    }
    if(mat.length % 2 != 0){
        let mid = Math.floor(mat.length/2)
        totalSum -= mat[mid][mid]
    }
    return totalSum;  // Return the calculated total sum
  }
  }
  
  solution = new Solution()  
  //   Problems first pair sum to target
  let nums = [[5,2,3],[0,6,7]]

  // console.log(solution.maximumWealth(nums))

  // Problems 2
  nums  = [[5,3,9],[4,7,1],[8,6,2]]
  console.log(solution.diagonalSum(nums))