require 'pry'  # => true

  module SwapMethods
    def swap(array,i,j)
      temp = array[j]
      array[j] = array[i]
      array[i] = temp
      array
    end

    def need_swap?(array,i,j)
      array[[i,j].min] != [array[i],array[j]].min   # => true
    end                                          # => true

    def sorted?(array) #Needs work! <---
      sorted = true
      array.each_index do |i|
        if i+1 < array.length && need_swap?(array,i,i+1)
          sorted = false
        end
      end
      sorted
    end

    def sort_two_sorted_arrays(array1,array2)
      sorted_array = []
      loop do
        if array1 == [] || array2 == []
          sorted_array = sorted_array + array2 + array1
          break
        end

        if array1[0] > array2[0]
          sorted_array << array2.shift
        else
          sorted_array << array1.shift
        end
      end

      sorted_array.compact
    end

  end
# A = [2,1]  # => [2, 1]
#
# include SwapMethods  # => Object
#
# puts A[[0,1].min]       # => nil
# puts [A[0],A[1]].min    # => nil
# puts need_swap?(A,0,1)  # => nil
#
# puts A[[0,1].min] != [A[0],A[1]].min  # => nil

# >> 2
# >> 1
# >>
# >> true
