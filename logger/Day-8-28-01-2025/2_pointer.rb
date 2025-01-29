class TwoPointer
  class<<self
    def three_sum_closest(nums, target)
      nums.sort!()
      len = nums.size
      closest_three = [0, len-1, len-2]
      (0...len-2).each do |i|
        left, right = i+1, len-1
        while left< right
          first, second, third = closest_three
          current_distance = target - (nums[i] + nums[left] + nums[right])
          least_distance = target - (nums[first] + nums[second] + nums[third])
          
          closest_three = i, left, right if current_distance.abs <= least_distance.abs
          break if current_distance == 0
          left+=1 if current_distance>0
          right-=1 if current_distance<0
        end
      end
      closest_three.map { |index| nums[index] }.sum
    end

    def three_sum_smaller(input, target)
      input.sort!()
      len = input.size
      count = 0
      (0...len-2).each do |i|
        left = i+1
        right = len-1
        while left< right
          if target > (input[i]+input[left]+input[right])
            count += right - left
            left+=1
          else
            right -= 1
          end
        end
      end
      count
    end



  end
end


if __FILE__==$0
  #problem first ---------------------------------------
 
  # input= [-1,2,1,-4]
  # target=1
  # puts TwoPointer.three_sum_closest(input, target)
 
  #problem first ---------------------------------------

  input = [-2,0,1,3]
  target = 2
  puts(TwoPointer.three_sum_smaller(input, target))
end