require_relative 'swap_methods'  # => true

module SortingSuite
  class BubbleSort

    include SwapMethods  # => BubbleSort

    def sort_pass(array)
      array.each_index do |i|
        if (i+1) < array.length && need_swap?(array,i,i+1)
          swap(array,i,i+1)
        end
      end
      array
    end

    def sort(array)
      until sorted?(array) do
        sort_pass(array)
      end
      array
    end

  end
end
# >> 2
# >> 1
# >>
# >> true
