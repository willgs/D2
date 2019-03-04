# Define RunProspectors class
class RunProspectors
  def run_prospectors(search, helpers, packaged, places, random)
    prospectors = packaged[0]
    turns = packaged[1]
    counter = 1
    prospectors.times do
      puts 'Rubyist ' + counter.to_s + ' starting in ' + places[0].instance_variable_get('@name')
      day = 0
      real_total = 0
      fake_total = 0
      location = places[0]
      turn_counter = 0
      turns.times do
        # Extract instance variables
        name = location.instance_variable_get('@name')
        mrubs = location.instance_variable_get('@mrubs')
        neighbors = location.instance_variable_get('@neighbors')

        # Search for rubies at each location until real and fake rubies come back 0, then return significat totals
        totals = search.search_rubies(helpers, name, mrubs[0], mrubs[1], random)

        # These are the significant totals, increment them for each location
        real_total += totals[0]
        fake_total += totals[1]
        day += totals[2]
        turn_counter += 1

        # Set location to next place, print unless this prospector is done
        nextplace = neighbors[random.rand(0..neighbors.length - 1)]
        location = places.find { |place| place.instance_variable_get('@name') == nextplace }
        puts 'Heading from ' + name + ' to ' + nextplace unless turn_counter == turns
      end

      strs = helpers.prints(day, counter, real_total, fake_total)
      puts strs[0]
      puts strs[1]
      counter += 1
    end
  rescue NoMethodError
    'Arguments prospectors and turns must be integers'
  rescue TypeError
    'Arguments places must be an array of type Place'
  end
end
