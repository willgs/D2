require 'minitest/autorun'
require_relative 'helpers'
require_relative 'place'

class HelpersTest < Minitest::Test

# TEST FOR METHOD add_places
# As this method does the same thing every time and takes no arguments it does not
# make senes to partition it, instead we will test a variable of element from the
# returned array once.  There is no reasonable way the result should be 
# different accross different executions 

def test_add_places_no_partition
  helper = Helpers.new
  places = helper.add_places
  assert_equal 'Nil Town', places[2].instance_variable_get('@name')
end

# UNIT TESTS FOR METHOD plural_rub(rubies)
# Equivalence classes:
# x= -INFINITY..-1 -> returns nil
# x= 0 or a non-number -> returns  'rubies'
# x= 2..INFINITY or a non-number -> returns 'rubies'
# x= 1 -> returns 'ruby'

# If a negative value is given for rubies, then nil is returned
# EDGE CASE
  def test_negative_rubies
    helper = Helpers.new
    rubies = helper.plural_rub(-1)
    assert_nil(rubies)
  end

# If 1 is given for rubies, then 'ruby' is returned
# EDGE CASE
def test_one_ruby
  helper = Helpers.new
  rubies = helper.plural_rub(1)
  assert_equal 'ruby', rubies 
end

# If 0 is given for rubies, then 'rubies' is returned
# EDGE CASE
def test_zero_rubies
  helper = Helpers.new
  rubies = helper.plural_rub(0)
  assert_equal 'rubies', rubies 
end

# If a non number is given for rubies, the rescue result of 'Non-integer argument given' is returned
def test_non_number_rubies
  helper = Helpers.new
  rubies = helper.plural_rub('not a number')
  assert_equal 'Non-integer argument given', rubies 
end

# If 2 is given for rubies, then 'rubies' is returned
def test_two_rubies
  helper = Helpers.new
  rubies = helper.plural_rub(2)
  assert_equal 'rubies', rubies 
end

# UNIT TESTS FOR METHOD prints(day, counter, real_total, fake_total)
# SUCCESS CASES: All variables are integers and can be stringified, real_total and fake_total are non-negative
# FAILURE CASES: If day or counter is nil, that area is blank
#                If real_total or fake_total is anything except a non-negative integer, that area is blank

# Test the success case with valid inputs, test the first returned argument
def test_valid_args_result_one
  helper = Helpers.new
  strs = helper.prints(3, 4, 2, 3)
  assert_equal 'After 3 days, Rubyist 4 found:
      2 real rubies.
      3 fake rubies.', strs[0]
end

# Test the success case with real_total less than 10, compare the second returned argument
def test_valid_args_result_two_sad
  helper = Helpers.new
  strs = helper.prints(3, 4, 2, 3)
  assert_equal 'Going home sad.', strs[1]
end

# Test the success case with real_total equal to 10, compare the second returned argument
# EDGE CASE 
def test_valid_args_result_two_victorious
  helper = Helpers.new
  strs = helper.prints(3, 4, 10, 3)
  assert_equal 'Going home victorious!', strs[1]
end

# Test the success case with real_total equal to 0, compare the second returned argument
# EDGE CASE
def test_valid_args_result_two_empty
  helper = Helpers.new
  strs = helper.prints(3, 4, 0, 3)
  assert_equal 'Going home empty handed.', strs[1]
end

# Test the failure case with a nil input, that area will be left blank in the string
def test_invalid_args_nil
  helper = Helpers.new
  strs = helper.prints(3, nil, 2, 3)
  assert_equal 'After 3 days, Rubyist  found:
      2 real rubies.
      3 fake rubies.', strs[0]
end

# Test the failure case with a real_total negative input, will return an error message
def test_invalid_args_negative
  helper = Helpers.new
  strs = helper.prints(3, 4, -2, 3)
  assert_equal 'Error building final result string, all arguments must be integers, real_total and fake_total must be non-negative', strs
end

end