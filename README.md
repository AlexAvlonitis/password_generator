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
