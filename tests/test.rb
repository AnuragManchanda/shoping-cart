require_relative './../app/checkout'

tests = [
  {
    name: 'test 1',
    cart: %w[atv ipd ipd atv ipd ipd ipd],
    expected: 2718.95
  },
  {
    name: 'test 2',
    cart: %w[ipd ipd ipd],
    expected: 549.99 * 3
  },
  {
    name: 'test 3',
    cart: %w[ipd ipd ipd ipd],
    expected: 499.99 * 4
  },
  {
    name: 'test 4',
    cart: %w[mbp vga ipd],
    expected: 1949.98
  },
  {
    name: 'test 5',
    cart: %w[atv atv atv vga],
    expected: 249.00
  },
  {
    name: 'test 6',
    cart: %w[],
    expected: 0.0
  }
]

passed_count = 0
failed_count = 0

tests.each do |test|
  puts "\nRunning #{test[:name]}"
  got = Checkout.process(test[:cart])
  expected = test[:expected]
  if got == expected
    passed_count += 1
    puts 'Passed'
  else
    failed_count += 1
    puts "Got: #{got}"
    puts "Expected: #{expected}"
  end
end

puts "\n\nPassed: #{passed_count}, Failed: #{failed_count}"
