require_relative 'errors'

class InputChecker
  include Errors

  def initialize(args)
    @length    = args.fetch(:length, 4)
    @uppercase = args.fetch(:uppercase, true)
    @lowercase = args.fetch(:lowercase, true)
    @number    = args.fetch(:number, true)
    @special   = args.fetch(:special, true)
    check_validity
  end

  def valid_params
    { length:    @length,
      uppercase: @uppercase,
      lowercase: @lowercase,
      number:    @number,
      special:   @special }
  end

  private

  def check_validity
    check_length
    check_uppercase
    check_lowercase
    check_number
    check_special
    check_if_all_false
  end

  def check_if_all_false
    raise ALL_FALSE_ERROR if @uppercase == false &&
                             @lowercase == false &&
                             @number    == false &&
                             @special   == false
  end

  def check_length
    only_integer_error
    valid_range_error
  end

  def check_uppercase
    only_boolean_error(@uppercase)
  end

  def check_lowercase
    only_boolean_error(@lowercase)
  end

  def check_number
    only_boolean_error(@number)
  end

  def check_special
    only_boolean_error(@special)
  end

  def only_boolean_error(value)
    raise ONLY_BOOLEAN_ERROR unless !!value == value #convert value into boolean and compare it with the original value
  end

  def only_integer_error
    raise ONLY_INTEGER_ERROR unless @length.is_a? Integer
  end

  def valid_range_error
    raise INVALID_RANGE_ERROR if @length < 4 || @length > 99
  end

end
