require_relative 'password_maker'

class PasswordGenerator

  def self.build(args)
    new(PasswordMaker.build(args))
  end

  def initialize(password_maker)
    @password_maker = password_maker
  end

  def create_password
    password_maker_call
  end

  private
  attr_reader :password_maker

  def password_maker_call
    password_maker.generate
  end

end
