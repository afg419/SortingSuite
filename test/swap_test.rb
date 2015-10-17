require_relative '../lib/swap_methods'
require 'minitest'

class TestSwapMethods < Minitest::Test

  include SwapMethods

  def test_it_swaps_when_i_less_than_j
    array = [2,1,4,3]
    assert_equal [1,2,4,3] , swap(array,0,1)
  end

  def test_it_swaps_when_i_greater_than_j
    array = [2,1,4,3]
    assert_equal [1,2,4,3] , swap(array,1,0)
  end

  def test_it_knows_when_not_to_swap
    array = [1,2]
    refute need_swap?(array,0,1)
  end

  def test_it_knows_when_to_swap
    array = [2,1]
    assert need_swap?(array,0,1)
  end

  def test_it_knows_when_its_sorted
    array = [1,2,3,4,5]
    assert sorted?(array)
  end

  def test_it_knows_when_it_isnt_sorted
    array = [2,1,30,4,5]
    refute sorted?(array)
  end

  def test_it_can_merge_two_sorted_arrays_into_one
    array1 = [1,3,5,7,9]
    array2 = [2,4,6,8]
    assert_equal [1,2,3,4,5,6,7,8,9] , sort_two_sorted_arrays(array1,array2)
  end
end

# ~> LoadError
# ~> cannot load such file -- ./array_swap
# ~>
# ~> /Users/aarongreenspan/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/aarongreenspan/.rvm/rubies/ruby-2.2.1/lib/ruby/site_ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
# ~> /Users/aarongreenspan/turing/1module/Projects/Project1_Sorting/test_swap.rb:1:in `<main>'
