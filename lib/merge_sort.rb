require_relative 'swap_methods'  # => true
require'pry'


module SortingSuite
  class MergeSort

    include SwapMethods  # => BubbleSort

    def sort_pass(array,k)
      # k represents a 'k' wide mergesort iteration: breaks the data into k wide chunks and sorting them
      # in pairs using sort_two_sorted_arrays
      sorted_array = []
      loop do
        break if array == []

        array1 = array[0..(k-1)].to_a
        array2 = array[k..(2*k-1)].to_a #we require to_a as, if k is too large, these will initialize to nil
        array = array[2*k..-1].to_a  #luckily, if 2k exceeds the length of array, this returns []
        sorted_array = sorted_array + sort_two_sorted_arrays(array1,array2)
      end
      sorted_array
    end

    def smallest_power_of_2 (num)
      k = 0
      while 2**k < num do
        k+=1
      end
      k
    end



    def sort(array)
      k = 0
      until k == smallest_power_of_2(array.length) do
        array = sort_pass(array, 2**k)
        k +=1
      end
      array
    end

  end
end



sorter = SortingSuite::MergeSort.new
sorter.sort(%w{d b a c})
