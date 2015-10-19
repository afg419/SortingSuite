require 'matrix'
require_relative 'merge_sort'
require_relative 'swap_methods'
require 'pry'

############## A simple modification which can be used to sort an array of arrays

class MatrixSort

  include SwapMethods

  def sort_rows(squarray)
    sortable = SortingSuite::MergeSort.new

    squarray.each_index do |i|
      squarray[i] = sortable.sort(squarray[i])
    end

    squarray
  end

  def merge_rows(squarray)
    sorted_array = []

    squarray.each_index do |i|
      if i < squarray.length
        sorted_array = sort_two_sorted_arrays(sorted_array,squarray[i])
      end
    end
    sorted_array
  end

  def snake_entry(array,n) #array is of size n^2
    squarray = []
    i = 0
    while i <= n-1 do
      #binding.pry
      squarray[i] = array[i*n..(i+1)*(n)-1]
      i+=1
    end
    squarray
  end

  def sort(squarray)
    sort_rows(squarray)
    sorted_array = merge_rows(squarray)
    sorted_squarray = snake_entry(sorted_array,squarray.length)
    sorted_squarray
  end

end

random_squarray = []
i = 0
while i <5 do
  random_list = []
    5.times do
      random_list.push(rand(0..100))
    end
  random_squarray.push(random_list)
  i +=1
end



# sortable = MatrixSort.new
# A = [[5,4],[3,2]]
# print sortable.sort_rows(A)
# print "\n"
# B = sortable.merge_rows(sortable.sort_rows(A))
# print "\n"
# print sortable.snake_entry(B,2)

C = random_squarray
print sortable.sort(C)
