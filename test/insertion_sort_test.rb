require 'minitest'
require_relative '../lib/insertion_sort'
require 'pry'

class TestInsertionSort < Minitest::Test
  def test_class_exist
    assert SortingSuite::InsertionSort
  end

  def test_sort_pass_with_integer_array
    sortable = SortingSuite::InsertionSort.new
    assert_equal [2,3,4,6,1,5], sortable.sort_pass([2,4,6,3,1,5],3)
  end

  def test_sort_pass_with_string_array
    sortable = SortingSuite::InsertionSort.new
    assert_equal %w{alpha beta delta gamma epsilon} , sortable.sort_pass(["alpha","delta","beta","gamma","epsilon"],2)
  end

  def test_sort_with_integers
    sortable = SortingSuite::InsertionSort.new
    assert_equal [1,1,2,3,4,5],sortable.sort([4,3,2,1,5,1])
  end

  def test_sort_with_lots_of_integers
    sortable = SortingSuite::InsertionSort.new
    assert_equal (0..100).to_a + [100], sortable.sort((0..100).to_a.reverse + [100])
  end

  def test_sort_with_lots_of_random_integers
    random_list = []
    10.times do
      random_list.push(rand(0..100))
    end
    assert_equal random_list.sort , SortingSuite::InsertionSort.new.sort(random_list)
  end

end
