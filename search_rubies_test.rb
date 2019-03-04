require 'minitest/autorun'
require_relative 'search_rubies'
class SearchRubiesTest < Minitest::Test

# UNIT TESTS FOR METHOD search_rubies(helpers, name, mrealrub, mfakerub, random)
# SUCCESS CASES: name is a string, mrealrub and mfakerub are non-negative integers, random is a Random object
#                name is a non-string, mrealrub and mfakerub are non-negative integers, random is a Random object
#FAILURE CASES: If mrealrub or mfakerub are negative integers, return error message
#               If mrealrub or mfakerub are non-integers
#               If random is not a Random object, return error message

# Test the success case.
# The value returned should always be [43, 43, 28] because the seed never changes
def test_success_case
  random = Random.new 10
  mock_helper = Minitest::Mock.new("helpers")
  def mock_helper.plural_rub(x); 'rub(y)(ies)'; end

  results = SearchRubies.new.search_rubies(mock_helper, "Name", 3, 4, random)
  assert_equal [43, 43, 28], results
  end

# Test the success case when name is not a string
# returned result is correct even though the output would appear to be inccorrect
def test_success_case_name
  random = Random.new 10
  mock_helper = Minitest::Mock.new("helpers")
  def mock_helper.plural_rub(x); 'rub(y)(ies)'; end

  results = SearchRubies.new.search_rubies(mock_helper, 10, 3, 4, random)
  assert_equal [43, 43, 28], results
  end

# Test the failure case when mrealrub is a negative integer
# An error message will be returned
def test_failure_case_negative_integer
  random = Random.new 10
  mock_helper = Minitest::Mock.new("helpers")
  def mock_helper.plural_rub(x); 'rub(y)(ies)'; end

  results = SearchRubies.new.search_rubies(mock_helper, "NAME", -3, 4, random)
  assert_equal 'Arguments mrealrub and mfakerub must be non-negative integers', results
  end

# Test the failure case when mrealrub is non-integer
# Again an error message will be returned
def test_failure_case_non_integer
  random = Random.new 10
  mock_helper = Minitest::Mock.new("helpers")
  def mock_helper.plural_rub(x); 'rub(y)(ies)'; end

  results = SearchRubies.new.search_rubies(mock_helper, "NAME", "fail", 4, random)
  assert_equal 'Arguments mrealrub and mfakerub must be non-negative integers', results
  end

# Test the failure case when random is not a Random object
# Different type of error, so different error message
def test_failure_case_non_random
  random = Random.new 10
  mock_helper = Minitest::Mock.new("helpers")
  def mock_helper.plural_rub(x); 'rub(y)(ies)'; end

  results = SearchRubies.new.search_rubies(mock_helper, "NAME", 3, 4, "fail")
  assert_equal 'Argument random must be of type Random', results
  end
end
