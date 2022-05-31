require_relative './../model/rule'
require_relative './../model/product'

class Checkout
  def self.process(cart_arr)

    cart = {}
    cart_arr.each do |item|
      if cart[item].nil?
        cart[item] = 1
      else
        cart[item] += 1
      end
    end

    products = Product.get
    @rules = Rule.new.rules

    amount = 0
    discount = 0
    cart.each do |item, quantity|
      amount += quantity * products[item]['price']
      @rules[item].each do |rule|
        discount += Rule.get_discount(rule, cart, item)
      end unless @rules[item].nil?
    end

    puts "#{amount} - #{discount} = #{(amount - discount)}"
    # puts "Total Amount: #{(amount - discount)}"
    (amount - discount).to_f / 100
  end
end
