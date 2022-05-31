require 'json'
require_relative '../config/config'

# Product model
class Product
  def self.get
    file = File.read(Config.get['paths']['products'])
    JSON.parse(file)
  end
end
