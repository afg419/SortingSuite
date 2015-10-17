require_relative 'bubble_sort'
require_relative 'insertion_sort'
require_relative 'merge_sort'
require_relative 'merge2_sort'
require 'pry'

# benchmark = SortingSuite::Benchmark.new
# benchmark.time(SortingSuite::InsertionSort, [3,3,4,5,1])


module SortingSuite
  class Benchmark

    def timer(name_of_sort_algorithm, array)

      initial = Time.new

      if name_of_sort_algorithm == SortingSuite::BubbleSort

        SortingSuite::BubbleSort.new.sort(array)

      end

      if name_of_sort_algorithm == SortingSuite::InsertionSort

        SortingSuite::InsertionSort.new.sort(array)

      end

      if name_of_sort_algorithm == SortingSuite::MergeSort

        SortingSuite::MergeSort.new.sort(array)

      end

      if name_of_sort_algorithm == SortingSuite::Merge2Sort

        SortingSuite::Merge2Sort.new.sort(array)

      end

      final = Time.new

      return final - initial

    end

    def time(name_of_sort_algorithm, array)
      puts "#{name_of_sort_algorithm} took #{timer(name_of_sort_algorithm, array)} seconds."
    end

    def compare(array)
      times = {}
      times["BubbleSort"] = timer(SortingSuite::BubbleSort, array)
      times["InsertionSort"] = timer(SortingSuite::InsertionSort, array)
      times["MergeSort"] = timer(SortingSuite::MergeSort, array)
      times["Merge2Sort"] = timer(SortingSuite::Merge2Sort, array)
      binding.pry
      times = times.sort {|a,b| a[0] <=> b[0]}
      binding.pry
      times
    end

    def fastest(array)
      puts "#{compare(array)[0][0]} is the fastest"
    end

    def slowest(array)
      puts "#{compare(array)[-1][0]} is the slowest"
    end

  end
end

random_list = []
2500.times do
  random_list.push(rand(0..1000))
end
#

benchmark = SortingSuite::Benchmark.new
benchmark.time(SortingSuite::BubbleSort,random_list)
benchmark.time(SortingSuite::InsertionSort,random_list)
benchmark.time(SortingSuite::MergeSort,random_list)
benchmark.time(SortingSuite::Merge2Sort,random_list)
benchmark.fastest(random_list)
benchmark.slowest(random_list)




#Don't run this on an array with length > 2000 without commenting out bubble sort!
#Overall, it seems the recursive implementation of merge sort ("merge2")
#is fastest by a factor of 10 over the nonrecursive merge sort when testing on
#a 5000 long array.  I'm guessing this is because I check sorted? each iteration
# of the merge sort in the nonrecursive implementation.
