class Solution {
    search(arr, targetSum) {
      let i = 0
      let j = arr.length-1
      while(i<j){
        if(arr[i] + arr[j] == targetSum) return [i,j]
        else if(arr[i]+ arr[j] > targetSum) j--
        else i++
      }
      return [-1, -1];
    }

    moveElements(arr) {
        let i = 0; let j = 0;
        while(i<=j && j< arr.length){
            if(arr[i] == arr[j]) j++
            else {
                if(i+1== j) j++;
                else arr[i+1] = arr[j]
                i++
            }
        }
        return 1 + i;
      }

      makeSquares(arr) {
        const n = arr.length;
        let squares = Array(n).fill(0);
        let i = 0;
        while(arr[i]<0) i++
        let j = i - 1
        let index = 0
        while(j >=0 || i < arr.length){
            if(i == arr.length){
                squares[index] = arr[j]**2
                j--
            }else if(j < 0){
                squares[index] = arr[i]**2
                i++ 
            }else if(arr[i]**2 < arr[j]**2){
                squares[index] = arr[i]**2
                i++
            }else{
                squares[index] = arr[j]**2
                j--
            }
            index++;
        }
        return squares;
      }

      searchTriplets(arr) {
        arr.sort((a, b) => a - b)
        const triplets = [];
        let target_index = -1;
        let len = arr.length
        while(target_index< len-1){
            target_index++
            let target = arr[target_index]
            if(target_index> 0 && target == arr[target_index-1]) continue;
            let i = target_index + 1
            let j = len - 1
            let values = []
            while(i<j){
                if(arr[i]+arr[j] == -1*target){
                    values.push([arr[i], arr[j]])
                    i++
                    j--
                }
                else if(arr[i]+ arr[j] > -1*target) j--
                else i++
            }
           if(values.length){
            values.forEach((value, index) => {
                if(index == 0 || values[index-1][0] != values[index][0]){
                    triplets.push([target, ...value])
                }

            })
           }
        }   
        return triplets;
      }
      
      find_sum(arr, i, j, target){
        i++;
        j--;
        while(i<j){
            if(arr[i]+arr[j] == target) return [arr[i], arr[j]]
            else if(arr[i]+ arr[j] > target) j--
            else i++
        }
        return null
      }
  }

solution = new Solution()  
let Input = 0
//   Problems first pair sum to target
Input= [1, 2, 3, 4, 6]
let target=6
console.log(solution.search(Input, target))
// problem 2 move unique number to the left.
Input= [2, 3, 3, 3, 6, 9, 9]

console.log(solution.moveElements(Input))

// problem 3 square 
Input = [-2, -1, 0, 2, 3]
console.log(solution.makeSquares(Input))

// problem 4 triplet
Input = [-3, 0, 1, 2, -1, 1, -2]
console.log(solution.searchTriplets(Input))