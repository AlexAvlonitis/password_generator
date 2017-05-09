## What is it
password_generator is a program made in ruby than can generate a password based on options we can supply, like length, uppercase, lowercase, number and special characters.

## How to use
```ruby
generator = PasswordGenerator.build(length: 6)
generator.create_password
```
Available options: length(between 4 and 99), uppercase(boolean), lowercase(boolean), number(boolean), special(boolean).

At least one option should be passed, if an option is not passed it will default to true and the length to 4.

Options can be passed with any order.

## Irb Example
```ruby
[1] pry(main)> require_relative 'lib/password_generator'
=> true
[2] pry(main)> generator = PasswordGenerator.build(length: 10, uppercase: false)
=> #<PasswordGenerator:0x0055ea9f0f9788
 @password_maker=
  #<PasswordMaker:0x0055ea9f0f97b0
   @input_checker=#<InputChecker:0x0055ea9f0f97d8 @length=10, @lowercase=true, @number=true, @special=true, @uppercase=false>>>
[3] pry(main)> generator.create_password
=> "t0h3wl2@nk"
```

## Testing
* navigate in the root of the folder
* run: bundle install
* run for unit testing: rspec
* run for feature test: rspec spec/features/*
