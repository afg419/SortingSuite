require 'minitest'
require_relative '../lib/merge_sort'
require 'pry'

class TestMergeSort < Minitest::Test
  def test_class_exist
    assert SortingSuite::MergeSort
  end

  def test_it_does_single_sort_pass_with_integer_array
    sortable = SortingSuite::MergeSort.new
    assert_equal [1,4,5,6,3,5], sortable.sort_pass([4,5,1,6,3,5],2)
  end

  def test_it_does_single_sort_pass_with_string_array
    sortable = SortingSuite::MergeSort.new
    assert_equal %w{alpha beta delta gamma alpha} , sortable.sort_pass(%w{beta alpha delta gamma alpha},1)
  end

  def test_it_sorts_empty
    sortable = SortingSuite::MergeSort.new
    assert_equal [] , sortable.sort([])
  end

  def test_it_sorts_with_integersort_with_integers
    sortable = SortingSuite::MergeSort.new
    assert_equal [1,1,2,3,4,5],sortable.sort([4,3,2,1,5,1])
  end

  def test_it_sorts_with_lots_of_integers_in_reverse
    sortable = SortingSuite::MergeSort.new
    assert_equal (0..100).to_a + [100], sortable.sort((0..100).to_a.reverse + [100])
  end

  def test_it_sorts_with_lots_of_random_integers
    random_list = []
    10.times do
      random_list.push(rand(0..100))
    end
    assert_equal random_list.sort , SortingSuite::MergeSort.new.sort(random_list)
  end

end
