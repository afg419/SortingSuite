require 'pry'

def add(i,j)
  

  if j == 0              # => 0
    i                   # => 3
  else
    add(i.succ,j.pred)
  end                   # => 3

end

puts add(3,4)  # => 3
