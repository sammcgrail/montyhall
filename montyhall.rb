scenarios = [%w(car goat goat), %w(goat car goat), %w(goat goat car)]

count_1, count_2 = 0, 0
n = 1_000_000

n.times do
  current_scenario = scenarios.sample
  pick = 0
  if current_scenario[pick] == 'goat'
    goat_index = current_scenario.slice(1..2).find_index('goat') + 1
  else
    goat_index = current_scenario.find_index('goat')
  end
  car_index = current_scenario.find_index('car')

  # Strategy 1 -- Staying with the original pick
  stay_pick = pick
  count_1 += 1 if stay_pick == car_index

  # Strategy 2 -- Switching doors
  switch_pick = current_scenario.length - goat_index
  count_2 += 1 if switch_pick == car_index
end

acc_1 = 100 * count_1 / n.to_f
acc_2 = 100 * count_2 / n.to_f

puts
puts 'A comparison of the staying vs. switching strategies for Monty Hall'
puts '---------------------------------------------------------------------'
puts 'Strategy 1 -- Staying   : ' + '%.0f' % sprintf('%d', acc_1) + '%'
puts 'Strategy 2 -- Switching : ' + '%.0f' % sprintf('%d', acc_2) + '%'
