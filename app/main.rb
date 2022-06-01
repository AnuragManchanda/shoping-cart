require_relative './../model/product'
require_relative './checkout'
require 'byebug'

products = Product.get
cart_arr = []
puts

loop do
  puts 'Scan/Enter item or enter 1 to calculate'
  input_item = gets.chomp
  if input_item == '1'
    puts "$#{Checkout.process(cart_arr)}"
    break
  end

  if products[input_item]
    cart_arr << input_item
  else
    puts 'Item is not present. Retry'
  end
end
