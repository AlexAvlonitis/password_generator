require_relative 'input_checker'

class PasswordMaker

  SPECIAL_CHARS = ["!", "$", "%", "&", "*", "@", "^"].freeze

  def self.build(args)
    new(InputChecker.new(args))
  end

  def initialize(input_checker)
    @input_checker = input_checker
  end

  def generate
    create_password
  end

  private
  attr_reader :input_checker

  def create_password
    password_array = Array.new
    password_array += uppercase_array if uppercase_array
    password_array += lowercase_array if lowercase_array
    password_array += number_array if number_array
    password_array += special_chars_array if special_chars_array
    finalize_and_shuffle_array(password_array)
  end

  def finalize_and_shuffle_array(password_array)
    password_array.shuffle[1..length].join
  end

  def uppercase_array
    ('A'..'Z').to_a if uppercase
  end

  def lowercase_array
    ('a'..'z').to_a if lowercase
  end

  def number_array
    (0..9).to_a if number
  end

  def special_chars_array
    SPECIAL_CHARS if special
  end

  def length
    input_checker.valid_params[:length]
  end

  def uppercase
    input_checker.valid_params[:uppercase]
  end

  def lowercase
    input_checker.valid_params[:lowercase]
  end

  def number
    input_checker.valid_params[:number]
  end

  def special
    input_checker.valid_params[:special]
  end
end
