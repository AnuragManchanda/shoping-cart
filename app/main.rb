require 'yaml'
require 'byebug'
require_relative './../model/product'
require_relative './checkout'

# Start Server
def start_server
  products = Product.get
  cart_arr = []
  loop do
    puts 'Scan/Enter item or enter 1 to calculate'
    input_item = gets.chomp
    puts Checkout.process(cart_arr) && return if input_item == '1'

    if products[input_item]
      cart_arr << input_item
    else
      puts 'Item is not present. Retry'
    end
  end
end



start_server
