# Define Helpers class
class Helpers
  def add_places
    places = [
      Place.new('Enumerable Canyon', ['Monkey Patch City', 'Duck Type Beach'], 1, 1),
      Place.new('Monkey Patch City', ['Nil Town', 'Matzburgh', 'Enumerable Canyon'], 1, 1),
      Place.new('Nil Town', ['Hash Crossing', 'Monkey Patch City'], 0, 3),
      Place.new('Hash Crossing', ['Matzburgh', 'Dynamic Palisades', 'Nil Town'], 2, 2),
      Place.new('Matzburgh', ['Duck Type Beach', 'Dynamic Palisades', 'Monkey Patch City', 'Hash Crossing'], 3, 0),
      Place.new('Dynamic Palisades', ['Hash Crossing', 'Matzburgh'], 2, 2),
      Place.new('Duck Type Beach', ['Enumerable Canyon', 'Matzburgh'], 2, 2)
    ]

    places
  end

  # Determine if we need the word rubies or ruby
  def plural_rub(rubies)
    ret = if rubies == 1
            'ruby'
          elsif rubies < 0 # No logical reason for negative rubies
            nil
          else
            'rubies'
          end
    ret
  rescue ArgumentError
    'Non-integer argument given'
  end

  def prints(day, counter, real_total, fake_total)
    final = 'After ' + day.to_s + ' days, Rubyist ' + counter.to_s + ' found:
      ' + real_total.to_s + ' real ' + plural_rub(real_total) + '.
      ' + fake_total.to_s + ' fake ' + plural_rub(fake_total) + '.'
    result = if real_total > 9
               'Going home victorious!'
             elsif real_total.zero?
               'Going home empty handed.'
             else
               'Going home sad.'
             end
    [final, result]
  rescue TypeError
    'Error building final result string, all arguments must be integers, real_total and fake_total must be non-negative'
  end
end
