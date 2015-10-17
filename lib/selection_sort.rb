require_relative 'swap_methods'  # => true

module SortingSuite
  class SelectionSort

    include SwapMethods  # => InsertionSort

    def sort(array)
      sorted_array = []
      loop do
        sorted_array << array.min!
      end

    end


    def sort_pass(array)
      #identifies the (first instance of the) minimum element, and removes it from the array
      min = array[0]
      min_index = 0

      array.each_index do |i|
        if array[i] < min
          min = array[i]
          min_index = i
        end
      end

      array.slice!(min_index)

    end

    def sort(array)
      sorted_array = []
      until array.length == 0 do
        sorted_array << sort_pass(array)
      end
      sorted_array
    end

  end
end
# >> 2
# >> 1
# >>
# >> true
