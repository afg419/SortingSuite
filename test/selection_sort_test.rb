require 'minitest'
require_relative '../lib/selection_sort'
require 'pry'

class TestSelectionSort < Minitest::Test
  def test_class_exist
    assert SortingSuite::SelectionSort
  end

  def test_it_does_single_sort_pass_with_integer_array
    sortable = SortingSuite::SelectionSort.new
    assert_equal 1, sortable.sort_pass([2,4,6,3,1,5])
  end

  def test_it_does_single_sort_pass_with_string_array
    sortable = SortingSuite::SelectionSort.new
    assert_equal "alpha", sortable.sort_pass(["alpha","delta","beta","gamma","epsilon"])
  end

  def test_it_sorts_with_integers
    sortable = SortingSuite::SelectionSort.new
    assert_equal [1,1,2,3,4,5],sortable.sort([4,3,2,1,5,1])
  end

  def test_it_sorts_with_lots_of_integers_in_reverse
    sortable = SortingSuite::SelectionSort.new
    assert_equal (0..100).to_a + [100], sortable.sort((0..100).to_a.reverse + [100])
  end

  def test_it_sorts_with_lots_of_random_integers
    random_list = []
    10.times do
      random_list.push(rand(0..100))
    end
    assert_equal random_list.sort , SortingSuite::SelectionSort.new.sort(random_list)
  end

end
