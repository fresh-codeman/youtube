class TwoPointer
  class<<self
    
    # def find_unsorted_subarray(input)
    #   length = input.size
    #   smallest_from_right = Array.new(length)
    #   biggest_from_left = Array.new(length)
    #   biggest = input[0]
    #   smallest = input[length-1]
    #   (0...length).each do |i|
    #     smallest = input[length-i-1] if smallest >= input[length-i-1]
    #     biggest = input[i] if biggest <= input[i]
    #     biggest_from_left[i] = biggest
    #     smallest_from_right[length-i-1] = smallest
    #   end
    #   left, right = 0, length-1
    #   while(left< length-1)
    #     left+= 1 if(input[left]<=smallest_from_right[left+1])
    #     break if (input[left] > input[left+1] || input[left] > smallest_from_right[left+1])
    #   end
    #   while(right >= 0)
    #     right -=1 if(input[right]>=biggest_from_left[right-1])
    #     break if(input[right] < biggest_from_left[right-1] || input[right]< input[right-1])
    #   end
    #   return 0 if right<=left

    #   return right - left + 1 

    # end

    def find_unsorted_subarray(input)
      length = input.size
      left, right = 0, length-1
      left+= 1  while(left< length-1 && input[left]< input[left+1])
      right -=1 while(right > 0 && input[right] > input[right-1])

      smallest, biggest = input[left+1], input[right-1]
      i = left+1
      while(i<right)
        smallest = input[i] if input[i] < smallest 
        i += 1
      end
      i = right - 1
      while i> left
        biggest = input[i] if input[i] > biggest
        i -= 1
      end

      left -= 1 while(left >= 0 && input[left]> smallest)
      right += 1 while(right < length && input[right]< biggest)

      return right - left - 1 

    end

    def backspace_compare(s, t)
      i, j = s.size-1, t.size-1
      count_i, count_j = 0,0
      while(i>=0 || j>=0)
        if(i>=0 && s[i] == '#')
          i-=1
          count_i +=1
        elsif(j>=0 && t[j] == '#')
          j-=1
          count_j +=1
        elsif i>=0 && s[i]!='#' && count_i>0
          count_i -=1
          i-=1
        elsif j >= 0 && t[j] != '#' && count_j >0
          count_j -= 1
          j-=1
        elsif i >= 0 && j>= 0 && s[i] == t[j]
          i -= 1
          j -=1
        else
          return false
        end
      end
      return true
    end

    def four_sum(nums, target)
      i = 0
      length = nums.size
      quadriples = []
      nums.sort!()
      while(i< length - 4)
        j = i+1
        while(j < length - 3)
          new_target = nums[i] + nums[j] - target
          left, right = j+1, length - 1
          while(left < right)
            if(nums[left] + nums[right] == new_target)
              quadriples.push(nums[i], nums[j], nums[left], nums[right]) 
              left +=1
              right -= 1
            elsif nums[left] + nums[right] < new_target
              k = left
              left += 1 while left< right && nums[left] == nums[left+1]
              left +=1 if left == k
            else 
              k = right
              right -= 1 while right>left && nums[right] == nums[right-1]
              right -= 1 if right == k
            end
          end
          k = j
          j += 1 while(j < length - 3 && nums[j]== nums[j+1])
          j += 1 if k==j
        end
        k = i
        i += 1 while i< length - 4 && nums[i] == nums[i+1]
        i += 1 if i == k
      end
      return quadriples
    end


  end
end


if __FILE__==$0
  #problem first ---------------------------------------
 
  # nums = [2,6,4,8,10,9,15]
  # puts TwoPointer.find_unsorted_subarray(nums)
 
  #problem 2 ---------------------------------------
  # s = "bxj##tw"
  # t = "bxj###tw"
  # puts TwoPointer.backspace_compare(s,t)
  #problem 2 ---------------------------------------
  
  nums = [1,0,-1,0,-2,2]
  target = 0
  puts TwoPointer.four_sum(nums, target)
end