# problem 3
def supersequences(words)
  graph = {}

  words.each do |word|
    graph[word[0]] ? graph[word[0]].push(word[1]) : graph[word[0]] = [word[1]]
  end
    puts graph
end

def make_all_supersequences(graph)
  
end

if __FILE__ == $0
  words = ["ab","ba"]
  p supersequences(words )
end