require 'json'
require_relative '../config/config'
require_relative './../model/product'

# Rule model
class Rule

  DEFINED_RULES = {
    'buy_x_pay_y' => true,
    'bulk_discount' => true,
    'free_second_item_on_first' => true
  }

  PRODUCTS = Product.get

  def initialize
    file = File.read(Config.get['paths']['rules'])
    @rules = JSON.parse(file)
  end

  def rules
    @rules
  end

  def self.get_discount(rule, cart, item)
    rule_type = rule.first[0]
    if DEFINED_RULES[rule_type].nil?
      puts "Error: Rule not defined: #{rule_type}"
      return
    end
    Rule.send("apply_#{rule_type}", cart, item, rule[rule_type])
  end

  def self.apply_buy_x_pay_y(cart, item, params)
    (cart[item] / params['buy']) * (params['buy'] - params['pay']) * PRODUCTS[item]["price"]
  end

  def self.apply_bulk_discount(cart, item, params)
    if cart[item] >= params['min_count']
      cart[item] * (PRODUCTS[item]["price"] - params['price'])
    else
      0
    end
  end

  def self.apply_free_second_item_on_first(cart, item, free_item)
    [cart[item], cart[free_item]].min * PRODUCTS[free_item]["price"]
  end
end
