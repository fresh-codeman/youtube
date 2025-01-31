class TwoPointer
  class<<self
    def four_sum(input, target)
      input.sort!()
      quadrilles = []
      length = input.size
      i = 0
      while i<length - 3
        i += 1 while(i> 0 && i<length-3 && input[i] == input[i-1])
        j = i+1
        while j < length - 2
          j += 1 while(j> i+1 && j<length-2 && input[j] == input[j-1])
          find_two_sum_with_uniqueness(input, i, j, target, quadrilles)
          j += 1 
        end
        i += 1 
      end
      return quadrilles
    end

    def find_two_sum_with_uniqueness(input, i, j, target, quadrilles)
      left, right = j+1, input.length-1
      while left< right
        new_target = input[left]+input[right]+input[i]+input[j]
        if(new_target< target)
          left+=1
        elsif new_target > target
          right -= 1
        else
          quadrilles.push([input[i], input[j], input[left], input[right]])
          left+=1 while(left < right && input[left] == input[left+1])
          right-=1 while(right > left && input[right] == input[right-1])
          left +=1
          right -= 1
        end
      end
    end

    def num_subarray_product_less_than_k(nums, k)
      sub_array = 0
      product = 1
      left = 0
      (0...nums.size).each do |right|
        product *= nums[right]
        product.round
        while(left< nums.size && product >= k)
          product /= nums[left]
          product = product.round
          left += 1
        end
        sub_array += right - left + 1
        puts right - left + 1
      end
      return sub_array
    end

  end
end


if __FILE__==$0
  #problem first ---------------------------------------
  # nums = [1,0,-1,0,-2,2]
  # target = 0
  # puts TwoPointer.four_sum(nums, target)
 
  #problem 2 ---------------------------------------

  #problem 2 ---------------------------------------
  nums = [2, 5,1, 3, 10]
  k = 30
  puts TwoPointer.num_subarray_product_less_than_k(nums, k)
end