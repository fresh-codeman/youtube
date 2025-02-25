
# def has_same_digits(s)
#     return false if(s.size <2)
#     return true if(s.size == 2 && s[0] == s[1])
#     puts "started #{ s} /n\n"
#     new_s = ""
#     (0...s.size-1).each do |index|
#       new_s = new_s + ((s[index].to_i + s[index+1].to_i ) % 10).to_s
#     end
#     return has_same_digits(new_s)
# end

def max_sum(grid, limits, k)
    indices = Array.new(limits.size,0)
    grid.map!{|r| r.sort!{|a,b| b-a}}
    output = 0
    (0...k).each do |r|
        max = nil
        (0...grid.size).each do |row|
          if indices[row] < limits[row] && (!max || grid[row][indices[row]] > grid[max[0]][max[1]])
            max = [row, indices[row]]
          end
        end
        output += grid[max[0]][max[1]]
        indices[max[0]] += 1
    end
    return output
end

def has_same_digits(s)
    return false if(s.size <2)
    return true if(s.size == 2 && s[0] == s[1])
    arr = s.split('').map{|a| a.to_i}
    su = arr.sum*(arr.count - 2)
    left = (su - arr[-1] - (arr[-1]+arr[-2]+arr[0])*(arr.count - 3)) % 10
    right = (su - arr[0] - (arr[0]+arr[1]+arr[-1])*(arr.count - 3)) % 10
    left == right
end

grid = [[7,10,3,3,7,7,0],[5,5,9,2,10,5,2]]
limits = [3,7] 
k = 7
# puts max_sum(grid, limits, k)

puts has_same_digits("321881")