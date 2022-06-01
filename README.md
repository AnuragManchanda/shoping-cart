# shoping-cart

# Requiremnts
computer store. You have been engaged to build the checkout system. We will start with the following products in our catalogue

SKU	Name	Price
ipd	Super iPad	$549.99
mbp	MacBook Pro	$1399.99
atv	Apple TV	$109.50
vga	VGA adapter	$30.00
As we're launching our new computer store, we would like to have a few opening day specials.

we're going to have a 3 for 2 deal on Apple TVs. For example, if you buy 3 Apple TVs, you will pay the price of 2 only
the brand new Super iPad will have a bulk discounted applied, where the price will drop to $499.99 each, if someone buys more than 4
we will bundle in a free VGA adapter free of charge with every MacBook Pro sold
As our Sales manager is quite indecisive, we want the pricing rules to be as flexible as possible as they can change in the future with little notice.

Our checkout system can scan items in any order.

The interface to our checkout looks like this (shown in java):

  Checkout co = new Checkout(pricingRules);
  co.scan(item1);
  co.scan(item2);
  co.total();
Your task is to implement a checkout system that fulfils the requirements described above.

Example scenarios
SKUs Scanned: atv, atv, atv, vga Total expected: $249.00

SKUs Scanned: atv, ipd, ipd, atv, ipd, ipd, ipd Total expected: $2718.95

SKUs Scanned: mbp, vga, ipd Total expected: $1949.98

# setup steps
You need to have ruby(any version) installed to run this project
Gems used 'json' and 'yaml'

To run console application: ruby app/main.rb
To run test cases: ruby tests/test.rb


# Project Structure
> database direcotry could be changed to actual key value store datase like mongo db
> json file is used to contain all products (products.json)
> promotion rules are defined as a configurable class which takes params from rules.json
> main program takes product input from user one by one and give result when number 1 is entered
> test directory is for having all unit test cases
