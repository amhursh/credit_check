require './credit_check'

print "Please enter a credit card number that you would like to check. > "
credit_card = CreditCheck.new(gets.chomp)
credit_card.is_the_cc_num_valid?
