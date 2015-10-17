require 'minitest'
require_relative '../lib/merge2_sort'
require 'pry'

class TestMergeSort < Minitest::Test
  def test_class_exist
    assert SortingSuite::Merge2Sort
  end

  def test_do_I_understand_recursion_with_addition
    def add(i,j)
      if j == 0
        i
      else
        add(i.succ,j.pred)
      end
    end
    assert_equal 15+74 , add(15,74)
  end

  def test_base_case
    sortable = SortingSuite::Merge2Sort.new
    assert_equal %w{alpha} , sortable.sort(%w{alpha})
  end

  def test_with_single_merge
    sortable = SortingSuite::Merge2Sort.new
    assert_equal [1,2] ,sortable.sort([2,1])
  end

  def test_sort_with_lots_of_integers
    sortable = SortingSuite::Merge2Sort.new
    assert_equal (0..100).to_a + [100], sortable.sort((0..100).to_a.reverse + [100])
  end

  def test_sort_with_lots_of_random_integers
    random_list = []
    10.times do
      random_list.push(rand(0..100))
    end
    assert_equal random_list.sort , SortingSuite::Merge2Sort.new.sort(random_list)
  end

end
