# Define SearchRubies class
class SearchRubies
  # Search for rubies at each place unitl 0 real or fake are found
  def search_rubies(helpers, name, mrealrub, mfakerub, random)
    name = 'default name' unless name.is_a?(String)

    real_total = 0
    fake_total = 0
    day = 0
    loop do
      realrub = random.rand(0..mrealrub)
      fakerub = random.rand(0..mfakerub)
      if fakerub.zero? && !realrub.zero?
        found_st = '    Found ' + realrub.to_s + ' real ' + helpers.plural_rub(realrub) + ' in ' + name
      elsif realrub.zero? && !fakerub.zero?
        found_st = '    Found ' + fakerub.to_s + ' fake ' + helpers.plural_rub(fakerub) + ' in ' + name
      elsif !realrub.zero? && !fakerub.zero?
        s = '    Found ' + realrub.to_s + ' real ' + helpers.plural_rub(realrub) + ' and ' + fakerub.to_s + ' fake '
        t = helpers.plural_rub(fakerub) + ' in ' + name
        found_st = s + t
      else
        found_st = '    Found no rubies or fake rubies in ' + name
      end
      puts found_st
      day += 1
      real_total += realrub
      fake_total += fakerub
      break if realrub.zero? && fakerub.zero?
    end

    # Return significant totals
    totals = [real_total, fake_total, day]
    totals
  rescue ArgumentError
    'Arguments mrealrub and mfakerub must be non-negative integers'
  rescue NoMethodError
    'Argument random must be of type Random'
  end
end
