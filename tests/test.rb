require 'byebug'
require_relative './../app/checkout'

tests = [
  # {
  #   name: 'test 1',
  #   cart: %w[atv ipd ipd atv ipd ipd ipd],
  #   expected: 2718.95
  # },
  # {
  #   name: 'test 2',
  #   cart: %w[ipd ipd ipd],
  #   expected: 549.99 * 3
  # },
  # {
  #   name: 'test 3',
  #   cart: %w[ipd ipd ipd ipd],
  #   expected: 499.99 * 4
  # },
  {
    name: 'test 4',
    cart: %w[mbp vga ipd],
    expected: 1949.98
  },

]

tests.each do |test|
  puts "Running #{test[:name]}"
  got = Checkout.process(test[:cart])
  expected = test[:expected]
  if got == expected
    puts 'Passed'
  else
    puts "Got: #{got}"
    puts "Expected: #{expected}"
  end
end
