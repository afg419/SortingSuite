require_relative 'swap_methods'  # => true

module SortingSuite
  class InsertionSort

    include SwapMethods  # => InsertionSort

    def sort_pass(array,k)
      # k represents the kth iteration of insertion sort:
      # we compare array[k] to the previous k elements

      array[0..k] = sort_two_sorted_arrays(array[0..(k-1)],[array[k]])
      array
    end

    def sort(array)
      k = 1
      until sorted?(array) do
        sort_pass(array,k)
        k +=1
      end
      array
    end

  end
end
# >> 2
# >> 1
# >>
# >> true
