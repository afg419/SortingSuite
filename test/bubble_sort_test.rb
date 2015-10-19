require 'minitest'
require_relative '../lib/bubble_sort'
require 'pry'

class TestBubbleSort < Minitest::Test
  def test_it_exists
    assert SortingSuite::BubbleSort
  end

  def test_it_does_single_sort_pass_with_integer_array
    sortable = SortingSuite::BubbleSort.new
    assert_equal [3,2,1,4,1,5], sortable.sort_pass([4,3,2,1,5,1])
  end

  def test_it_does_single_sort_pass_with_string_array
    sortable = SortingSuite::BubbleSort.new
    assert_equal %w{ alpha beta delta epsilon gamma } , sortable.sort_pass(["delta","alpha","beta","gamma","epsilon"])
  end

  def test_it_sorts_empty
    sortable = SortingSuite::BubbleSort.new
    assert_equal [] , sortable.sort([])
  end

  def test_it_sorts_with_integers
    sortable = SortingSuite::BubbleSort.new
    assert_equal [1,1,2,3,4,5],sortable.sort([4,3,2,1,5,1])
  end

  def test_it_sorts_with_lots_of_integers_in_reverse
    sortable = SortingSuite::BubbleSort.new
    assert_equal (0..100).to_a + [100], sortable.sort((0..100).to_a.reverse + [100])
  end

  def test_it_sorts_with_lots_of_random_integers
    random_list = []
    10.times do
      random_list.push(rand(0..100))
    end
    assert_equal random_list.sort , SortingSuite::BubbleSort.new.sort(random_list)
  end

end
