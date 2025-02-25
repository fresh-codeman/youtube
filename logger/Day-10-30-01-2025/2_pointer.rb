def sort_matrix(grid)
    i = 0
    sort_diagonal(grid, 0,0)
    i = 1
    while i<grid.size-1 do
        sort_diagonal(grid, 0,i)
        sort_diagonal(grid, i, 0)
        i+=1
    end
end

def sort_diagonal(grid, i, j)
    len = grid.size
    arr = []
    p,q = i,j
    while p< len && q < len do
        arr.push(grid[p][q])
        p, q = p+1, q+1
    end
    arr.sort!{|a,b| j>0 ? a-b : b-a }
    p,q = i,j
    k = 0
    while p< len && q < len do
        grid[p][q] = arr[k]
        p, q = p+1, q+1
        k += 1
    end
end



def assign_elements(groups, elements)
    output = []
    groups.each do |group|
        index = 0
        while(index<elements.size) do
            break if group%elements[index] == 0
            index += 1
        end
        output.push(index == elements.size ? -1 : index)
    end
    return output
end

groups = [8,4,3,2,4]
elements = [4,2]
# puts assign_elements(groups, elements)
# 
# @param {String} s
# @return {Integer}
def count_substrings(s)
    len = s.size
    index = len-1
    count = 0
    while index>=0
      if s[index] == '1' || s[index] == '2' || s[index] == '5'
        count+= index+1
      elsif s[index] == '4'
        count +=1
        count += index if index > 0 && s.slice(index-1,2).to_i%4 == 0
      elsif s[index] == '8'
        count +=1
        count += 1 if index > 0 && s.slice(index-1,2).to_i%8 == 0
        count += index-1 if index > 1 && s.slice(index-2,3).to_i%8 == 0
      elsif s[index] == '3' || s[index] == '6'
        i = index
        sum = 0
        while(i >= 0)
          sum += s[i].to_i
          count += 1 if sum%3 == 0
          i -= 1
        end
      elsif s[index] == '9'
        i = index
        sum = 0
        while(i >= 0)
          sum += s[i].to_i
          count += 1 if sum%9 == 0
          i -= 1
        end
      elsif s[index] == '7'
        i = index
        while i>=0
          count += 1 if s.slice(i, index-i+1).to_i-%7 == 0
          i-=1
        end
      end
      index -= 1
    end
    return count
end

s = "5701283"
puts count_substrings(s)
