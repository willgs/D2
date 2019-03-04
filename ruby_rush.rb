require_relative 'place'
require_relative 'helpers'
require_relative 'search_rubies'
require_relative 'run_prospectors'
if (ARGV.count != 3) || (!ARGV[0].to_i.is_a? Integer) ||
   (!ARGV[1].to_i.is_a? Integer) || (ARGV[1].to_i < 0) ||
   (!ARGV[2].to_i.is_a? Integer) || (ARGV[2].to_i < 0)
  raise 'Enter integers for seed, number of prospectors (non-negative), and
    number of turns (non-negative)'
end
seed = ARGV[0].to_i
prospectors = ARGV[1].to_i
turns = ARGV[2].to_i
# Use this to access all our places throughout
places = Helpers.new.add_places
random = Random.new seed
RunProspectors.new.run_prospectors(SearchRubies.new, Helpers.new, [prospectors, turns], places, random)
