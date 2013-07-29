class NumberCalculator < ActiveRecord::Base
  def calculate
    self.format_number
    if self.valid_input?
      power = 0
      sum = 0
      self.number.reverse.each_char do |digit|
        sum = sum + ((self.base**power) * self.number_for_digit(digit))
        power += 1
      end
      self.result = sum.to_s
    end
    return result
  end

protected
  def valid_input?
    if self.base.nil?
      self.result = "You must enter a base for the number system"
      return false
    end
    if self.base > 37
      self.result = "Sorry, we only calculate up to 37 base numbering " +
                    "systems at this time"
      return false
    end

    self.number.each_char do |digit|
      if self.number_for_digit(digit) >= self.base
        self.result = "The number entered contains digits larger than or" +
                      " equal to the base, which is not valid"
        return false
      end
    end
    return true
  end

  def format_number
    self.number = self.number.downcase.gsub /\W+/, ''
  end

  def number_for_digit(digit)
    i = self.alpha_array.index(digit)
    return (i.nil? ? digit.to_i : i)
  end

  def alpha_array
    return ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p",
            "q","r","s","t","u","v","w","x","y","z"]
  end
end
