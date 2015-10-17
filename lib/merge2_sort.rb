require 'pry'
require_relative 'swap_methods'

module SortingSuite
  class Merge2Sort
    include SwapMethods  # => BubbleSort

    def sort(array)
        if array.length <= 1
          return array
        end
        array1 = sort(array.slice!(0,array.length/2)) #So basically, what happens is the lines of code that split
        array2 = sort(array)                          #the array for the first time, are also the lines of code that
        sort_two_sorted_arrays(array1, array2)        # merge the final two arrays.  This last command of
    end                                               # sort_two_sorted_arrays waits to go until array1 and 2 are
                                                      #completey reconstructed via lower merges.
  end
end
sorter = SortingSuite::Merge2Sort.new
sorter.sort(%w{d b a c})
