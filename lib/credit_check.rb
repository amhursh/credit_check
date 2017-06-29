class CreditCheck

  def initialize(card_number)
    @card_number = card_number.to_s
  end

  def convert_c_c_to_account_identifier
    account_identifier = []
    @card_number.each_char { |num| account_identifier << num.to_i }
    account_identifier
  end

  def double_every_other_account_identifier_digit
    convert_c_c_to_account_identifier.reverse.map.with_index do |num, index|
      if index.odd? then num = num * 2
      else num
      end
    end
  end

  def map_split_summed_values
    double_every_other_account_identifier_digit.reverse.map do |num|
      number_splitter_sum(num)
    end
  end

  def number_splitter_sum(num)
    if num > 9
      num = num - 9
    else
      num
    end
  end

  def final_results_summed
    map_split_summed_values.reverse.inject do |sum, num|
      sum + num
    end
  end

  def is_the_cc_num_valid?
    if (final_results_summed % 10) == 0
      puts "The number is valid."
    else
      puts "The number is invalid."
    end
  end

end
