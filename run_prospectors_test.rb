require 'minitest/autorun'
require_relative 'run_prospectors'
require_relative 'place'
class RunProspectorsTest < Minitest::Test

# UNIT TESTS FOR METHOD run_prospectors(search, helpers, prospectors, turns, places, random)
# SUCCESS CASES: prospectors is a non-negative integer, turns is a non-negative integer, places is an array of
# initialized Place objects, random a Random object
# FAILURE CASES: If prospectors or turns is a negative integer or non-integer, return error message
#                If places is not an array of type Place, return error message

# Test the success case with both the search and the help mocked
# The prospectors and turns are non-negative integers, not zero in this case
# random is a Random object
# The value returned should always be 2 because the seed never changes
def test_success_case_non_zero
  random = Random.new 10
  mock_helper = Minitest::Mock.new("helpers")
  def mock_helper.plural_rub(x); 'rub(y)(ies)'; end
  def mock_helper.prints(a,b,c,d); 'printin...'; end
  mock_search = Minitest::Mock.new("search")
  def mock_search.search_rubies(a,b,c,d,e); [1,2,3]; end
  places = [
    Place.new('Enumerable Canyon', ['Monkey Patch City', 'Nil Town'], 1, 1),
    Place.new('Monkey Patch City', ['Enumerable Canyon', 'Nil Town'], 1, 1),
    Place.new('Nil Town', ['Enumerable Canyon', 'Monkey Patch City'], 0, 3)
  ]
  results = RunProspectors.new.run_prospectors(mock_search, mock_helper, [2, 3], places, random)
  assert_equal 2, results
  end

  # Test the success case with prospectors equal to 0
  # EDGE CASE
  def test_success_case_zero
    random = Random.new 10
    mock_helper = Minitest::Mock.new("helpers")
    def mock_helper.plural_rub(x); 'rub(y)(ies)'; end
    def mock_helper.prints(a,b,c,d); 'printin...'; end
    mock_search = Minitest::Mock.new("search")
    def mock_search.search_rubies(a,b,c,d,e); [1,2,3]; end
    places = [
      Place.new('Enumerable Canyon', ['Monkey Patch City', 'Nil Town'], 1, 1),
      Place.new('Monkey Patch City', ['Enumerable Canyon', 'Nil Town'], 1, 1),
      Place.new('Nil Town', ['Enumerable Canyon', 'Monkey Patch City'], 0, 3)
    ]
    results = RunProspectors.new.run_prospectors(mock_search, mock_helper, [0, 3], places, random)
    assert_equal 0, results
    end

  # Test the failure case with prospectors as a non-integer
  # Will return the rescue error message
  def test_success_case_non_integer
    random = Random.new 10
    mock_helper = Minitest::Mock.new("helpers")
    def mock_helper.plural_rub(x); 'rub(y)(ies)'; end
    def mock_helper.prints(a,b,c,d); 'printin...'; end
    mock_search = Minitest::Mock.new("search")
    def mock_search.search_rubies(a,b,c,d,e); [1,2,3]; end
    places = [
      Place.new('Enumerable Canyon', ['Monkey Patch City', 'Nil Town'], 1, 1),
      Place.new('Monkey Patch City', ['Enumerable Canyon', 'Nil Town'], 1, 1),
      Place.new('Nil Town', ['Enumerable Canyon', 'Monkey Patch City'], 0, 3)
    ]
    results = RunProspectors.new.run_prospectors(mock_search, mock_helper, ["fail", 3], places, random)
    assert_equal 'Arguments prospectors and turns must be integers', results
    end

  # Test the failure case with place as a string
  # Will return the rescue error message
  def test_success_case_non_integer
    random = Random.new 10
    mock_helper = Minitest::Mock.new("helpers")
    def mock_helper.plural_rub(x); 'rub(y)(ies)'; end
    def mock_helper.prints(a,b,c,d); 'printin...'; end
    mock_search = Minitest::Mock.new("search")
    def mock_search.search_rubies(a,b,c,d,e); [1,2,3]; end
    places = [
      Place.new('Enumerable Canyon', ['Monkey Patch City', 'Nil Town'], 1, 1),
      Place.new('Monkey Patch City', ['Enumerable Canyon', 'Nil Town'], 1, 1),
      Place.new('Nil Town', ['Enumerable Canyon', 'Monkey Patch City'], 0, 3)
    ]
    results = RunProspectors.new.run_prospectors(mock_search, mock_helper, [2, 3], "fail", random)
    assert_equal 'Arguments places must be an array of type Place', results
    end
end
